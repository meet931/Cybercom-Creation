-- -------- CASE 3 --------
-- Write an SQL query to report the name, population, and area of the big countries.

CREATE TABLE WORLD (
	NAME VARCHAR(50) PRIMARY KEY NOT NULL,
    CONTINENT VARCHAR(50),
    AREA INT,
    POPULATION INT,
    GDP INT
);

INSERT INTO WORLD (NAME, CONTINENT, AREA, POPULATION, GDP)
VALUES
('India', 'Asia', 3287263, 1380004385, 2848000000000),
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);

ALTER TABLE WORLD
MODIFY COLUMN GDP BIGINT;

SELECT * FROM WORLD;

-- A country is big if:
--    it has an area of at least three million (i.e., 3000000 km2), or
--    it has a population of at least twenty-five million (i.e., 25000000).

SELECT NAME, POPULATION, AREA FROM WORLD WHERE AREA >= 3000000 OR POPULATION >= 25000000;