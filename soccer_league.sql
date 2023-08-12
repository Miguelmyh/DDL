DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    club TEXT UNIQUE NOT NULL,
    stadium VARCHAR(30) NOT NULL,
    num_players INT
);

INSERT INTO teams (club, stadium, num_players)
VALUES
('Real Madrid', 'Santiago Bernabeu', 20);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    position VARCHAR(3) NOT NULL ----soccer 3 chars----
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    team1 TEXT NOT NULL,
    team2 TEXT NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    yr VARCHAR(9) UNIQUE NOT NULL,
    start_date DATE UNIQUE NOT NULL,
    end_date DATE UNIQUE NOT NULL
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    id_match INTEGER REFERENCES matches(id) ON DELETE CASCADE,
    id_player INTEGER REFERENCES players(id) ON DELETE CASCADE,
    goals INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE teams_players(
    id SERIAL PRIMARY KEY,
    id_team INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    id_player INTEGER REFERENCES players(id) ON DELETE CASCADE
);

CREATE TABLE matches_referees(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches(id) ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referees(id) ON DELETE CASCADE
);

CREATE TABLE standings(
    id SERIAL PRIMARY KEY,
    id_team INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    id_season INTEGER REFERENCES seasons(id) ON DELETE CASCADE,
    ranking INTEGER NOT NULL
);