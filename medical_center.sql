DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE hospitals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE, 
    city TEXT NOT NULL 
);

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    age INTEGER NOT NULL, 
    specialty TEXT DEFAULT 'general practicioner'
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);

CREATE INDEX idx_disease ON diseases(disease);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    age INTEGER NOT NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE,
    description TEXT
);

CREATE INDEX age_idx ON patients(age);

CREATE TABLE hospitals_doctors(
    id SERIAL PRIMARY KEY,
    medical_id INTEGER REFERENCES hospitals ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE medication(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);