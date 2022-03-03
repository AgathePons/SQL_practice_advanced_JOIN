SELECT species.*, family.name AS family  FROM species JOIN family ON species.family_id=family.id ORDER BY family;

SELECT variety.*, species.scientific_name AS specy_scientific_name, species AS specy_common_name, family.name AS family
FROM variety
JOIN species ON variety.species_id=species.id
JOIN family ON species.family_id=family.id
WHERE variety.species_id=3;
-- ########### sous-requêtes
-- 1
SELECT AVG(variety.juiciness) AS juciness_avg, variety.species_id FROM variety GROUP BY species_id ;
-- 2 
SELECT juciness_avg, species_id
FROM 
(SELECT AVG(variety.juiciness) AS juciness_avg, variety.species_id AS species_id FROM variety GROUP BY species_id) 
AS avg_table
WHERE juciness_avg > 2.5;
--2.2
SELECT species_id
FROM 
(SELECT AVG(variety.juiciness) AS juciness_avg, variety.species_id AS species_id FROM variety GROUP BY species_id) 
AS avg_table
WHERE juciness_avg > 2.5;
--3
SELECT * FROM
species,
(SELECT species_id
FROM 
(SELECT AVG(variety.juiciness) AS juciness_avg, variety.species_id AS species_id FROM variety GROUP BY species_id) 
AS avg_table
WHERE juciness_avg > 2.5) AS juicy_species_id;

-- 1 but with more infos
SELECT AVG(variety.juiciness) AS juciness_avg, species.id AS species_id, species.scientific_name AS specy_scientific_name, species AS specy_common_name
FROM variety
JOIN species ON variety.species_id=species.id
GROUP BY species.id;


-- ########### jointures
--1
SELECT species.scientific_name AS specy_scientific_name, species AS specy_common_name, family.name AS family
FROM species
JOIN family ON species.family_id=family.id;
--2.1
SELECT variety.species_id FROM variety WHERE juiciness=5 GROUP BY species_id;
--2.2
SELECT with_juicy_5.species_id, scientific_name, common_name, family_id
FROM (SELECT variety.species_id FROM variety WHERE juiciness=5 GROUP BY species_id) AS with_juicy_5
INNER JOIN species ON with_juicy_5.species_id=species.id;





SELECT variety.species_id, species.* FROM variety WHERE juiciness=5 GROUP BY species_id
JOIN species ON variety.species_id=species.id;

SELECT * FROM variety WHERE  
SELECT variety.*, species.scientific_name AS specy_scientific_name, species AS specy_common_name, family.name AS family
FROM variety
JOIN species ON variety.species_id=species.id
JOIN family ON species.family_id=family.id
WHERE variety.species_id=2;

SELECT * FROM family;
SELECT * FROM species;
SELECT * FROM variety;
SELECT * FROM row;
SELECT * FROM field;