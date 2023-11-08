-->> Problem Statement:
-- Suppose you have a car travelling certain distance and the data is presented as follows -
-- Day 1 - 50 km
-- Day 2 - 100 km
-- Day 3 - 200 km

-- Now the distance is a cumulative sum as in
--     row2 = (kms travelled on that day + row1 kms).

-- How should I get the table in the form of kms travelled by the car on a given day and not the sum of the total distance?


-->> Sample Dataset:
drop table car_travels;
create table car_travels
(
    cars                    varchar(40),
    days                    varchar(10),
    cumulative_distance     int
);

insert into car_travels values ('Car1', 'Day1', 50);
insert into car_travels values ('Car1', 'Day2', 100);
insert into car_travels values ('Car1', 'Day3', 200);
insert into car_travels values ('Car2', 'Day1', 0);
insert into car_travels values ('Car3', 'Day1', 0);
insert into car_travels values ('Car3', 'Day2', 50);
insert into car_travels values ('Car3', 'Day3', 50);
insert into car_travels values ('Car3', 'Day4', 100);

select * from car_travels;

SELECT *,
CUMULATIVE_DISTANCE - LAG(CUMULATIVE_DISTANCE, 1, 0) OVER(PARTITION BY CARS ORDER BY DAYS) AS TRAVELLED_EACH_DAY
FROM CAR_TRAVELS;

-- Dataset
drop table emp_input;

create table emp_input
(
id      int,
name    varchar(40)
);

insert into emp_input values (1, 'Emp1');
insert into emp_input values (2, 'Emp2');
insert into emp_input values (3, 'Emp3');
insert into emp_input values (4, 'Emp4');
insert into emp_input values (5, 'Emp5');
insert into emp_input values (6, 'Emp6');
insert into emp_input values (7, 'Emp7');
insert into emp_input values (8, 'Emp8');

select * from emp_input;

-- FETCH ALL THE VALUE FROM EMP_INPUT
-- FETCH THESE 8 ROWS VALUE INTO 4 ROWS VALUE AND EACH ROW HAVE 2 EMPLOYEE INFORMATION IN COMMA SEPERATED

SELECT * FROM EMP_INPUT;

WITH CTE AS (SELECT CONCAT(ID || ' ' || NAME) AS NAME ,
				NTILE(4) OVER(ORDER BY ID) AS BUCKETS
				FROM EMP_INPUT)
SELECT STRING_AGG(NAME, ', ') AS OUTPUT
FROM CTE
GROUP BY BUCKETS
ORDER BY 1;


CREATE TABLE TREE
(
	ID INT
	, P_ID INT
);

INSERT INTO TREE VALUES
(1, NULL),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

SELECT * FROM TREE;

-- FETCH ALL THE DATA FROM TREE TABLE

SELECT ID, CASE
	WHEN P_ID IS NULL THEN 'ROOT'
	WHEN P_ID IS NOT NULL AND ID IN (SELECT DISTINCT P_ID FROM TREE) THEN 'INNER'
	ELSE 'LEAF'
	END AS TYPE
FROM TREE;



