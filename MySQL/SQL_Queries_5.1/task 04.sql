-- 4. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the average salary of all employees in the "employees" table, 
--    sorted by salary in descending order.

SELECT * FROM EMPLOYEEST1;

SELECT EMPLOYEE_NAME, SALARY FROM EMPLOYEEST1 WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEEST1) ORDER BY SALARY DESC;