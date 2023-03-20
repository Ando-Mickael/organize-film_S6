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