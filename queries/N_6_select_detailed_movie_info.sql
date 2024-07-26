SELECT
    m.movie_id AS id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    JSON_OBJECT('file_id', f.file_id, 'file_name', f.file_name, 'mime_type', f.mime_type, 'file_url', f.file_url) AS poster,
    JSON_OBJECT('person_id', p.person_id, 'first_name', p.first_name, 'last_name', p.last_name, 'photo', JSON_OBJECT('file_id', pf.file_id, 'file_name', pf.file_name, 'mime_type', pf.mime_type, 'file_url', pf.file_url)) AS director,
    JSON_ARRAYAGG(JSON_OBJECT('person_id', a.person_id, 'first_name', a.first_name, 'last_name', a.last_name, 'photo', JSON_OBJECT('file_id', af.file_id, 'file_name', af.file_name, 'mime_type', af.mime_type, 'file_url', af.file_url))) AS actors,
    JSON_ARRAYAGG(JSON_OBJECT('genre_id', g.genre_id, 'name', g.name, 'notes', g.notes)) AS genres
FROM
    Movie m
    JOIN Person p ON m.director_id = p.person_id
    JOIN File f ON m.poster_id = f.file_id
    JOIN Character c ON m.movie_id = c.movie_id
    JOIN Person a ON c.person_id = a.person_id
    JOIN File af ON a.primary_photo_id = af.file_id
    JOIN Genre g ON c.genre_id = g.genre_id
    JOIN File pf ON p.primary_photo_id = pf.file_id
WHERE
    m.movie_id = 1
GROUP BY
    m.movie_id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    f.file_id,
    f.file_name,
    f.mime_type,
    f.file_url,
    p.person_id,
    p.first_name,
    p.last_name,
    pf.file_id,
    pf.file_name,
    pf.mime_type,
    pf.file_url;
