-- Deploy orangeraie-sql:create_table to pg

BEGIN;

CREATE TABLE family (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name text NOT NULL UNIQUE
);

CREATE TABLE species (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	scientific_name text NOT NULL UNIQUE,
	common_name text,
	family_id int NOT NULL REFERENCES family(id)
);

CREATE TABLE variety (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	cultivar text NOT NULL,
	bitterness smallint CHECK (bitterness >= 0 AND bitterness <= 5),
	juiciness smallint CHECK (juiciness >= 0 AND juiciness <= 5),
	species_id int NOT NULL REFERENCES species(id),
	UNIQUE (cultivar, species_id) -- il ne peut pas y avoir 2 cultivar du même nom pour une même espèce
);

CREATE TABLE field (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name text NOT NULL UNIQUE,
	location text
);

CREATE TABLE row (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	label text NOT NULL,
	field_id int NOT NULL REFERENCES field(id),
	variety_id int NOT NULL REFERENCES variety(id)
);

COMMIT;
