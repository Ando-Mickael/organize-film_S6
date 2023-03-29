
create or REPLACE view listeScene as
select 
    s.filmid as filmID,
    p.id as PlateauID ,
    p.nom as Plateau ,
    s.id as Sceneid,
    s.duree as duree
    from Scene s
    join Plateau p on p.id = s.Plateauid
    group by p.id , p.nom , s.id , s.filmid;

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

CREATE TYPE agendaType AS (
    IdScene INT,
    idPlateau INT,
    plateau varchar(255),
    duree float4,
    jour date
);

CREATE OR REPLACE FUNCTION agendaScene(IDFilm INTEGER , dateDebut date )
RETURNS SETOF agendaType AS $$
DECLARE
    dureeTravaille INT := 480;
    dureeTotal INT := 0;
    jour INT := 0;
    row RECORD;
BEGIN
    FOR row IN SELECT Sceneid , plateau, duree , PlateauID FROM listeScene where filmID = IDFilm order by PlateauID LOOP

        FOR row IN SELECT Sceneid , plateau, duree , PlateauID FROM listeScene where filmID = IDFilm order by PlateauID LOOP
            
            dureeTotal := dureeTotal + row.duree;
            if dureeTotal > dureeTravaille then
                jour := jour + 1;
                dureeTotal := row.duree;
            end if;       
        
        END LOOP;
    
    END LOOP;
END;
$$
LANGUAGE plpgsql;


-- select * from agendaScene(8,'2023-03-29');

drop type agendaType cascade; 




CREATE OR REPLACE FUNCTION agendaScene(IDFilm INTEGER, jourPlanifie DATE)
RETURNS SETOF agendaType AS $$
DECLARE
    dureeTravaille INT := 480;
    dureeTotal INT := 0;
    jour DATE := jourPlanifie;
    plateauIndisponible BOOLEAN;
    dejatraite BOOLEAN;
    acteurIndisponible BOOLEAN;
    row RECORD;
BEGIN
    FOR row IN SELECT Sceneid, plateau, duree, PlateauID FROM listeScene WHERE filmID = IDFilm ORDER BY PlateauID LOOP
        plateauIndisponible := EXISTS(SELECT 1 FROM IndisponibilitePlateau WHERE plateauId = row.PlateauID AND date = jour);

        IF plateauIndisponible THEN
            CONTINUE; -- passe à la prochaine scène
        END IF;

        FOR row IN SELECT Sceneid , plateau, duree , PlateauID FROM listeScene where filmID = IDFilm order by PlateauID LOOP
        
            dureeTotal := dureeTotal + row.duree;
            if dureeTotal > dureeTravaille then
                jour := jour + 1;
                dureeTotal := row.duree;
            end if;       
        
            RETURN NEXT (row.Sceneid, row.PlateauID, row.plateau, row.duree, jour);

        END LOOP;

        
    END LOOP;
END;
$$ LANGUAGE plpgsql;






















CREATE TYPE agendaType AS (
    IdScene INT,
    idPlateau INT,
    plateau varchar(255),
    duree float4,
    jour INT
);

CREATE OR REPLACE FUNCTION agendaScene(IDFilm INTEGER)
RETURNS SETOF agendaType AS $$
DECLARE
    dureeTravaille INT := 480;
    dureeTotal INT := 0;
    jour INT := 0; 
    row RECORD;
BEGIN
    FOR row IN SELECT Sceneid , plateau, duree , PlateauID FROM listeScene where filmID = IDFilm order by PlateauID LOOP
        dureeTotal := dureeTotal + row.duree;
        if dureeTotal > dureeTravaille then
            jour := jour + 1;
            dureeTotal := row.duree;
        end if;
        RETURN NEXT (row.Sceneid , row.PlateauID ,row.plateau, row.duree, (jour) :: INT);
        
    END LOOP;
END;
$$
LANGUAGE plpgsql;