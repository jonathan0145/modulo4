/*1 respuesta*/ 
select * from movies where year = 1963 limit 30;

/*2 respuesta*/
select count(*) from movies where year = 1982;

/*3 respuesta*/
select * from actors where last_name like "%stack%";

/*4 respuesta*/
SELECT first_name,
    last_names,
    COUNR(*) AS total
    FROM actors
    GROUP BY LOWER(first_name),
    LOWER(last_name)
    ORDER BY total DESC
    LIMIT 10;

/*5 respuesta*/
SELECT genre.
COUNT(*) AS total
FROM movies_genres
GROUP BY genre
ORDER BY total;

/*6 respuesta*/
SELECT genre,
    COUNT(*) AS total
    FROM movies_genres
    GROUP BY genre
    ORDER BY total;

/*7 respuesta*/
SELECT actors.first_name, actors.last_name
FROM actors
    JOIN roles ON actors.id = roles.actor_id
    JOIN movies ON movies.id = roles.movie_id
where movies.name = 'Braveheart' AND movies.year = 1995 ORDER BY actors.last_name;

/*8 respuesta*/

SELECT d.first_name, d.last_name, m.name, m.year FROM directors AS directors AS directors AS d
    JOIN movies_directors AS md ON md.movie_id = d.id
    JOIN movies AS m ON md.director_id = m.id
    JOIN movies_genres AS mg ON m.id = mg.movie_id
    WHERE mg.genre = 'Film-Noir' AND m.year % 4 = 0
    ORDER BY m.name;

/*9 respuesta*/

/*10 respuesta*/
SELECT r.actor_id
FROM roles AS r
JOIN movies AS m ON r.movie_id = m.id
WHERE m.year < 1900

SELECT * FROM actors
WHERE id IN (
    SELECT r.actor_id
FROM roles AS r
JOIN movies AS m ON r.movie_id = m.id
WHERE m.year < 1900
) AND id IN (
    SELECT r.actor_id
    FROM roles AS r
    JOIN movies AS m ON r.movie_id = m.id
    where m.year > 2000
) limit 20;

/*11 respuesta*/
SELECT a.first_name, a.last_name, m.name, COUNT(DISTINCT(role)) AS total_roles
FROM actors AS a
JOIN roles AS r ON a.id = r.actor_id
JOIN movies AS m ON r.movie_id = m.id
WHERE m.year > 1990
GROUP  BY a.id, m.id
HAVING total_roles > 5;

/*12 respuesta*/
SELECT r.movie_id
FROM roles AS r
JOIN actors AS a ON r.actor_id = a.id
WHERE gender = 'M'

SELECT year, COUNT(id) AS total
FROM movies
WHERE id NOT IN (
    SELECT r.movie_id
    FROM roles AS r
    JOIN actors AS a ON r.actor_id = a.id
    where gender = 'M'
)
GROUP BY year limit 30;
