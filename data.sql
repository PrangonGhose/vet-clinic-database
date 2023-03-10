-- Insert data into animals table

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, 'true', 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, 'true', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, 'false', 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, 'true', 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, 'false', 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, 'true', 5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, 'false', 12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, 'true', 45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, 'true', 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, 'true', 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, 'true', 22);

-- Insert data into owners table

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

-- Insert data into species table

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

-- Modify animals to add species id
UPDATE animals
SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1 WHERE species_id IS NULL;

-- Modify animals to add owner id
UPDATE animals
SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

-- Insert vets data
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert into join table specializations
INSERT INTO specializations VALUES (
	(SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
	(SELECT id FROM species WHERE species.name = 'Pokemon')
);

INSERT INTO specializations VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
	(SELECT id FROM species WHERE species.name = 'Pokemon')
);

INSERT INTO specializations VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
	(SELECT id FROM species WHERE species.name = 'Digimon')
);

INSERT INTO specializations VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
	(SELECT id FROM species WHERE species.name = 'Digimon')
);

-- Insert into join table visits
INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
	(SELECT id FROM animals WHERE animals.name = 'Agumon'),
	'2020-05-24'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
	(SELECT id FROM animals WHERE animals.name = 'Agumon'),
	'2020-07-22'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
	(SELECT id FROM animals WHERE animals.name = 'Gabumon'),
	'2021-02-02'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Pikachu'),
	'2020-01-05'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Pikachu'),
	'2020-03-08'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Pikachu'),
	'2020-05-14'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
	(SELECT id FROM animals WHERE animals.name = 'Devimon'),
	'2021-05-04'
);


INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
	(SELECT id FROM animals WHERE animals.name = 'Charmander'),
	'2021-02-24'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Plantmon'),
	'2019-12-21'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
	(SELECT id FROM animals WHERE animals.name = 'Plantmon'),
	'2022-08-10'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Plantmon'),
	'2021-04-07'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
	(SELECT id FROM animals WHERE animals.name = 'Squirtle'),
	'2019-09-29'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
	(SELECT id FROM animals WHERE animals.name = 'Angemon'),
	'2020-10-03'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
	(SELECT id FROM animals WHERE animals.name = 'Angemon'),
	'2020-11-04'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Boarmon'),
	'2019-01-24'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Boarmon'),
	'2019-05-15'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Boarmon'),
	'2020-02-27'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
	(SELECT id FROM animals WHERE animals.name = 'Boarmon'),
	'2020-08-03'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
	(SELECT id FROM animals WHERE animals.name = 'Blossom'),
	'2020-05-24'
);

INSERT INTO visits VALUES (
	(SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
	(SELECT id FROM animals WHERE animals.name = 'Blossom'),
	'2021-01-11'
);