# Movie Database

This repository contains the SQL scripts to create and query a movie database. The database schema and queries are designed to manage information about users, movies, genres, characters, and related entities.

## ER Diagram

The Entity-Relationship (ER) diagram for the database is as follows:

```mermaid
erDiagram
    USER {
        BIGINT user_id PK
        VARCHAR username
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email
        VARCHAR password
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    FILE {
        BIGINT file_id PK
        VARCHAR file_name
        VARCHAR mime_type
        VARCHAR file_key
        VARCHAR file_url
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    AVATAR {
        BIGINT user_id PK, FK
        BIGINT file_id PK, FK
    }
    MOVIE {
        BIGINT movie_id PK
        VARCHAR title
        TEXT description
        DECIMAL budget
        DATE release_date
        INT duration
        BIGINT country_id FK
        BIGINT director_id FK
        BIGINT poster_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    GENRE {
        BIGINT genre_id PK
        VARCHAR name
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    MOVIEGENRE {
        BIGINT movie_id PK, FK
        BIGINT genre_id PK, FK
    }
    CHARACTER {
        BIGINT character_id PK
        BIGINT movie_id FK
        VARCHAR name
        TEXT description
        ENUM role
        BIGINT person_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    PERSON {
        BIGINT person_id PK
        VARCHAR first_name
        VARCHAR last_name
        TEXT biography
        DATE date_of_birth
        ENUM gender
        BIGINT country_id FK
        BIGINT primary_photo_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    FAVORITEMOVIE {
        BIGINT user_id PK, FK
        BIGINT movie_id PK, FK
    }
    COUNTRY {
        BIGINT country_id PK
        VARCHAR name
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    USER ||--o{ AVATAR: has
    USER ||--o{ FAVORITEMOVIE: has
    FILE ||--o{ AVATAR: has
    FILE ||--o{ MOVIE: has
    FILE ||--o{ PERSON: has
    MOVIE ||--o{ MOVIEGENRE: has
    GENRE ||--o{ MOVIEGENRE: has
    MOVIE ||--o{ CHARACTER: has
    PERSON ||--o{ CHARACTER: plays
    MOVIE ||--o{ FAVORITEMOVIE: is
    COUNTRY ||--o{ PERSON: from
    COUNTRY ||--o{ MOVIE: made_in
