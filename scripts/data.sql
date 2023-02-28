INSERT INTO Acteur (nom, prenom, dateNaissance, sexe)
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

INSERT INTO Auteur (nom)
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

INSERT INTO Expression (expression)
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

INSERT INTO Film (nom, Auteurid) 
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

INSERT INTO Personnage (pseudo, Filmid, Acteurid) 
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

INSERT INTO Plateau (nom) 
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

