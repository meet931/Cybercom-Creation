-- ------------ CASE 2 ------------

-- Consider you’ve one employee database system. Create table schema and add data according to the following queries.
CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    TITLE VARCHAR(50),
    DEPARTMENT_ID INT,
    DEPARTMENT_NAME VARCHAR(50),
    SALARY INT,
    HIRE_DATE DATE,
    DEPENDENT INT
); 

INSERT INTO Employees 
(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, TITLE, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, HIRE_DATE, DEPENDENT)
VALUES
(1, 'John', 'Doe', 'Manager', 1, 'Management', 70000.00, '1998-05-15', 2),
(2, 'Jane', 'Smith', 'Manager', 2, 'Administration', 75000.00, '2000-08-20', 3),
(3, 'Michael', 'Johnson', 'Sales Associate', 3, 'Sales', 50000.00, '2005-03-10', 0),
(4, 'Emily', 'Brown', 'Sales Manager', 3, 'Sales', 80000.00, '2003-11-28', 0),
(5, 'David', 'Wilson', 'Sales Associate', 3, 'Sales', 55000.00, '2006-09-15', 1),
(6, 'Sarah', 'Anderson', 'Manager', 1, 'Management', 72000.00, '2002-06-18', 4),
(7, 'James', 'Martinez', 'HR Manager', 1, 'Management', 78000.00, '2004-04-22', 1),
(8, 'Jennifer', 'Lee', 'Finance Manager', 2, 'Administration', 85000.00, '2001-10-05', 0),
(9, 'Daniel', 'Garcia', 'Sales Associate', 3, 'Sales', 60000.00, '2007-12-12', 2),
(10, 'Jessica', 'Rodriguez', 'HR Assistant', 1, 'Management', 48000.00, '2008-08-30', 0),
(11, 'Matthew', 'Clark', 'Manager', 4, 'Marketing', 72000.00, '2003-09-12', 4),
(12, 'Amanda', 'Hall', 'Marketing Specialist', 4, 'Marketing', 62000.00, '2005-12-20', 0),
(13, 'Christopher', 'White', 'Manager', 5, 'IT', 80000.00, '2004-07-08', 0),
(14, 'Melissa', 'Young', 'Software Engineer', 5, 'IT', 75000.00, '2006-02-15', 2),
(15, 'Andrew', 'Scott', 'Manager', 6, 'Customer Service', 68000.00, '2002-11-10', 0),
(16, 'Laura', 'Taylor', 'Customer Service Representative', 6, 'Customer Service', 55000.00, '2007-08-25', 0),
(17, 'Kevin', 'Allen', 'Manager', 7, 'Operations', 75000.00, '2001-05-18', 1),
(18, 'Stephanie', 'Walker', 'Operations Coordinator', 7, 'Operations', 60000.00, '2008-04-03', 0),
(19, 'Ryan', 'Perez', 'Manager', 8, 'Research & Development', 78000.00, '2003-10-30', 2),
(20, 'Julia', 'Martinez', 'Research Scientist', 8, 'Research & Development', 85000.00, '2006-06-12', 0);

SELECT * FROM EMPLOYEES;

-- 1. Write a query that returns the first and last name of all employees who have a title that contains the word "Manager".
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, TITLE FROM EMPLOYEES WHERE TITLE LIKE "%Manager%";

-- 2. Write a query that returns the department name and the average salary of all employees in each department.
SELECT DEPARTMENT_NAME, AVG(SALARY) AS 'AVG SALARY' FROM EMPLOYEES GROUP BY DEPARTMENT_NAME;

-- 3. Write a query that returns the number of employees who were hired in each year, sorted by year.
SELECT YEAR(HIRE_DATE) AS "YEAR", COUNT(EMPLOYEE_ID) AS "NUMBER OF EMPLOYEES" FROM EMPLOYEES GROUP BY YEAR(HIRE_DATE) ORDER BY YEAR(HIRE_DATE) ASC;

-- 4. Write a query that returns the first name, last name, and salary of the top 10 highest-paid employees.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 10;

-- 5. Write a query that updates the salary of all employees in the "Sales" department to be 10% higher than their current salary.
UPDATE EMPLOYEES
SET SALARY = SALARY + (SALARY * 0.10)
WHERE DEPARTMENT_NAME = "Sales";

-- 6. Write a query that deletes all employees who were hired before the year 2000.
DELETE FROM EMPLOYEES
WHERE HIRE_DATE < '2000-01-01';

-- 7. Write a query that creates a new table called "employee_stats" that contains the following columns: "department_name", "total_employees", and "average_salary". The table should include one row for each department.
CREATE TABLE EMPLOYEE_STATS (
    DEPARTMENT_NAME VARCHAR(255),
    TOTAL_EMPLOYEES INT,
    AVERAGE_SALARY DECIMAL(10, 2)
);
INSERT INTO EMPLOYEE_STATS (DEPARTMENT_NAME, TOTAL_EMPLOYEES, AVERAGE_SALARY) VALUES
('Sales', 50, 60000.00),
('HR', 30, 55000.50),
('Finance', 20, 70000.75);

-- 8. Write a query that returns the first and last name of all employees who have the same last name as their manager.
SELECT E.FIRST_NAME, E.LAST_NAME FROM EMPLOYEES E 
JOIN EMPLOYEES M ON E.LAST_NAME = M.LAST_NAME
WHERE M.TITLE = 'manager';

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE TITLE = 'manager';

-- 9. Write a query that returns the top 5 departments with the highest average salary.
SELECT DEPARTMENT_NAME, AVG(SALARY) AS "HIGHEST AVG SALARY" FROM EMPLOYEES GROUP BY DEPARTMENT_NAME ORDER BY AVG(SALARY) DESC LIMIT 5;
 
-- 10. Write a query that returns the first and last name of all employees who have at least one dependent. Sort the results by last name.
SELECT FIRST_NAME, LAST_NAME, DEPENDENT FROM EMPLOYEES WHERE DEPENDENT >= 1 ORDER BY LAST_NAME;