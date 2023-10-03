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
WHERE track_name ~* '\m(my|мой)\M';

-- ========================

SELECT g.genre_name, COUNT(DISTINCT gs.singer_id) AS singer_count
FROM Genre g
LEFT JOIN Genre_Singer gs ON g.genre_id = gs.genre_id
GROUP BY g.genre_name;


SELECT COUNT(*) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31';


SELECT a.album_name, AVG(t.duration) AS average_duration
FROM Album a
JOIN Track t ON a.album_id = t.album_id
GROUP BY a.album_name;

SELECT s.singer_name
FROM Singer s
WHERE s.singer_id NOT IN (
    SELECT sa2.singer_id
    FROM Singer_Album sa2
    JOIN Album a2 ON sa2.album_id = a2.album_id
    WHERE a2.release_year = '2020-01-01'
);


SELECT c.collection_name
FROM Collection c
JOIN Collection_Track ct ON c.collection_id = ct.collection_id
JOIN Track t ON ct.track_id = t.track_id
JOIN Album a ON t.album_id = a.album_id
JOIN Singer_Album sa ON a.album_id = sa.album_id
JOIN Singer s ON sa.singer_id = s.singer_id
WHERE s.singer_name = 'Adele';

-- ========================

SELECT DISTINCT a.album_name
FROM Album a
JOIN Singer_Album sa ON a.album_id = sa.album_id
JOIN Singer s ON sa.singer_id = s.singer_id
JOIN Genre_Singer gs ON s.singer_id = gs.singer_id
GROUP BY a.album_name, s.singer_id
HAVING COUNT(DISTINCT gs.genre_id) > 1;

SELECT t.track_name
FROM Track t
LEFT JOIN Collection_Track ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;

SELECT s.singer_name
FROM Singer s
JOIN Singer_Album sa ON s.singer_id = sa.singer_id
JOIN Track t ON sa.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Track);

SELECT a.album_name
FROM Album a
JOIN (
    SELECT album_id, COUNT(*) AS track_count
    FROM Track
    GROUP BY album_id
    HAVING COUNT(*) = (
        SELECT MIN(track_count)
        FROM (
            SELECT COUNT(*) AS track_count
            FROM Track
            GROUP BY album_id
        ) AS counts
    )
) AS min_tracks ON a.album_id = min_tracks.album_id;

