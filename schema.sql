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

-- Create vets Table
CREATE TABLE vets (
	ID INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	age INT,
	date_of_graduation DATE
);

-- Create specializations Table
CREATE TABLE specializations (
	vet_id INT,
	species_id INT
);

-- Create visits Table
CREATE TABLE visits (
	vet_id INT,
	animal_id INT,
	date_of_visit DATE
);