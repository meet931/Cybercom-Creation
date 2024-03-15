CREATE DATABASE SQL_Queries_5_3;
USE SQL_Queries_5_3;

-- 1. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the average salary of all employees.

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SALARY DECIMAL(10, 2)
);

INSERT INTO EMPLOYEES (EMPLOYEE_ID, NAME, SALARY) VALUES
(1, 'John Doe', 50000),
(2, 'Jane Smith', 60000),
(3, 'Michael Johnson', 75000),
(4, 'Emily Davis', 55000),
(5, 'Chris Wilson', 80000);

SELECT * FROM EMPLOYEES;

SELECT NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);