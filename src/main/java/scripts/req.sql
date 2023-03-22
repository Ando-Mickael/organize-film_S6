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
    FOR row IN SELECT Sceneid , plateau, duree , PlateauID FROM listeScene where filmID = IDFilm order by Sceneid LOOP
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