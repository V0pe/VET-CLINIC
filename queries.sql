/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/*Project 2.*/
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts <= 0;
SELECT AVG(weight_kg) AS average FROM animals;
SELECT COUNT(*) AS most_escape, neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts) AS no_escape_attempts, species FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;
