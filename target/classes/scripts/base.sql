-- tables
CREATE TABLE Acteur (
	id SERIAL NOT NULL,
	nom varchar(255),
	prenom varchar(255),
	dateNaissance date,
	sexe varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Auteur (
	id SERIAL NOT NULL,
	nom varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE DetailsScene (
	id SERIAL NOT NULL,
	action varchar(255),
	texte text,
	debut float4,
	fin float4,
	Sceneid int4 NOT NULL,
	Expressionid int4 NOT NULL,
	Personnageid int4 NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Expression (
	id SERIAL NOT NULL,
	expression varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

CREATE TABLE Film (
	id SERIAL NOT NULL,
	nom varchar(255),
	Auteurid int4 NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Personnage (
	id SERIAL NOT NULL,
	pseudo varchar(255),
	Filmid int4 NOT NULL,
	Acteurid int4 NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Plateau (
	id SERIAL NOT NULL,
	nom varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE Scene (
	id SERIAL NOT NULL,
	nom varchar(255),
	duree float4,
	Plateauid int4 NOT NULL,
	Filmid int4 NOT NULL,
	PRIMARY KEY (id)
);

create table IndisponibiliteActeur (
    id serial primary key,
    acteurId int references Acteur(id),
    date date
);

create table IndisponibilitePlateau (
    id serial primary key,
    plateauId int references Plateau(id),
    date date
);

-- constraints
ALTER TABLE
	Personnage
ADD
	FOREIGN KEY (Filmid) REFERENCES Film (id);

ALTER TABLE
	Personnage
ADD
	FOREIGN KEY (Acteurid) REFERENCES Acteur (id);

ALTER TABLE
	DetailsScene
ADD
	FOREIGN KEY (Sceneid) REFERENCES Scene (id);

ALTER TABLE
	DetailsScene
ADD
	FOREIGN KEY (Expressionid) REFERENCES Expression (id);

ALTER TABLE
	Scene
ADD
	FOREIGN KEY (Plateauid) REFERENCES Plateau (id);

ALTER TABLE
	Scene
ADD
	FOREIGN KEY (Filmid) REFERENCES Film (id);

ALTER TABLE
	DetailsScene
ADD
	FOREIGN KEY (Personnageid) REFERENCES Personnage (id);

ALTER TABLE
	Film
ADD
	FOREIGN KEY (Auteurid) REFERENCES Auteur (id);

ALTER table Scene add datePlanification timestamp;

-- types
CREATE TYPE agendaType AS (
    IdScene INT,
    idPlateau INT,
    plateau varchar(255),
    duree float4,
    jour INT
);

-- views
create or REPLACE view listeScene as
select 
    s.filmid as filmID,
    p.id as PlateauID ,
    p.nom as Plateau ,
    s.id as Sceneid,
    s.duree as duree,
    s.datePlanification as datePlanification
    from Scene s
    join Plateau p on p.id = s.Plateauid
    group by p.id , p.nom , s.id , s.filmid;

-- functions
CREATE OR REPLACE FUNCTION agendaScene(IDFilm INTEGER)
RETURNS SETOF agendaType AS $$
DECLARE
    dureeTravaille INT := 480;
    dureeTotal INT := 0;
    jour INT := 0; 
    row RECORD;
BEGIN
    FOR row IN SELECT Sceneid , plateau, duree , PlateauID , datePlanification FROM listeScene where filmID = IDFilm order by PlateauID LOOP
        IF row.datePlanification IS NULL THEN
            dureeTotal := dureeTotal + row.duree;
            IF dureeTotal > dureeTravaille THEN
                jour := jour + 1;
                dureeTotal := row.duree;
            END IF;
            RETURN NEXT (row.Sceneid , row.PlateauID ,row.plateau, row.duree, (jour) :: INT);
        END IF;
    END LOOP;
END;
$$
LANGUAGE plpgsql;


create or replace view v_plateau_indispo_now as (
	select * from indisponibiliteplateau i where date = date(now())
);

create or replace view v_acteur_indispo_now as (
	select * from indisponibiliteacteur i where date = date(now())
);
