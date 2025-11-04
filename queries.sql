-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Type of animals received the most treatment
SELECT "species", COUNT("medication_id")
FROM "animals"
GROUP BY "species"
ORDER BY COUNT("medication_id") DESC
LIMIT 5;


-- Average price of species
SELECT "a"."species", AVG("s"."price")
FROM "animals" AS "a"
JOIN "sales" AS "s" ON "a"."id" = "s"."animal_id";


-- Average number of health check by farmer
SELECT
    "f"."id" AS "farmer_id",
    "f"."name" AS "farmer_name",
    ROUND(AVG("check_counts"."total_checks"), 2) AS "avg_health_checks"
FROM "farmers" AS "f"
JOIN (
    SELECT
        "a"."farmer_id",
        COUNT("h"."id") AS "total_checks"
    FROM "animals" AS "a"
    LEFT JOIN "health_checks" AS "h" ON "a"."id" = "h"."animal_id"
    GROUP BY "a"."farmer_id"
) AS "check_counts"
ON "f"."id" = "check_counts"."farmer_id"
GROUP BY "f"."id", "f"."name"
ORDER BY "avg_health_checks" DESC;


-- Total sales per month
SELECT
    STRFTIME('%Y-%m', "sale_date") AS "month",
    SUM("price") AS "total_sales"
FROM "sales"
GROUP BY "month"
ORDER BY "month";


-- Animals sold within 30 days of thier last treatment
SELECT
    "a"."id" AS "animal_id",
    "a"."species",
    MAX("t"."date_administered") AS "last_treatment",
    "s"."sale_date"
FROM "animals" AS "a"
JOIN "treatments" AS "t" ON "a"."id" = "t"."animal_id"
JOIN "sales" AS "s" ON "a"."id" = "s"."animal_id"
GROUP BY "a"."id", "a"."species", "s"."sale_date"
HAVING JULIANDAY("s"."sale_date") - JULIANDAY(MAX("t"."date_administered")) <= 30
ORDER BY "s"."sale_date" DESC;


-- Farmer with the highest percentage of diseased animal
SELECT
    "f"."id" AS "farmer_id",
    "f"."name" AS "farmer_name",
    ROUND(
        (SUM(CASE WHEN "h"."diagnosis" IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT "a"."id"), 2) AS "sick_percentage"
FROM "farmers" AS "f"
JOIN "animals" AS "a" ON "f"."id" = "a"."farmer_id"
LEFT JOIN "health_checks" AS "h" ON "a"."id" = "h"."animal_id"
GROUP BY "f"."id", "f"."name"
HAVING COUNT("a"."id") > 0
ORDER BY "sick_percentage" DESC
LIMIT 10;


-- Adding new animal
INSERT INTO "animals" ("farmer_id", "species", "birth_date", "status")
VALUES (1, 'cow', '2023-06-12', 'alive');


--Update animal as sold
UPDATE "animals"
SET "status" = 'sold'
WHERE "id" = 5;


-- Remove health check
DELETE FROM "health_checks"
WHERE "id" = 12;
