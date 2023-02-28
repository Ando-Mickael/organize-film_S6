create table Admin (
    id serial primary key,
    email varchar(100) unique,
    mdp varchar(100)
);

create table Auteur (
    id serial primary key,
    pseudo varchar(100) unique,
    email varchar(100) unique,
    mdp varchar(100)
);

create table Type (
    id serial primary key,
    intitule varchar(100)
);

create table Publication (
    id serial primary key,
    titre varchar(100),
    photo varchar(100),
    description text,
    date_debut date,
    date_fin date,
    type varchar(100),
    statut int,
    id_auteur int references Auteur(id),
    date_creation date,
    date_publication date
);

