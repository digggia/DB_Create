CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	release_date DATE NOT null CHECK (release_date > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Album(id),
	track_name VARCHAR(60) NOT NULL,
	duration_sec integer NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	singer_name VARCHAR(150) NOT null
);

CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT null UNIQUE
);

CREATE TABLE IF NOT EXISTS Genre_Singer (
	genre_id INTEGER REFERENCES Genre(id),
	singer_id INTEGER REFERENCES Singer(id),
	CONSTRAINT prim_key PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Singer_Album (
	album_id INTEGER REFERENCES Album(id),
	singer_id INTEGER REFERENCES Singer(id),
	CONSTRAINT p_key PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL,
	collection_year INTEGER NOT NULL CHECK (collection_year > 1900 AND collection_year < 2023) 
);

CREATE TABLE IF NOT EXISTS Collection_Track (
	collection_id INTEGER REFERENCES Collection(id),
	track_id INTEGER REFERENCES Track(id),
	CONSTRAINT pr_key PRIMARY KEY (collection_id, track_id)
);


