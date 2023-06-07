CREATE TABLE IF NOT EXISTS Album (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(60) NOT NULL,
    release_year DATE NOT NULL CHECK (release_year > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS Track (
    track_id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL REFERENCES Album(album_id),
    track_name VARCHAR(60) NOT NULL,
    duration INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
    singer_id SERIAL PRIMARY KEY,
    singer_name VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Genre_Singer (
    genre_id INTEGER REFERENCES Genre(genre_id),
    singer_id INTEGER REFERENCES Singer(singer_id),
    CONSTRAINT pk_genre_singer PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Singer_Album (
    album_id INTEGER REFERENCES Album(album_id),
    singer_id INTEGER REFERENCES Singer(singer_id),
    CONSTRAINT pk_singer_album PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Collection (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(60) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 1900 AND release_year < 2023)
);

CREATE TABLE IF NOT EXISTS Collection_Track (
    collection_id INTEGER REFERENCES Collection(collection_id),
    track_id INTEGER REFERENCES Track(track_id),
    CONSTRAINT pk_collection_track PRIMARY KEY (collection_id, track_id)
);


