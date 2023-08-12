DROP DATABASE IF EXISTS reddit_db;

CREATE DATABASE reddit_db;

\c reddit_db

-- CREATE TABLE posts(
--     title TEXT, 
--     username TEXT,
--     link TEXT
-- )

CREATE TABLE subreddits(
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL,
    description TEXT,
    subscribers INTEGER CHECK (subscribers > 0) DEFAULT 1,
    is_private BOOLEAN DEFAULT false
    );

INSERT INTO subreddits
(name, description, subscribers, is_private)
VALUES
('chicken', 'your fav page to see chicken', 250, false);