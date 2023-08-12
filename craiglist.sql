DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    state VARCHAR(20) UNIQUE NOT NULL,
    city VARCHAR(20) NOT NULL,
    zip_code INTEGER UNIQUE NOT NULL
);

INSERT INTO regions (state, city, zip_code)  
VALUES
('New York', 'Corona', 11368);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    id_prefer_reg INTEGER REFERENCES regions(id) NOT NULL DEFAULT 1
);

INSERT INTO users (username, id_prefer_reg)
VALUES 
('Mcquacker', 1);

CREATE TABLE regions_users(
    id SERIAL PRIMARY KEY,
    id_region INTEGER REFERENCES regions(id) NOT NULL,
    id_user INTEGER REFERENCES users(id) NOT NULL
);

INSERT INTO regions_users (id_region, id_user)
VALUES
(1,1);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(99) NOT NULL,
    text TEXT,
    id_regions_users INTEGER REFERENCES regions_users(id)
);

INSERT INTO posts (title, text, id_regions_users)
VALUES
('Hello World', 'This is my first post', 1);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category VARCHAR(30) UNIQUE NOT NULL,
    id_post INTEGER REFERENCES posts(id)
);

INSERT INTO categories (category, id_post) 
VALUES
('HTML', 1);


------SELECT username FROM users JOIN regions_users
--- ON users.id = id_user WHERE regions_users.id IN 
---(SELECT posts.id_regions_users FROM posts WHERE title = 'Hello World');