-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE "farmers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "phone_number" INTEGER UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE "animals" (
    "id" INTEGER,
    "farmer_id" INTEGER NOT NULL,
    "species" TEXT NOT NULL,
    "birth_date" DATETIME NOT NULL,
    "is_diseased" TEXT NOT NULL CHECK("is_diseased" IN ("True", "False")),
    "is_alive" TEXT NOT NULL CHECK("is_alive" IN ("True", "False")),
    "is_sold" TEXT NOT NULL CHECK("is_sold" IN ("True", "False")),
    "diseased_date" DATETIME,
    "disease_name" TEXT,
    "n_children" INTEGER,
    "medication_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("farmer_id") REFERENCES "farmers"("id") ON DELETE CASCADE,
    FOREIGN KEY("medication_id") REFERENCES "medications"("id")
);

CREATE TABLE "medications"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,   -- What i meant is to know if it is vaccine, AB or etc
    "manufacturer" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "treatments" (
    "id" INTEGER,
    "animal_id" INTEGER NOT NULL,
    "medication_id" INTEGER NOT NULL,
    "date_administered" DATETIME NOT NULL,
    "dosage" INTEGER NOT NULL,
    "vet_name" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("animal_id") REFERENCES "animals"("id") ON DELETE CASCADE,
    FOREIGN KEY("medication_id") REFERENCES "medications"("id") ON DELETE CASCADE
);

CREATE TABLE "health_check"(
    "id" INTEGER,
    "animal_id" INTEGER NOT NULL,
    "check_date" DATETIME NOT NULL,
    "diagnosis" TEXT NOT NULL,
    "recommendations" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("animal_id") REFERENCES "animals"("id") ON DELETE CASCADE
);

CREATE TABLE "sales"(
    "id" INTEGER,
    "animal_id" INTEGER NOT NULL,
    "buyer_name" TEXT NOT NULL,
    "sale_date" DATETIME NOT NULL,
    "price" INTEGER NOT NULL,
    PRIMARY KEY("id")
    FOREIGN KEY("animal_id") REFERENCES "animals"("id") ON DELETE CASCADE
);
