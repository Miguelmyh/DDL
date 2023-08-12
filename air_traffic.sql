-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE seats(
  id SERIAL PRIMARY KEY,
  seat VARCHAR(3) UNIQUE NOT NULL
);

INSERT INTO seats(seat)
VALUES
('2A'),
('20D'),
('13F'),
('50O'),
('7I'),
('35D');

CREATE TABLE departures(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL
);

INSERT INTO departures(departure)
VALUES
('2018-04-08 09:00:00') ;

CREATE TABLE arrivals(
  id SERIAL PRIMARY KEY,
  arrival TIMESTAMP NOT NULL
);

INSERT INTO arrivals (arrival)
VALUES
('2018-04-08 12:00:00');

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline TEXT UNIQUE NOT NULL
);

INSERT INTO airlines (airline)
VALUES
('UNITED');

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  country TEXT UNIQUE NOT NULL
);

INSERT INTO countries (country)
VALUES
('Japan'),
('United States');

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  city TEXT UNIQUE NOT NULL
);

INSERT INTO cities (city)
VALUES
('Tokyo'),
('San Francisco');

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL UNIQUE,
  last_name  TEXT NOT NULL UNIQUE,
  seat INTEGER REFERENCES seats(id) ON DELETE CASCADE ON UPDATE CASCADE,
  departure INTEGER REFERENCES departures(id) ON DELETE CASCADE ON UPDATE CASCADE,
  arrival INTEGER REFERENCES arrivals(id) ON DELETE CASCADE ON UPDATE CASCADE,
  airline INTEGER REFERENCES airlines(id) ON DELETE CASCADE ON UPDATE CASCADE,
  from_city INTEGER REFERENCES cities(id) ON DELETE CASCADE ON UPDATE CASCADE,
  from_countRY INTEGER REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE,
  to_city  INTEGER REFERENCES cities(id) ON DELETE CASCADE ON UPDATE CASCADE,
  to_country INTEGER REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', 4, 1, 1, 1, 1, 2, 1, 2);
  -- ('Waneta', 'Skeleton', 2,'', '', '', '', '', '', ''),
  -- ('Thadeus', 'Gathercoal', 3, '', '', '', '', '', '', ''),
  -- ('Alvin', 'Leathes', 4, '', '', '', '', '', '', ''),
  -- ('Berkie', 'Wycliff', 1, '', '', '', '', '', '', ''),
  -- ('Cory', 'Squibbes', 1, '', '', '', '', '', '', '');