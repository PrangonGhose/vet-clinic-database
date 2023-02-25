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
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Answer to Question 7
SELECT owners.full_name, COUNT(*) FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id GROUP BY owners.id
ORDER BY COUNT(animals.*) DESC;

-- Day 4

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit, vets.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.id = (
	SELECT id FROM vets WHERE vets.name = 'William Tatcher'
)
ORDER BY date_of_visit DESC;

-- How many different animals did Stephanie Mendez see?
SELECT animals.name, vets.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.id = (
	SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'
);

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.*, species.name FROM vets
LEFT JOIN specializations ON specializations.vet_id = vets.id
LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, vets.name, visits.date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.id = (
	SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'
) AND
visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
ORDER BY date_of_visit DESC;

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) FROM animals
JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name
ORDER BY COUNT DESC;

-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.date_of_visit, vets.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.id = (
	SELECT id FROM vets WHERE vets.name = 'Maisy Smith'
)
ORDER BY date_of_visit;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.*, vets.*, visits.date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY date_of_visit DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM vets
LEFT JOIN visits ON vets.id = visits.vet_id
LEFT JOIN animals ON animals.id = visits.animal_id
LEFT JOIN specializations ON vets.id = specializations.vet_id
WHERE (SELECT species_id FROM animals WHERE animals.id = visits.animal_id) != specializations.species_id
OR specializations.species_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) FROM vets
LEFT JOIN visits ON vets.id = visits.vet_id
LEFT JOIN animals ON animals.id = visits.animal_id
LEFT JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;