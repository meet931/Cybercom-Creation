-- 6. Write a SQL query to retrieve the names of all employees who have sold at least one product to customers who have placed orders 
--    for products in the "Electronics" category, but have never placed an order for products in the "Clothing" category. The output 
--    should only include employees who have made at least one such sale.

SELECT * FROM EMPLOYEESQ4;
SELECT * FROM SALESQ4;
SELECT * FROM PRODUCTSQ4;
SELECT * FROM CUSTOMERSQ4;

SELECT E.NAME
FROM EMPLOYEESQ4 E
JOIN SALESQ4 S ON E.EMPLOYEEID = S.EMPLOYEEID
JOIN CUSTOMERSQ4 C ON S.CUSTOMERID = C.CUSTOMERID
JOIN PRODUCTSQ4 P ON S.PRODUCTID = P.PRODUCTID
WHERE P.CATEGORY = 'Electronics'
AND C.CUSTOMERID NOT IN (
	SELECT C2.CUSTOMERID FROM EMPLOYEESQ4 E2
	JOIN SALESQ4 S2 ON E2.EMPLOYEEID = S2.EMPLOYEEID
	JOIN CUSTOMERSQ4 C2 ON S2.CUSTOMERID = C2.CUSTOMERID
	JOIN PRODUCTSQ4 P2 ON S2.PRODUCTID = P2.PRODUCTID
	WHERE P2.CATEGORY = 'Clothing'
)
GROUP BY E.EMPLOYEEID;