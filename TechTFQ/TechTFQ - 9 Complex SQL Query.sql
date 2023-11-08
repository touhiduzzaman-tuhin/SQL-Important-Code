-- Write a SQL query to fetch all the duplicate records from a table. => 1 || ROBIN

SELECT *
FROM USERS
WHERE CTID NOT IN (SELECT MIN(CTID)
				  FROM USERS
				  GROUP BY USER_NAME)
				  

-- Write a SQL query to fetch the second last record from a employee table. => 1 || 123 - VIKRAM

SELECT * FROM 
(SELECT *,
ROW_NUMBER() OVER(ORDER BY EMP_ID DESC) AS RN
FROM EMPLOYEE) AS X
WHERE X.RN = 2;



SELECT EMP_ID, EMP_NAME, DEPT_NAME, SALARY FROM 
(SELECT *,
ROW_NUMBER() OVER(ORDER BY EMP_ID DESC) AS RN
FROM EMPLOYEE) AS X
WHERE X.RN = 2;


-- Write a SQL query to display only the details of employees who either earn the highest salary or the lowest salary 
-- in each department from the employee table. => 11							 

SELECT * FROM EMPLOYEE
WHERE (DEPT_NAME, SALARY) IN (SELECT DEPT_NAME, MAX(SALARY) AS SALARY
							FROM EMPLOYEE
							GROUP BY DEPT_NAME)
UNION
SELECT * FROM EMPLOYEE
WHERE (DEPT_NAME, SALARY) IN (SELECT DEPT_NAME, MIN(SALARY) AS SALARY
							 FROM EMPLOYEE
							 GROUP BY DEPT_NAME);
							 


SELECT X.*
FROM EMPLOYEE AS E
JOIN (SELECT *,
		MAX(SALARY) OVER(PARTITION BY DEPT_NAME) AS MAX_SALARY,
		MIN(SALARY) OVER(PARTITION BY DEPT_NAME) AS MIN_SALARY
		FROM EMPLOYEE) AS X
ON E.EMP_ID = X.EMP_ID AND (E.SALARY = X.MAX_SALARY OR E.SALARY = X.MIN_SALARY);


-- FETCH ALL THE VALUE FROM DOCTORS => 6
-- From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality. => 2
-- Now find the doctors who work in same hospital irrespective of their speciality. => 4

SELECT * FROM DOCTORS;

SELECT D1.ID, D1.NAME, D1.SPECIALITY, D1.HOSPITAL
FROM DOCTORS AS D1
JOIN DOCTORS AS D2 ON D1.HOSPITAL = D2.HOSPITAL AND D1.SPECIALITY != D2.SPECIALITY AND D1.ID != D2.ID;

SELECT * FROM DOCTORS;

SELECT D1.ID, D1.NAME, D1.HOSPITAL
FROM DOCTORS AS D1
JOIN DOCTORS AS D2 ON D1.HOSPITAL = D2.HOSPITAL AND D1.ID <> D2.ID;

-- FETCH ALL THE VALUE FROM LOGIN DETAILS TABLE => 13
-- From the login_details table, fetch the users who logged in consecutively 3 or more times. => 2 / 3

SELECT * FROM LOGIN_DETAILS;

SELECT DISTINCT USER_NAME FROM (SELECT *,
				ROW_NUMBER() OVER(PARTITION BY USER_NAME) AS RN
				FROM LOGIN_DETAILS) AS X
WHERE X.RN >= 3;


SELECT DISTINCT REPEATED_NAMES 
FROM (SELECT *,
			CASE
				WHEN USER_NAME = LEAD(USER_NAME) OVER(ORDER BY LOGIN_ID) AND 
					 USER_NAME = LEAD(USER_NAME, 2) OVER(ORDER BY LOGIN_ID) THEN USER_NAME
				ELSE NULL
			END AS REPEATED_NAMES
		FROM LOGIN_DETAILS) AS X
WHERE X.REPEATED_NAMES IS NOT NULL;


-- FETCH ALL THE VALUE FROM STUDENTS TABLE
-- From the students table, write a SQL query to interchange the adjacent student names.
-- Note: If there are no adjacent student then the student name should stay the same.

SELECT * FROM STUDENTS;

SELECT *,
	CASE
		WHEN ID % 2 <> 0 THEN LEAD(STUDENT_NAME, 1, STUDENT_NAME) OVER(ORDER BY ID)
		WHEN ID % 2 = 0 THEN LAG(STUDENT_NAME) OVER(ORDER BY ID)
	END AS NEW_STUDENT
FROM STUDENTS;

-- FETCH ALL THE VALUE FROM WEATHER
-- From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.
-- Note: Weather is considered to be extremely cold then its temperature is less than zero.

SELECT * FROM WEATHER;

select id, city, temperature, day
from (
    select *,
        case when temperature < 0
              and lead(temperature) over(order by day) < 0
              and lead(temperature,2) over(order by day) < 0
        then 'Y'
        when temperature < 0
              and lead(temperature) over(order by day) < 0
              and lag(temperature) over(order by day) < 0
        then 'Y'
        when temperature < 0
              and lag(temperature) over(order by day) < 0
              and lag(temperature,2) over(order by day) < 0
        then 'Y'
        end as flag
    from weather) x
where x.flag = 'Y'

-- FETCH ALL THE VALUE FROM EVENT_CATEGORY TABLE => 5
-- FETCH ALL THE VALUE FROM PATIENT_TREATMENT TABLE => 9
-- FETCH ALL THE VALUE FROM PHYSICIAN_SPECIALITY TABLE => 6

-- From the following 3 tables (event_category, physician_speciality, patient_treatment),
-- write a SQL query to get the histogram of specialities of the unique physicians
-- who have done the procedures but never did prescribe anything.

SELECT * FROM EVENT_CATEGORY;
SELECT * FROM PATIENT_TREATMENT;
SELECT * FROM PHYSICIAN_SPECIALITY;

select ps.speciality, count(1) as speciality_count
from patient_treatment pt
join event_category ec on ec.event_name = pt.event_name
join physician_speciality ps on ps.physician_id = pt.physician_id
where ec.category = 'Procedure'
and pt.physician_id not in (select pt2.physician_id
							from patient_treatment pt2
							join event_category ec on ec.event_name = pt2.event_name
							where ec.category in ('Prescription'))
group by ps.speciality;

-- FETCH ALL THE VALUE FORM PATIENT_LOGS => 9

-- Find the top 2 accounts with the maximum number of unique patients on a monthly basis.
-- Note: Prefer the account if with the least value in case of same number of unique patients

SELECT * FROM PATIENT_LOGS;


select a.month, a.account_id, a.no_of_unique_patients
from (
		select x.month, x.account_id, no_of_unique_patients,
			row_number() over (partition by x.month order by x.no_of_unique_patients desc) as rn
		from (
				select pl.month, pl.account_id, count(1) as no_of_unique_patients
				from (select distinct to_char(date,'month') as month, account_id, patient_id
						from patient_logs) pl
				group by pl.month, pl.account_id) x
     ) a
where a.rn < 3;