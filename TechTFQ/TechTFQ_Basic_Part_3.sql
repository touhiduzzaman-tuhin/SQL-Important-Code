--SUBQUERY: Query written inside a query is called subquery.
-- Fetch the details of parents having more than 1 kids going to this school. Also display student details.

SELECT * FROM STUDENT_PARENT;
SELECT * FROM PARENTS;
SELECT * FROM STUDENTS;
SELECT * FROM ADDRESS;

SELECT (PRN.FIRST_NAME || ' ' || PRN.LAST_NAME) AS PARENT_NAME, PRN.GENDER AS PARENT_GENDER,
(STD.FIRST_NAME || ' ' || STD.LAST_NAME) AS STUDENT_NAME, STD.GENDER AS STUDENT_GENDER, STD.AGE AS STUDENT_AGE,
(ADR.STREET || ' ' || ADR.CITY || ' ' || ADR.STATE || ' ' || ADR.COUNTRY) AS ADDRESS
FROM PARENTS AS PRN
JOIN STUDENT_PARENT AS SP ON SP.PARENT_ID = PRN.ID
JOIN STUDENTS AS STD ON STD.ID = SP.STUDENT_ID
JOIN ADDRESS AS ADR ON ADR.ADDRESS_ID = PRN.ADDRESS_ID
WHERE PRN.ID IN (
	SELECT PARENT_ID
	FROM STUDENT_PARENT
	GROUP BY PARENT_ID
	HAVING COUNT(1) > 1
);


-- Staff details who’s salary is less than 5000
SELECT * FROM STAFF_SALARY;
SELECT * FROM STAFF;

SELECT STF.STAFF_TYPE, STF.FIRST_NAME, STF.LAST_NAME, SS.SALARY
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID
WHERE STF.STAFF_ID IN (SELECT STAFF_ID FROM STAFF_SALARY WHERE SALARY < 5000);



-- Aggregate Functions (AVG, MIN, MAX, SUM, COUNT): Aggregate functions are used to perform calculations on a set of values.
-- AVG: Calculates the average of the given values.
SELECT * FROM STAFF_SALARY;
SELECT * FROM STAFF;

SELECT AVG(SALARY) AS AVERAGE_SALARY FROM STAFF_SALARY;
SELECT STF.STAFF_TYPE, AVG(SS.SALARY)::NUMERIC(10, 2) AS AVERAGE_SASARY
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID
GROUP BY STF.STAFF_TYPE;

/* Note:
“::NUMERIC” is a cast operator which is used to convert values from one data type to another.
In the above query we use it display numeric value more cleanly by restricting the decimal point to only 2.
Here 10 is precision which is the total no of digits allowed.
2 is the scale which is the digits after decimal point.
*/

-- SUM: Calculates the total sum of all values in the given column.
SELECT * FROM STAFF_SALARY;
SELECT SUM(SALARY) FROM STAFF_SALARY;

SELECT STF.STAFF_TYPE, SUM(SS.SALARY) AS TOTAL_SALARY
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID
GROUP BY STF.STAFF_TYPE;

-- MIN: Returns the record with minimun value in the given column.

SELECT MIN(SALARY) FROM STAFF_SALARY;

SELECT STF.STAFF_TYPE, MIN(SS.SALARY) AS MINIMUM_SALARY
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID
GROUP BY STF.STAFF_TYPE;

-- MAX: Returns the record with maximum value in the given column.

SELECT MIN(SALARY) FROM STAFF_SALARY;

SELECT STF.STAFF_TYPE, MAX(SS.SALARY) AS MINIMUM_SALARY
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID
GROUP BY STF.STAFF_TYPE;


-- Inner Join: 21 records returned – Inner join always fetches only the matching records present in both right and left table.
-- Inner Join can be represented as eithe "JOIN" or as "INNER JOIN". Both are correct and mean the same.
SELECT * FROM STAFF;
SELECT * FROM STAFF_SALARY;

SELECT COUNT(1)
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;

SELECT COUNT(1)
FROM STAFF AS STF
INNER JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;

SELECT STF.FIRST_NAME, STF.LAST_NAME, SS.SALARY
FROM STAFF AS STF
JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;


SELECT STF.FIRST_NAME, STF.LAST_NAME, SS.SALARY
FROM STAFF AS STF
INNER JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;

-- 23 records – 23 records present in left table.
-- All records from LEFT table with be fetched irrespective of whether there is matching record in the RIGHT table.
SELECT COUNT(1)
FROM STAFF AS STF
LEFT JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;


SELECT STF.FIRST_NAME, STF.LAST_NAME, SS.SALARY
FROM STAFF AS STF
LEFT JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;

-- 24 records – 24 records in right table.
-- All records from RIGHT table with be fetched irrespective of whether there is matching record in the LEFT table.
SELECT COUNT(1)
FROM STAFF AS STF
RIGHT JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;


SELECT STF.FIRST_NAME, STF.LAST_NAME, SS.SALARY
FROM STAFF AS STF
RIGHT JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;


-- 26 records – all records from both tables. 21 matching records + 2 records from left + 3 from right table.
-- All records from both LEFT and RIGHT table with be fetched irrespective of whether there is matching record in both these tables.
SELECT COUNT(1)
FROM STAFF AS STF
FULL JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;


SELECT STF.FIRST_NAME, STF.LAST_NAME, SS.SALARY
FROM STAFF AS STF
FULL JOIN STAFF_SALARY AS SS ON STF.STAFF_ID = SS.STAFF_ID;















































































































































