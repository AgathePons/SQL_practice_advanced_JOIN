-- Verify orangeraie-sql:create_table on pg

BEGIN;

SELECT * FROM family WHERE false;
SELECT * FROM species WHERE false;
SELECT * FROM variety WHERE false;
SELECT * FROM field WHERE false;
SELECT * FROM row WHERE false;

ROLLBACK;
