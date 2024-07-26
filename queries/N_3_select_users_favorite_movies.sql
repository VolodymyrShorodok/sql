SELECT
    u.user_id AS id,
    u.username,
    JSON_ARRAYAGG(fm.movie_id) AS favorite_movie_ids
FROM
    User u
    LEFT JOIN FavoriteMovie fm ON u.user_id = fm.user_id
GROUP BY
    u.user_id,
    u.username;
