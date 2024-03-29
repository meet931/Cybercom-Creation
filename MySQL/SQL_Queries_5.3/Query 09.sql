-- 9. Write a SQL query to retrieve the names and total revenue generated by all customers in the "orders" table, sorted by revenue in descending order, 
--    where the customer is from the "USA" and the revenue is greater than the average revenue generated by all customers from the "USA".

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT C.CUSTOMER_NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_REVENUE FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.COUNTRY = 'USA'
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
HAVING SUM(O.TOTAL_AMOUNT) > (
							SELECT AVG(TOTAL_AMOUNT) FROM ORDERS O 
							JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
                            WHERE C.COUNTRY = 'USA'
)
ORDER BY TOTAL_REVENUE DESC;