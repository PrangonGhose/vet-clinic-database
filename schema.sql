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

-- Create new tables
CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(250),
	age INT,
	PRIMARY KEY(id)
);

CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	PRIMARY KEY(id)
);

-- Remove column from animals table
ALTER TABLE animals DROP COLUMN species;

-- Add species_id column and set to foreign key
ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

-- Add owner_id column and set to foreign key
ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owners(id);