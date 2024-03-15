# 6. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and 
#    have spent more than $100 in total on all orders.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM RETURNS;

SELECT C.CUSTOMER_NAME FROM CUSTOMERS C 
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
HAVING SUM(O.ORDER_AMOUNT) > 100;