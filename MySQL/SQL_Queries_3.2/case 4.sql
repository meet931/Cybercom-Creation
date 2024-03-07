-- ------------ CASE 4 ------------

-- Consider a table called "orders" with the following columns: "id", "customer_id", "order_date", "total_amount". 
-- Write a SQL query to calculate the total amount of orders for each customer, sorted in descending order by total amount.

CREATE TABLE ORDERS (
	ID INT AUTO_INCREMENT,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    TOTAL_AMOUT INT,
    PRIMARY KEY(ID, CUSTOMER_ID)
);

INSERT INTO ORDERS (CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUT) VALUES
(1, '2023-01-01', 500),
(2, '2023-01-02', 700),
(3, '2023-01-03', 900),
(4, '2023-01-04', 600),
(5, '2023-01-05', 800),
(1, '2023-01-06', 1000),
(2, '2023-01-07', 1200),
(3, '2023-01-08', 1500),
(4, '2023-01-09', 1100),
(5, '2023-01-10', 1300);

SELECT * FROM ORDERS;

SELECT CUSTOMER_ID, SUM(TOTAL_AMOUT) TOTAL_AMOUNT FROM ORDERS GROUP BY CUSTOMER_ID ORDER BY TOTAL_AMOUNT DESC;