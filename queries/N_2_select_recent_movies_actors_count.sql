SELECT
    m.movie_id AS id,
    m.title,
    COUNT(c.character_id) AS actors_count
FROM
    Movie m
    JOIN Character c ON m.movie_id = c.movie_id
WHERE
    m.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY
    m.movie_id,
    m.title;
