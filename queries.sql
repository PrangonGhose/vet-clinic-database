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