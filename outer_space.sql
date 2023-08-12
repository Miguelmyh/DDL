-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE orbits_around(
  id SERIAL PRIMARY KEY,
  orbits TEXT UNIQUE NOT NULL
);

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL UNIQUE
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL UNIQUE
);

CREATE TABLE planets_moons(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets(id) ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons(id) ON DELETE CASCADE DEFAULT NULL
);

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23 );

INSERT INTO moons (moon)
VALUES
('The moon'),
('Phobos'),
('Deimos'),
('Naiad');

INSERT INTO orbits_around (orbits)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (galaxy)
VALUES
('Milky Way');

INSERT INTO planets_moons(planet_id, moon_id)
VALUES
('1', '1'),
('1', '3'),
('2', '1');