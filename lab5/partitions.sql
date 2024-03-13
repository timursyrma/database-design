CREATE TABLE passenger_2002 (
    CONSTRAINT partition_check CHECK (EXTRACT(YEAR FROM date_of_birth) = 2002)
) INHERITS (passenger);

CREATE TABLE passenger_2003 (
    CONSTRAINT partition_check CHECK (EXTRACT(YEAR FROM date_of_birth) = 2003)
) INHERITS (passenger);

CREATE TABLE passenger_2004 (
    CONSTRAINT partition_check CHECK (EXTRACT(YEAR FROM date_of_birth) = 2004)
) INHERITS (passenger);

CREATE OR REPLACE FUNCTION
    insert_into_passenger_partition()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
    partition text;
    year int;
BEGIN
    year := EXTRACT(YEAR FROM new.date_of_birth);
    partition := format('passenger_%s', year);
    EXECUTE 'CREATE TABLE IF NOT EXISTS ' || partition || ' (
    CONSTRAINT partition_check CHECK ( EXTRACT(YEAR FROM date_of_birth) = ' || year::text || ')
    ) INHERITS (passenger)';
    EXECUTE 'INSERT INTO ' || partition || ' VALUES ( ($1).* )' USING new;
    RETURN NULL;
END;
$$;

CREATE OR REPLACE TRIGGER passenger_partition
BEFORE INSERT ON passenger
FOR EACH ROW EXECUTE PROCEDURE insert_into_passenger_partition();

INSERT INTO passenger SELECT * FROM ONLY passenger;

TRUNCATE ONLY passenger CASCADE;
