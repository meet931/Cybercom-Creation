-- ------------ CASE 2 ------------
-- Create a table called "employees" with the following columns: "id" (integer, primary key), "name" (text), 
-- "age" (integer), and "salary" (integer).

CREATE TABLE EMPLOYEES (
	ID INT PRIMARY KEY,
    NAME TEXT,
    AGE INT,
    SALARY INT
);

-- Insert the following data into the "employees" table:

-- id	name	age	salary
-- 1	John	35	60000
-- 2	Mary	27	50000
-- 3	Peter	42	75000
-- 4	Olivia	29	55000
-- 5	Michael	38	80000

INSERT INTO EMPLOYEES
(ID, NAME, AGE, SALARY)
VALUES
('1', 'John', '35', '6000'),
('2', 'Mary', '27', '50000'),
('3', 'Peter', '42', '75000'),
('4', 'Olivia', '29', '55000'),
('5', 'Michael', '38', '80000');

-- 1. Write a SQL query to select all employees from the "employees" table.
SELECT * FROM EMPLOYEES;

-- 2. Write a SQL query to select the name and salary of all employees with a salary greater than 60000.
SELECT ID, NAME, SALARY FROM EMPLOYEES WHERE SALARY > 60000;

-- 3. Write a SQL query to update Peter's age to 43.
UPDATE EMPLOYEES
SET AGE = 43
WHERE ID = 3;

-- 4. Write a SQL query to delete the employee with the id of 4.
DELETE FROM EMPLOYEES WHERE ID = 4;

-- 5. Write a SQL query to calculate the average salary of all employees.
SELECT AVG(SALARY) AS "AVG SALARY OF ALL EMPLOYEES" FROM EMPLOYEES;

-- 6. Write a SQL query to select the name and age of the oldest employee.
SELECT ID, NAME, AGE AS "AGE OF OLDEST EMP" FROM EMPLOYEES WHERE AGE = (SELECT MAX(AGE) FROM EMPLOYEES);

-- 7. Write a SQL query to select the name and age of the youngest employee.
SELECT ID, NAME, AGE AS "AGE OF OLDEST EMP" FROM EMPLOYEES WHERE AGE = (SELECT MIN(AGE) FROM EMPLOYEES);

-- 8. Write a SQL query to select the name of the employee with the highest salary.
SELECT ID, NAME, SALARY "HIGHEST SALARY" FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);