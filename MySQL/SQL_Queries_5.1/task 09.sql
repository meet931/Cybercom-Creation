-- 9. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total amount they have spent on all orders and the 
--    average amount they have spent per order.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;


SELECT C.CUSTOMER_NAME AS CUSTOMER_NAME,
       SUM(O.TOTAL_AMOUNT) AS TOTAL_AMOUNT_SPENT,
       AVG(O.TOTAL_AMOUNT) AS AVG_AMOUNT_PER_ORDER
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME;