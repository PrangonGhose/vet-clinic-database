-- Day 1

-- query 1
SELECT * FROM animals WHERE name LIKE '%mon';

-- query 2
SELECT name FROM animals WHERE date_of_birth > '2016-01-01' AND date_of_birth < '2019-12-31';

-- query 3
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

-- query 4
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- query 5
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- query 6
SELECT * FROM animals WHERE neutered = 'true';

-- query 7
SELECT * FROM animals WHERE name != 'Gabumon';

-- query 8
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

-- Day 2

-- Begin transaction
BEGIN WORK;

-- Update species
UPDATE animals
SET species = 'Unspecified';

-- Confirm change
SELECT * FROM animals;

-- Rollback
ROLLBACK;

-- Confirm change
SELECT * FROM animals;

-- Commit transaction
COMMIT;

-- New transaction to add species data
BEGIN WORK;
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

-- Verify changes
SELECT * FROM animals;

-- New transaction to delete entire table data and Rollback
BEGIN WORK;
DELETE FROM animals;
ROLLBACK;

-- Verify changes
SELECT * FROM animals;

-- New transaction to process conditional update
BEGIN WORK;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

-- verify changes
SELECT * FROM animals;

-- Answer to Question 1
SELECT COUNT(id) FROM animals;

-- Answer to Question 2
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;

-- Answer to Question 3
SELECT AVG(weight_kg) FROM animals;

-- Answer to Question 4
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

-- Answer to Question 5
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- Answer to Question 6
SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth > '1990-01-01' and date_of_birth < '2000-12-31' 
GROUP BY species;

-- Day 3

-- Answer to Question 1
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

-- Answer to Question 2
SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- Answer to Question 3
SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id;

-- Answer to Question 4
SELECT species.name, COUNT(*) FROM species
LEFT JOIN animals ON animals.species_id = species.id GROUP BY species.id;

-- Answer to Question 5
SELECT animals.* FROM animals
LEFT JOIN owners ON owners.id = animals.owner_id
LEFT JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- Answer to Question 6
SELECT animals.* FROM animals
LEFT JOIN owners ON owners.id = animals.owner_id
LEFT JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Answer to Question 7
SELECT owners.full_name, COUNT(*) FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id GROUP BY owners.id
ORDER BY COUNT(animals.*) DESC;