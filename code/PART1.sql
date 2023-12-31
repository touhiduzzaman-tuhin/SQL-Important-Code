-- CREATE THE CUSTOMER TABLE WITH ID, FIRST NAME, LAST NAME, AGE, EMAIL
CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID INT
	, FIRST_NAME VARCHAR(50)
	, LAST_NAME VARCHAR(50)
	, AGE INT
	, EMAIL_ID VARCHAR(100)
);

SELECT * FROM CUSTOMERS;

-- INSERT SOME VALUE IN CUSTOMER TABLE
INSERT INTO CUSTOMERS VALUES
(1, 'AAA', 'BBB', 28, 'AB@XYZ.COM');

INSERT INTO CUSTOMERS (CUSTOMER_ID, FIRST_NAME, AGE) VALUES
(2, 'CCC', 33);

INSERT INTO CUSTOMERS VALUES
(3, 'DDD', 'EEE', 24, 'DE@XYZ.COM'),
(4, 'FFF', 'GGG', 42, 'FG@XYZ.COM');

SELECT * FROM CUSTOMERS;

-- INSERT VALUE FROM CSV FILE AND TEXT FILE
COPY CUSTOMERS FROM 'F:\Data Analyst\Code\SQL\SQL Master Class\data\copy.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM CUSTOMERS;

COPY CUSTOMERS FROM 'F:\Data Analyst\Code\SQL\SQL Master Class\data\copyText.txt' DELIMITER ',';

SELECT * FROM CUSTOMERS;
-- FETCH THE CUSTOMERS IN DIFFERENT WAY USE SELECT
SELECT FIRST_NAME, LAST_NAME, AGE FROM CUSTOMERS;

SELECT CUSTOMER_ID, FIRST_NAME, EMAIL_ID FROM CUSTOMERS;

-- FETCH THE CUSTOMERS WHO'S AGE IS 25
SELECT * FROM CUSTOMERS WHERE AGE = 25;

-- FETCH THE CUSTOMERS WHO'S AGE IS MORE THAN 30
SELECT * FROM CUSTOMERS WHERE AGE > 30;

-- FETCH THE CUSTOMERS WHO'S FIRST NAME IS Jay
SELECT * FROM CUSTOMERS WHERE FIRST_NAME = 'Jay';

-- FETCH THE CUSTOMERS WHO'S ID IS 2
SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID = 2;

-- FETCH THE CUSTOMERS WHO'S AGE IS GREATER THAN 20 AND LESS THAN 30
SELECT * FROM CUSTOMERS WHERE AGE > 20 AND AGE < 30;

-- FETCH THE CUSTOMERS WHO'S AGE IS LESS THAN 20 OR GREATER THAN 30
SELECT * FROM CUSTOMERS WHERE AGE < 20 OR AGE > 30;

-- FETCH THE CUSTOMERS WHO'S AGE IS NOT 25
SELECT * FROM CUSTOMERS WHERE NOT AGE = 25;

-- FETCH THE CUSTOMERS WHO'S AGE IS NOT 25 AND FIRST NAME IS NOT JAY
SELECT * FROM CUSTOMERS WHERE NOT AGE = 25 AND NOT FIRST_NAME = 'Jay';

-- UPDATE CUSTOMER AGE, NAME, ID IN DIFFERENT CUSTOEMRS
UPDATE CUSTOMERS
SET LAST_NAME = 'DDD'
WHERE AGE = 33;

SELECT * FROM CUSTOMERS;

UPDATE CUSTOMERS
SET EMAIL_ID = 'jkkkkk@xyz.com'
WHERE AGE = 25;

SELECT * FROM CUSTOMERS;

-- DELETE DIFFERENT CUSTOMERS BASED ON AGE, NAME, ID
DELETE FROM CUSTOMERS
WHERE FIRST_NAME = 'Jay';

SELECT * FROM CUSTOMERS;

DELETE FROM CUSTOMERS
WHERE AGE > 40;

SELECT * FROM CUSTOMERS;

-- ADD A COLUMN IN THE TABLE
ALTER TABLE CUSTOMERS ADD COUNTRY VARCHAR(50);

SELECT * FROM CUSTOMERS;


ALTER TABLE CUSTOMERS ADD CITY VARCHAR(50);

SELECT * FROM CUSTOMERS;

-- DELETE THE COLUMN
ALTER TABLE CUSTOMERS DROP COUNTRY;

SELECT * FROM CUSTOMERS;

ALTER TABLE CUSTOMERS DROP CITY;

SELECT * FROM CUSTOMERS;

-- CHANGE THE COLUMN NAME
ALTER TABLE CUSTOMERS RENAME COLUMN CUSTOMER_ID TO ID;

SELECT * FROM CUSTOMERS;

-- CHANGE THE COLUMN TYPE

ALTER TABLE CUSTOMERS ALTER COLUMN ID TYPE VARCHAR(20);

SELECT * FROM CUSTOMERS;

-- ADD CONSTRAINT LIKE -> TABLE MUST HAVE THE ID COLUMN -> INSERT VALUE AND TEST
ALTER TABLE CUSTOMERS ALTER COLUMN AGE SET NOT NULL;

SELECT * FROM CUSTOMERS;

-- DELETE THE CONSTRAINT -> INSERT VALUE AND TEST

ALTER TABLE CUSTOMERS ALTER COLUMN AGE DROP NOT NULL;

INSERT INTO CUSTOMERS (ID, FIRST_NAME) VALUES (9, 'TUHIN');

SELECT * FROM CUSTOMERS;
-- ADD ANY COLUMN INTO PRIMARY KEY
ALTER TABLE CUSTOMERS ADD PRIMARY KEY (ID);

INSERT INTO CUSTOMERS (ID, FIRST_NAME, AGE) VALUES (10, 'MONA', 88);

SELECT * FROM CUSTOMERS;

-- ADD CONSTRAINT TO CHECK SOMETHING
ALTER TABLE CUSTOMERS ADD CONSTRAINT AGE CHECK(AGE > 0);

INSERT INTO CUSTOMERS VALUES(11, 'MAMUN', 'KHAN', 24, 'MAMUN@XYZ.COM');

SELECT * FROM CUSTOMERS;

-- DROP THE WHOLE TABLE
DROP TABLE CUSTOMERS;