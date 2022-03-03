SELECT species.id AS specy_id, species.scientific_name AS specy_scientific_name, species AS specy_common_name, family.name AS family
FROM species
JOIN family ON species.family_id=family.id;