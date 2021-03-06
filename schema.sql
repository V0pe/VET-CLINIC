/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

/* alter Database schema to include new column */
ALTER table animals ADD species VARCHAR;

/* Mutiple tables*/
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 6) PRIMARY KEY,
    full_name VARCHAR NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
   id INT GENERATED ALWAYS AS IDENTITY (START WITH 6) PRIMARY KEY,
   name VARCHAR 
);

ALTER TABLE animals DROP species;

ALTER TABLE animals ADD COLUMN species_id INT, 
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) 
REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) 
REFERENCES owners(id) ON DELETE CASCADE; 

/* Many to many relationships*/
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    vet_id INT, species_id INT, PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE
);

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_id INT, vet_id INT,
    date_of_visit DATE NOT NULL, 
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE,
    FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE
);

/*Performace*/
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

