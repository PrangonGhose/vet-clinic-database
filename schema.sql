-- create database
CREATE DATABSE vet_clinic;

-- enter database
\c vet_clinic

-- create table
CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL,
	PRIMARY KEY(id)
);

-- add species column
ALTER TABLE animals
ADD species VARCHAR(250);