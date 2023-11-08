-- FETCH ALL THE VALUE FROM CAR_TABLE 
-- FETCH ALL THE VALUE FROM CAR_TABLE ORDER BY MODEL, AND BRAND

-- Scenario 2: Data duplicated based on ALL of the columns

-- Requirement: Delete duplicate entry for a car in the CARS table.


create table if not exists car_table
(
    id      int,
    model   varchar(50),
    brand   varchar(40),
    color   varchar(30),
    make    int
);

SELECT * FROM CAR_TABLE;

insert into car_table values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into car_table values (2, 'EQS', 'Mercedes-Benz', 'Black', 2022);
insert into car_table values (3, 'iX', 'BMW', 'Red', 2022);
insert into car_table values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into car_table values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into car_table values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);

SELECT * FROM CAR_TABLE;

SELECT * FROM CAR_TABLE
ORDER BY MODEL, BRAND;

-- SOLUTION 1: Delete using CTID / ROWID (in Oracle)
-- FETCH ALL THE VALUE FROM CAR_TABLE WITH CTID COLUMN

SELECT *, CTID
FROM CAR_TABLE;


DELETE FROM CAR_TABLE
WHERE CTID IN (SELECT MAX(CTID)
				FROM CAR_TABLE
				GROUP BY MODEL, BRAND
				HAVING COUNT(*) > 1);

SELECT * FROM CAR_TABLE;

-- SOLUTION 2: By creating a temporary unique id column

insert into car_table values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into car_table values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);

ALTER TABLE CAR_TABLE ADD COLUMN ROW_NUM INT GENERATED ALWAYS AS IDENTITY;

SELECT * FROM CAR_TABLE;


DELETE FROM CAR_TABLE
WHERE ROW_NUM IN (SELECT MAX(ROW_NUM)
				 FROM CAR_TABLE
				 GROUP BY MODEL, BRAND
				 HAVING COUNT(*) > 1);
				 
SELECT * FROM CAR_TABLE;

ALTER TABLE CAR_TABLE DROP COLUMN ROW_NUM;

-- SOLUTION 3: By creating a backup table

SELECT * FROM CAR_TABLE;

insert into car_table values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into car_table values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);

CREATE TABLE CAR_TABLE_BKP AS
SELECT DISTINCT * FROM CAR_TABLE;

SELECT * FROM CAR_TABLE_BKP;

DROP TABLE CAR_TABLE;

ALTER TABLE CAR_TABLE_BKP RENAME TO CAR_TABLE;

SELECT * FROM CAR_TABLE;

-- SOLUTION 4: By creating a backup table without dropping the original table.

insert into car_table values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into car_table values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);


SELECT * FROM CAR_TABLE;

CREATE TABLE CAR_TABLE_BKP AS
SELECT DISTINCT * FROM CAR_TABLE;

SELECT * FROM CAR_TABLE_BKP;

TRUNCATE TABLE CAR_TABLE;

SELECT * FROM CAR_TABLE;

INSERT INTO CAR_TABLE
SELECT * FROM CAR_TABLE_BKP;

SELECT * FROM CAR_TABLE;

DROP TABLE CAR_TABLE_BKP;
