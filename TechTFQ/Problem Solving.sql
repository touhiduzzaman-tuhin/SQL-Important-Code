-- COMMENTS_AND_TRANSLATION TABLE 

create table comments_and_translations
(
	id				int,
	comment			varchar(100),
	translation		varchar(100)
);

insert into comments_and_translations values
(1, 'very good', null),
(2, 'good', null),
(3, 'bad', null),
(4, 'ordinary', null),
(5, 'cdcdcdcd', 'very bad'),
(6, 'excellent', null),
(7, 'ababab', 'not satisfied'),
(8, 'satisfied', null),
(9, 'aabbaabb', 'extraordinary'),
(10, 'ccddccbb', 'medium');

-- SOURCE AND TARGET TABLE

CREATE TABLE source
    (
        id      int,
        name    varchar(1)
    );

CREATE TABLE target
    (
        id      int,
        name    varchar(1)
    );

INSERT INTO source VALUES (1, 'A');
INSERT INTO source VALUES (2, 'B');
INSERT INTO source VALUES (3, 'C');
INSERT INTO source VALUES (4, 'D');

INSERT INTO target VALUES (1, 'A');
INSERT INTO target VALUES (2, 'B');
INSERT INTO target VALUES (4, 'X');
INSERT INTO target VALUES (5, 'F');

-- TEAMS TABLE
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');

-- Write an SQL query to display the correct message (meaningful message) from the input comments_and_translation table

SELECT * FROM COMMENTS_AND_TRANSLATIONS;

-- 1ST

SELECT
	CASE
		WHEN TRANSLATION IS NULL THEN COMMENT
		WHEN TRANSLATION IS NOT NULL THEN TRANSLATION
	END AS OUTPUT
FROM COMMENTS_AND_TRANSLATIONS;

-- 2ND

SELECT
	CASE
		WHEN TRANSLATION IS NULL THEN COMMENT
		ELSE TRANSLATION
	END AS OUTLPUT
FROM COMMENTS_AND_TRANSLATIONS;

-- 3RD

SELECT COALESCE(TRANSLATION, COMMENT) AS OUTPUT
FROM COMMENTS_AND_TRANSLATIONS;

-- THERE ARE TWO DIFFERENT TABLE SOURCE AND TARGET TALBE.WRITE A QUIRY THAT
-- ID IS PRESENT IN BOTH SOURCE AND TARGET TABLE BUT NAME IS DIFFERENT, PRINT THE ID, AND COMMENT THAT MISMATCH
-- ID IS PRESENT IN SOURCE BUT NOT IN TARGET TABLE, PRINT THE ID, AND COMMENT THAT NEW IN SOURCE
-- ID IS PRESENT IN TARGET BUT NOT IN SOURCE TABLE, PRINT THE ID, AND COMMENT THAT NEW IN TARGET


SELECT * FROM SOURCE;
SELECT * FROM TARGET;

SELECT S.ID, 'Mismatch' AS COMMENT
FROM SOURCE AS S
JOIN TARGET AS T ON S.ID = T.ID AND S.NAME != T.NAME
UNION
SELECT S.ID, 'New in Source' AS COMMENT
FROM SOURCE AS S
LEFT JOIN TARGET AS T ON S.ID = T.ID
WHERE T.ID IS NULL
UNION
SELECT T.ID, 'New in Target' AS COMMENT
FROM SOURCE AS S
RIGHT JOIN TARGET AS T ON T.ID = S.ID
WHERE S.ID IS NULL;

SELECT * FROM TEAMS;

-- write an sql query such that each team play with every other team just once.

SELECT TEAM.TEAM_NAME AS TEAM, OPPONENT.TEAM_NAME AS OPPONENT
FROM TEAMS AS TEAM
JOIN TEAMS AS OPPONENT ON TEAM.TEAM_NAME != OPPONENT.TEAM_NAME;

WITH TEAM AS 
(SELECT
	ROW_NUMBER() OVER(ORDER BY TEAM_CODE) AS ID,
	TEAM_CODE,
	TEAM_NAME
FROM TEAMS)
SELECT TEAM.TEAM_NAME AS TEAM, OPPONENT.TEAM_NAME AS OPPONENT
FROM TEAM AS TEAM
JOIN TEAM AS OPPONENT ON TEAM.ID < OPPONENT.ID;

SELECT T1.TEAM_NAME AS TEAM_1, T2.TEAM_NAME AS TEAM_2
FROM TEAMS AS T1
JOIN TEAMS AS T2 ON T1.TEAM_CODE < T2.TEAM_CODE;


-- write another query such that each team plays with every other team twice.
WITH TEAMS AS
(SELECT
	ROW_NUMBER() OVER(ORDER BY TEAM_CODE) AS ID,
	TEAM_CODE,
	TEAM_NAME
FROM TEAMS)
SELECT TEAM.TEAM_NAME AS TEAM, OPPONENT.TEAM_NAME AS OPPONENT
FROM TEAMS AS TEAM
JOIN TEAMS AS OPPONENT ON TEAM.ID != OPPONENT.ID;

SELECT * FROM TEAMS;

SELECT T1.TEAM_NAME AS TEAM, T2.TEAM_NAME AS OPPONENT 
FROM TEAMS AS T1
JOIN TEAMS AS T2 ON T1.TEAM_CODE <> T2.TEAM_CODE;
