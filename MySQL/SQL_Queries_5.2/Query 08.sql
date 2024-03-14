-- 8. Write a SQL query to retrieve the names of all employees who have sold products to customers who have placed orders for more than five 
--    different products in the "Electronics" category. The output should only include employees who have made at least one such sale.

SELECT * FROM EMPLOYEESQ4;
SELECT * FROM SALESQ4;
SELECT * FROM PRODUCTSQ4;
SELECT * FROM CUSTOMERSQ4;

SELECT E.NAME FROM EMPLOYEESQ4 E
JOIN SALESQ4 S ON E.EMPLOYEEID = S.EMPLOYEEID
JOIN CUSTOMERSQ4 C ON S.CUSTOMERID = C.CUSTOMERID
JOIN PRODUCTSQ4 P ON S.PRODUCTID = P.PRODUCTID
WHERE P.CATEGORY = 'Electronics'
GROUP BY E.NAME
HAVING COUNT(DISTINCT P.PRODUCTID) > 5;