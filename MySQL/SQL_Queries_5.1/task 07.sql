-- 7. Write a SQL query to retrieve the names and salaries of the five highest paid employees in each department of the "employees" table, sorted by department ID and then 
--    by salary in descending order.

SELECT * FROM EMPLOYEEST1;
SELECT * FROM DEPARTMENTS;

SELECT E.EMPLOYEE_NAME, E.SALARY FROM EMPLOYEEST1 E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE (SELECT COUNT(*) FROM EMPLOYEEST1 E2 WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID AND E2.SALARY >= E.SALARY) <= 5
ORDER BY E.DEPARTMENT_ID, E.SALARY DESC;