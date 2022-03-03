-- Revert orangeraie-sql:create_table from pg

BEGIN;

DROP TABLE row, field, variety, species, family;

COMMIT;
