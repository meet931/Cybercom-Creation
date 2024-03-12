-- 3. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total amount they have spent on all orders 
--    and the total amount they have spent on orders made in the last 30 days.

SELECT C.CUSTOMER_NAME, COUNT(O.CUSTOMER_ID) AS 'TOTAL ORDERS', 
SUM(O.TOTAL_AMOUNT) AS 'TOTAL AMOUNT SPENT' ,
SUM(CASE 
		WHEN O.ORDER_DATE >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY) THEN O.TOTAL_AMOUNT 
        ELSE 0 
	END) AS 'AMOUNT SPENT LAST 30 DAYS'
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME;