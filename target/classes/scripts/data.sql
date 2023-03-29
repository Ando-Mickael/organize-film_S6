INSERT INTO
    Acteur (nom, prenom, dateNaissance, sexe)
VALUES
    ('Smith', 'Will', '1968-09-25', 'M'),
    ('Roberts', 'Julia', '1967-10-28', 'F'),
    ('DiCaprio', 'Leonardo', '1974-11-11', 'M'),
    ('Jolie', 'Angelina', '1975-06-04', 'F'),
    ('Damon', 'Matt', '1970-10-08', 'M'),
    ('Kidman', 'Nicole', '1967-06-20', 'F'),
    ('Hanks', 'Tom', '1956-07-09', 'M'),
    ('Streep', 'Meryl', '1949-06-22', 'F'),
    ('Depp', 'Johnny', '1963-06-09', 'M'),
    ('Lawrence', 'Jennifer', '1990-08-15', 'F');

INSERT INTO
    Auteur (nom)
VALUES
    ('Camus'),
    ('Hemingway'),
    ('Orwell'),
    ('Dostoevsky'),
    ('Tolstoy'),
    ('Poe'),
    ('Garcia Marquez'),
    ('Borges'),
    ('Nabokov'),
    ('Kafka');

INSERT INTO
    Expression (expression)
VALUES
    ('Sourire'),
    ('Rire'),
    ('Grincer des dents'),
    ('Froncer les sourcils'),
    ('Cligner des yeux'),
    ('Hausser les sourcils'),
    ('Siffler'),
    ('Tirer la langue'),
    ('Faire un clin d oeil'),
    ('Pleurer');

INSERT INTO
    Film (nom, Auteurid)
VALUES
    ('Le Parrain', 1),
    ('Inception', 2),
    ('Forrest Gump', 3),
    ('La La Land', 4),
    ('Le Seigneur des Anneaux', 5),
    ('Fight Club', 6),
    ('Le Silence des Agneaux', 7),
    ('Interstellar', 8),
    ('Les Evades', 9),
    ('Titanic', 10);

INSERT INTO
    Personnage (pseudo, Filmid, Acteurid)
VALUES
    ('Vito Corleone', 1, 1),
    ('Dom Cobb', 2, 1),
    ('Forrest Gump', 3, 1),
    ('Mia Dolan', 4, 2),
    ('Frodon Sacquet', 5, 3),
    ('Tyler Durden', 6, 4),
    ('Hannibal Lecter', 7, 4),
    ('Cooper', 8, 5),
    ('Andy Dufresne', 9, 6),
    ('Jack Dawson', 10, 7);

INSERT INTO
    Plateau (nom)
VALUES
    ('Stage 24'),
    ('Pinewood Studios'),
    ('Cinecittà'),
    ('Universal Studios Hollywood'),
    ('Warner Bros. Studios'),
    ('Shepperton Studios'),
    ('Babelsberg Studio'),
    ('Fox Studios Australia'),
    ('Ealing Studios'),
    ('The Burbank Studios');

INSERT INTO
    scene (nom, duree, plateauid, filmid)
VALUES
    ('course', 15.0, 8, 8),
    ('poursuite', 30.0, 5, 8),
    ('suspense', 10.0, 4, 8),
    ('trahison', 5.0, 9, 8),
    ('retrouvaille', 20.0, 3, 8),
    ('combat', 30.0, 1, 8),
    ('trsitesse', 10.0, 4, 8);

INSERT INTO
    detailsscene (
        "action",
        texte,
        debut,
        fin,
        sceneid,
        expressionid,
        personnageid
    )
VALUES
    ('sortir une arme', NULL, 0.0, 2.0, 1, 9, 8),
    (
        'regarder son adversaire',
        'vien ici si tu ose',
        3.0,
        10.0,
        1,
        8,
        8
    ),
    (
        'repondre a la provocation',
        'j arrive',
        11.0,
        18.0,
        1,
        2,
        6
    ),
    (
        'regarder le combat',
        'arreter s il vous plait',
        19.0,
        25.0,
        4,
        3,
        4
    ),
    ('coupe une main', 'tien', 26.0, 30.0, 7, 3, 6),
    ('se coupe une main', 'argh', 30.0, 35.0, 1, 3, 8),
    ('se precipite ', 'noonnnn', 35.0, 40.0, 7, 10, 4),
    (
        'poser une question',
        'pas encore reveiller',
        41.0,
        50.0,
        6,
        1,
        1
    ),
    (
        'repondre a la question',
        'comme tu le vois',
        51.0,
        60.0,
        6,
        2,
        2
    ),
    (
        'poser une question',
        'ou il est?',
        60.0,
        70.0,
        4,
        1,
        1
    ),
    (
        'repondre a la question',
        'je ne peut pas te le dire',
        71.0,
        80.0,
        4,
        4,
        2
    ),
    (
        'aller recuperer son amie',
        'lets go',
        0.0,
        45.0,
        6,
        4,
        10
    ),
    ('trouver son amie', 'ou il est', 45.0, 75.0, 6, 4, 10),
    ('arriver a l aeroport', 'enfin', 45.0, 80.0, 6, 1, 9),
    ('trouver son amie', 'ou il est', 81.0, 120.0, 6, 4, 9),
    ('rencontre', '', 121.0, 150.0, 1, 4, 9),
    ('rencontre', '', 151.0, 170.0, 1, 4, 10),
    ('voyager', 'lets go', 171.0, 651.0, 6, 4, 10);