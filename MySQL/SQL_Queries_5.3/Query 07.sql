-- 7. Write a SQL query to retrieve the names of all employees who have made sales greater than the average sales of all employees 
--    in the "orders" table, sorted by sales in descending order.

SELECT * FROM EMPLOYEES;
SELECT * FROM ORDERSQ6;

SELECT E.NAME FROM EMPLOYEES E
JOIN ORDERSQ6 O ON E.EMPLOYEE_ID = O.EMPLOYEE_ID
GROUP BY E.EMPLOYEE_ID, E.NAME
HAVING SUM(O.TOTAL_AMOUNT) > (SELECT AVG(TOTAL_AMOUNT) FROM ORDERSQ6)
ORDER BY SUM(O.TOTAL_AMOUNT) DESC;