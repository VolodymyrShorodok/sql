SELECT
    p.person_id AS director_id,
    CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    AVG(m.budget) AS average_budget
FROM
    Movie m
    JOIN Person p ON m.director_id = p.person_id
GROUP BY
    p.person_id,
    p.first_name,
    p.last_name;
