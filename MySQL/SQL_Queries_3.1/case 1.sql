CREATE DATABASE SQL_Queries_3_1;

USE SQL_Queries_3_1;

-- ------------ CASE 1 ------------

CREATE TABLE CUSTOMERS (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP
);

INSERT INTO CUSTOMERS (NAME, EMAIL, CREATED_AT)
VALUES
('John Smith', 'johnsmith@gmail.com', '2022-01-01 10:00:00'),
('Jane Doe', 'janedoe@yahoo.com', '2022-01-02 11:00:00'),
('Bob Johnson', 'bobjohnson@hotmail.com', '2022-01-03 12:00:00'),
('Sarah Lee', 'sarahlee@gmail.com', '2022-01-04 13:00:00'),
('David Kim', 'davidkim@yahoo.com', '2022-01-05 14:00:00');

-- Write a query that selects all customers whose email address ends with "@gmail.com".
SELECT * FROM CUSTOMERS WHERE EMAIL LIKE '%@gmail.com';

-- Write a query that selects the customer with the earliest created_at date.
SELECT * FROM CUSTOMERS WHERE CREATED_AT = (SELECT MIN(CREATED_AT) FROM CUSTOMERS);

-- Write a query that selects the name and email of customers who were created on or after January 3, 2022.
SELECT NAME, EMAIL FROM CUSTOMERS WHERE CREATED_AT >= '2022-01-03';

-- Write a query that updates the email address of the customer with id=5 to "davidkim@gmail.com".
UPDATE CUSTOMERS SET EMAIL = 'davidkim@gmail.com' WHERE ID = 5;
SELECT EMAIL FROM CUSTOMERS;

-- Write a query that deletes the customer with id=2.
DELETE FROM CUSTOMERS WHERE ID = 2;

-- Write a query that calculates the total number of customers in the "customers" table.
SELECT COUNT(ID) TOTAL_CUSTOMERS FROM CUSTOMERS ;