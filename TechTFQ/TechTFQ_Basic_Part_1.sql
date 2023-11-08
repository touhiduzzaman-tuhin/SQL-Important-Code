-- Different SQL Operators:::    = , <, >, >=, <=, <>, !=, BETWEEN, ORDER BY, IN, NOT IN, LIKE, ALIASE, DISTINCT, LIMIT, CASE:
-- Comparison Operators: =, <>, != , >, <, >=, <=
-- Arithmetic Operators: +, -, *, /, %
-- Logical Operators: AND, OR, NOT, IN, BETWEEN, LIKE etc.


-- -- Basic queries
-- 1. Fetch all columns and all records (rows) from table.
SELECT * FROM SCHOOL;
SELECT * FROM CLASSES;
SELECT * FROM PARENTS;
SELECT * FROM STAFF;
SELECT * FROM STAFF_SALARY;
SELECT * FROM STUDENT_CLASSES;
SELECT * FROM STUDENT_PARENT;
SELECT * FROM STUDENTS
SELECT * FROM SUBJECTS;
SELECT * FROM ADDRESS;
-- 2. Fetch only ID and FIRST_NAME columns from students table.
SELECT * FROM STUDENTS;
SELECT ID, FIRST_NAME FROM STUDENTS;

-- -- Comparison Operators
-- 1. Fetch all records where subject name is Mathematics.
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME = 'Mathematics';

-- 2. Fetch all records where subject name is not Mathematics.
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME <> 'Mathematics';

-- 3. same as above. Both "<>" and "!=" are NOT EQUAL TO operator in SQL.
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME != 'Mathematics';

-- 4. All records where salary is greater than 10000.
SELECT * FROM STAFF_SALARY WHERE SALARY > 10000;
-- 5. All records where salary is less than 10000.
SELECT * FROM STAFF_SALARY WHERE SALARY < 10000;
-- 6. All records where salary is less than 10000 and the output is sorted in ascending order of salary.
SELECT * FROM STAFF_SALARY WHERE SALARY < 10000 ORDER BY SALARY;
-- 7. All records where salary is less than 10000 and the output is sorted in descending order of salary.
SELECT * FROM STAFF_SALARY WHERE SALARY < 10000 ORDER BY SALARY DESC;
-- 8. All records where salary is greater than or equal to 10000.
SELECT * FROM STAFF_SALARY WHERE SALARY >= 10000;
-- 9. All records where salary is less than or equal to 10000.
SELECT * FROM STAFF_SALARY WHERE SALARY <= 10000;

-- -- Logical Operators
-- 1. Fetch all records where salary is between 5000 and 10000.
SELECT * FROM STAFF_SALARY WHERE SALARY BETWEEN 5000 AND 10000;
-- 2. All records where subjects is either Mathematics, Science or Arts.
SELECT * FROM SUBJECTS;
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME IN('Mathematics', 'Science', 'Arts');
-- 3. All records where subjects is not Mathematics, Science or Arts.
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME NOT IN('Mathematics', 'Science', 'Arts');
-- 4. Fetch records where subject name has Computer as prefixed. % matches all characters.
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME LIKE 'Computer%';
-- 5. Fetch records where subject name does not have Computer as prefixed. % matches all characters.
SELECT * FROM SUBJECTS WHERE SUBJECT_NAME NOT LIKE 'Computer%';
-- 6. Fetch records where staff is female and is over 50 years of age. 
-- AND operator fetches result only if the condition mentioned both on left side and right side of AND operator holds true.
SELECT * FROM STAFF;
SELECT * FROM STAFF WHERE GENDER = 'F' AND AGE > 50;
-- 7. In OR operator, atleast any one of the conditions needs to hold true to fetch result.
SELECT * FROM STAFF WHERE GENDER = 'F' OR AGE > 50;
-- 8. Fetch record where first name of staff starts with "A" AND last name starts with "S".
SELECT * FROM STAFF WHERE FIRST_NAME LIKE 'A%' AND LAST_NAME LIKE 'S%';
-- 9. Fetch record where first name of staff starts with "A" OR last name starts with "S". Meaning either the first name or the last name condition needs to match for query to return data.
SELECT * FROM STAFF WHERE FIRST_NAME LIKE 'A%' OR LAST_NAME LIKE 'S%';
-- 9. Fetch record where staff is over 50 years of age AND has his first name starting with "A" OR his last name starting with "S".
SELECT * FROM STAFF WHERE AGE > 50 AND (FIRST_NAME LIKE 'A%' OR LAST_NAME LIKE 'S%');

-- -- Arithmetic Operators
-- 1. Sum of two numbers. PostgreSQL does not need FROM clause to execute such queries.
SELECT (5+2) AS SUM;
-- 2. SUB 2 numbers and returns whole number.
SELECT (5-2) AS SUB;
-- 3. Divides 2 numbers and returns whole number.
SELECT (5/2) AS DIVISION;
-- 4. MULTIPLICATION 2 numbers and returns whole number.
SELECT (5*6) AS MULTIPLICATION;
-- 4. Divides 2 numbers and returns the remainder
SELECT (5%2) AS REMAINDER;
-- 5. Returns lot of duplicate data.
SELECT STAFF_TYPE FROM STAFF;
-- 6. Returns unique values only.
SELECT DISTINCT STAFF_TYPE FROM STAFF;
-- 7. Fetches only the first 5 records from the result.
SELECT STAFF_TYPE FROM STAFF LIMIT 5;