CREATE DATABASE IF NOT EXISTS my_things_catalog;

-- \c my_things_catalog

-- Create Books table
CREATE TABLE IF NOT EXISTS books (
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(200) NOT NULL,
    cover_state VARCHAR(100) NOT NULL,
    genre VARCHAR(100),
    author VARCHAR(100),
    source VARCHAR(100),
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
    items INT REFERENCES books,
    PRIMARY KEY(id)
);
