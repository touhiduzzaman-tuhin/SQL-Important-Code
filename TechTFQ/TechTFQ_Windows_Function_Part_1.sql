-- FETCH ALL THE VALUE FROM EMPLOYEE TABLE

SELECT * FROM EMPLOYEE_TABLE;

-- FIND THE MAX SALARY FROM EMPLOYEE TALBE

SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEE_TABLE;

-- FIND THE MAX SALARY FOR EACH DEPARTMENT FROM EACH TABLE

SELECT DEPT_NAME, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEE_TABLE
GROUP BY DEPT_NAME;

-- FETCH ALL VALUE WITH MAX SALARY COLUMN IN THE EMPLOYEE TABLE

SELECT E.*,
MAX(SALARY) OVER() AS MAX_SALARY
FROM EMPLOYEE_TABLE AS E;

-- FETCH ALL VALUE WITH MAX SALARY FOR EACH DEPARTMENT COLUMN IN THE EMPLOYEE TABLE

SELECT E.*,
MAX(SALARY) OVER(PARTITION BY DEPT_NAME) AS DEPT_MAX_SALARY
FROM EMPLOYEE_TABLE AS E;

-- FETCH ALL VALUE WITH RN COLUMN(1-N) IN THE EMPLOYEE TABLE

SELECT E.*,
ROW_NUMBER() OVER() AS RN
FROM EMPLOYEE_TABLE AS E;

-- FETCH ALL VALUE WITH RN COLUMN(1-N) FOR EACH DEPARTMENT COLUMN IN THE EMPLOYEE TABLE

SELECT E.*,
ROW_NUMBER() OVER(PARTITION BY DEPT_NAME) AS DEPT_RN
FROM EMPLOYEE_TABLE AS E;

-- Fetch the first 2 employees from each department to join the company.
SELECT *
FROM (SELECT E.*,
		ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS DEPT_RN
		FROM EMPLOYEE_TABLE AS E) AS TOP_TWO
WHERE TOP_TWO.DEPT_RN < 3;


-- Fetch the top 3 employees in each department earning the max salary.
SELECT * FROM EMPLOYEE_TABLE;

SELECT * 
FROM (SELECT E.*,
		RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) AS RANK_NUMBER
		FROM EMPLOYEE_TABLE AS E) AS X
WHERE (X.RANK_NUMBER) < 4;

-- FETCH ROW NUMBER, RANK, DENSE RANK WITH ALL VALUE OF EMPLOYEE TALBE


SELECT *
FROM (SELECT E.*,
	  ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) AS RN,
	  RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) AS RNK,
	  DENSE_RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) AS DENSE_RNK
	  FROM EMPLOYEE_TABLE AS E) AS X;
	  

-- FETCH PREVIOUS EMPLOYEE SALARY, NEXT EMPLOYEE SALARY WITH ALL VALUE OF EMPLOYEE TABLE

SELECT E.*,
LAG(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREVIOUS_EMP_SALARY,
LEAD(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS NEXT_EMP_SALARY
FROM EMPLOYEE_TABLE AS E;

-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.

SELECT E.*,
LAG(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREV_EMP_SAL,
CASE
	WHEN SALARY > LAG(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) THEN 'HIGHER THAN PREVIOUS MONTH'
	WHEN SALARY < LAG(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) THEN 'LOWER THEN PREVIOIUS MONTH'
	WHEN SALARY = LAG(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) THEN 'SAME AS THE PREVIOUS MONTH'
	END AS "SALARY_RANGE"
FROM EMPLOYEE_TABLE AS E;
