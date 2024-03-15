-- 2. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and 
--    have returned at least one item in the "returns" table.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM RETURNS;

SELECT C.CUSTOMER_NAME FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN RETURNS R ON O.ORDER_ID = R.ORDER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
HAVING COUNT(O.CUSTOMER_ID) > 0 AND COUNT(R.ORDER_ID) >= 1;