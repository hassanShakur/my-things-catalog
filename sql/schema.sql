CREATE DATABASE IF NOT EXISTS my_things_catalog;

-- \c my_things_catalog

-- Create Books table
CREATE TABLE IF NOT EXISTS books (
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(200) NOT NULL,
    cover_state VARCHAR(100) NOT NULL,
    genre VARCHAR(100) REFERENCES genres(name),
    author VARCHAR(100) REFERENCES authors(first_name),
    source VARCHAR(100) REFERENCES sources(name),
    label VARCHAR(100) REFERENCES labels(title),
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id)
);


-- Create Games table
CREATE TABLE IF NOT EXISTS games (
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN NOT NULL,
    last_played_at DATE NOT NULL,
    genre VARCHAR(100) REFERENCES genres(name),
    author VARCHAR(100) REFERENCES authors(first_name),
    source VARCHAR(100) REFERENCES sources(name),
    label VARCHAR(100) REFERENCES labels(title),
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id)
);


-- Create Music Albums table
CREATE TABLE IF NOT EXISTS music_albums (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    genre VARCHAR(100) REFERENCES genres(name),
    author VARCHAR(100) REFERENCES authors(first_name),
    source VARCHAR(100) REFERENCES sources(name),
    label VARCHAR(100) REFERENCES labels(title),
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id)
);


-- Create Labels table
CREATE TABLE IF NOT EXISTS labels (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    items INT REFERENCES (books, music_albums, movies, games),
    PRIMARY KEY(id, items)
);


-- Create Genres table
CREATE TABLE IF NOT EXISTS genres (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    items INT REFERENCES (books, music_albums, movies, games),
    PRIMARY KEY(id, items)
);


-- Create Authors table
CREATE TABLE IF NOT EXISTS authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    items INT REFERENCES (books, music_albums, movies, games),
    PRIMARY KEY(id, items)
);
