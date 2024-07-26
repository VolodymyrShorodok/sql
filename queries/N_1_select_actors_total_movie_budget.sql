SELECT
    p.person_id AS id,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM
    Character c
    JOIN Person p ON c.person_id = p.person_id
    JOIN Movie m ON c.movie_id = m.movie_id
GROUP BY
    p.person_id,
    p.first_name,
    p.last_name;
