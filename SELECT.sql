SELECT album_name, release_year
FROM Album
WHERE EXTRACT(YEAR FROM release_year) = 2018;

SELECT track_name, duration
FROM Track
WHERE duration = (SELECT MAX(duration) FROM Track);

SELECT track_name
FROM Track
WHERE duration >= 210;

SELECT collection_name
FROM Collection
WHERE release_year BETWEEN 2018 AND 2020;


SELECT singer_name
FROM Singer
WHERE singer_name NOT LIKE '% %';

SELECT track_name
FROM Track
WHERE track_name ILIKE '%мой%' OR track_name ILIKE '%my%';