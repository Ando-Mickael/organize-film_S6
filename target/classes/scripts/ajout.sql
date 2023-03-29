ALTER table Scene add datePlanification timestamp;

-- Reynolds' modif
alter table scene rename column datePlanification to dateplanning;
alter table scene add auteurid int default 1;
alter table scene add foreign key (auteurid) references auteur(id);
alter table scene add ordre int default 1;
alter table scene add status int default 0;
-- 

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