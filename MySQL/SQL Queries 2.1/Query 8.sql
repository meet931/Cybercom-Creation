-- 8. Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
--    If the address of a personId is not present in the Address table, report null instead. Return the result table in any order.

CREATE TABLE PERSON (
	PERSON_ID INT AUTO_INCREMENT PRIMARY KEY,
    LAST_NAME VARCHAR(255),
    FIRST_NAME VARCHAR(255)
);

CREATE TABLE ADDRESS (
	ADDRESS_ID INT AUTO_INCREMENT PRIMARY KEY,
    PERSON_ID INT,
    CITY VARCHAR(50),
    STATE VARCHAR(50),
    FOREIGN KEY (PERSON_ID) REFERENCES PERSON(PERSON_ID)
);

INSERT INTO PERSON 
(LAST_NAME, FIRST_NAME)
VALUES
('Wang', 'Alien'),
('Alice', 'Bob');

INSERT INTO ADDRESS 
(PERSON_ID, CITY, STATE)
VALUES
(2, 'New York City', 'State'),
(2, 'Leetcode', 'California');

SELECT FIRST_NAME, LAST_NAME, CITY, STATE
FROM PERSON P
LEFT JOIN ADDRESS A ON P.PERSON_ID = A.PERSON_ID;