-- ------------ CASE 3 ------------

-- Consider a table called "employees" with the following columns: "id", "name", "department", "salary". 
-- Write a SQL query to retrieve the names and salaries of all employees in the "sales" department who earn more than $50,000 per year.

CREATE TABLE EMPLOYEES (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(150) NOT NULL,
    DEPARTMENT VARCHAR(100),
    SALARY INT
);

INSERT INTO EMPLOYEES (NAME, DEPARTMENT, SALARY) VALUES
('Ramesh Kumar', 'Human Resources', 50000),
('Priya Sharma', 'Finance', 60000),
('Amit Singh', 'Marketing', 55000),
('Anjali Gupta', 'Human Resources', 52000),
('Rajesh Patel', 'Finance', 58000),
('Sunita Verma', 'Marketing', 56000),
('Sanjay Mishra', 'Human Resources', 53000),
('Neha Reddy', 'Finance', 59000),
('Vijay Khanna', 'Marketing', 57000),
('Sunil Mehta', 'Sales', 62000),
('Manisha Singh', 'Sales', 61000);

SELECT NAME, SALARY FROM EMPLOYEES WHERE DEPARTMENT = 'SALES' AND SALARY > 50000;