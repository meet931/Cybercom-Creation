-- 6. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the minimum salary of their department in the "employees" table, 
--    sorted by department ID and then by salary in descending order.
  
SELECT * FROM EMPLOYEEST1;
SELECT * FROM DEPARTMENTS;

SELECT E.EMPLOYEE_NAME, E.SALARY FROM EMPLOYEEST1 E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.SALARY > (SELECT MIN(E2.SALARY) FROM EMPLOYEEST1 E2 WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID)
ORDER BY E.DEPARTMENT_ID, E.SALARY DESC;
