SELECT with_juicy_5.species_id, scientific_name, common_name, family_id
FROM (SELECT variety.species_id FROM variety WHERE juiciness=5 GROUP BY species_id) AS with_juicy_5
INNER JOIN species ON with_juicy_5.species_id=species.id;

-- correction
-- with doublon
SELECT species.id AS specy_id, species.scientific_name AS specy_scientific_name, species AS specy_common_name, family.name AS family
FROM species
JOIN family ON species.family_id=family.id
JOIN variety ON species.id=variety.species_id
WHERE variety.bitterness=5;
-- other solution
SELECT DISTINCT species.common_name
FROM variety
INNER JOIN species ON species.id=variety.species_id AND variety.bitterness = 5;
