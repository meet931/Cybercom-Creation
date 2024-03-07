CREATE DATABASE SQL_Queries_2_2;
USE SQL_Queries_2_2;

-- ------------ CASE 1 ------------
CREATE TABLE ACTIVITY (
	PLAYER_ID INT NOT NULL,
    DEVICE_ID INT NOT NULL,
    EVENT_DATE DATE,
    GAMES_PLAYED INT,
    PRIMARY KEY(PLAYER_ID, EVENT_DATE)
);

INSERT INTO ACTIVITY 
(PLAYER_ID, DEVICE_ID, EVENT_DATE, GAMES_PLAYED)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT * FROM ACTIVITY;

-- QUESTION 1:
-- Write an SQL query to report the first login date for each player. Return the result table in any order.

SELECT PLAYER_ID, MIN(EVENT_DATE) FIRST_LOGIN FROM ACTIVITY GROUP BY PLAYER_ID;


-- QUESTION 2:
-- Write an SQL query to report the device that is first logged in for each player. Return the result table in any order

SELECT PLAYER_ID, MIN(DEVICE_ID) AS DEVICE_ID FROM ACTIVITY GROUP BY PLAYER_ID;


-- Question 3: 
-- Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of 
-- games played by the player until that date. Check the example for clarity. Return the result table in any order.

SELECT PLAYER_ID, EVENT_DATE,
    (SELECT SUM(GAMES_PLAYED) FROM ACTIVITY a WHERE a.PLAYER_ID = ACTIVITY.PLAYER_ID AND a.EVENT_DATE <= ACTIVITY.EVENT_DATE) AS GAMES_PLAYED_SO_FAR
FROM ACTIVITY;
