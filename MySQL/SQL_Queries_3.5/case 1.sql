CREATE DATABASE SQL_Queries_3_5;
USE SQL_Queries_3_5;

-- ------------ CASE 1 ------------
CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    PHONE VARCHAR(50)
);

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    ORDER_DATE DATE,
    CUSTOMER_ID INT,
    PRODUCT_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

CREATE TABLE PRODUCTS (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(255),
    UNIT_PRICE DECIMAL(10, 2),
    DESCRIPTION TEXT
);

-- 1. Insert at least five customers, five products, and ten orders into the respective tables. Make sure that at least two customers have multiple orders,
--    and at least two products are included in multiple orders.
INSERT INTO CUSTOMERS (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '456-789-0123'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '789-012-3456'),
(5, 'David', 'Wilson', 'david.wilson@example.com', '321-654-9870');

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE, DESCRIPTION)
VALUES
(1, 'Laptop', 1200.00, 'High-performance laptop with SSD'),
(2, 'Smartphone', 800.00, 'Latest smartphone with high-resolution camera'),
(3, 'Tablet', 600.00, 'Lightweight and portable tablet'),
(4, 'Headphones', 150.00, 'Noise-canceling headphones with Bluetooth'),
(5, 'Smartwatch', 250.00, 'Fitness tracking smartwatch with heart rate monitor');

INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, CUSTOMER_ID, PRODUCT_ID)
VALUES
(1, '2024-01-15', 1, 1),
(2, '2024-02-20', 1, 2),
(3, '2024-03-10', 2, 1),
(4, '2024-04-05', 4, 3),
(5, '2024-05-12', 5, 2),
(6, '2024-06-18', 4, 2),
(7, '2024-07-22', 2, 3),
(8, '2024-08-30', 1, 4),
(9, '2024-09-05', 3, 5),
(10, '2024-10-10', 1, 1),
(11, '2024-11-15', 3, 3),
(12, '2024-12-20', 5, 4),
(13, '2025-01-25', 3, 5),
(14, '2025-02-28', 4, 1),
(15, '2025-03-05', 2, 2),
(16, '2025-04-10', 1, 4),
(17, '2025-05-15', 2, 5),
(18, '2025-06-20', 5, 1),
(19, '2025-07-25', 1, 2),
(20, '2025-08-30', 5, 3);

SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;


-- 2. Write a query that retrieves the customer's first name, last name, email, and the number of orders they have placed. The results should be ordered by
--    the number of orders in descending order.
SELECT C.FIRST_NAME, C.LAST_NAME, C.EMAIL, COUNT(O.CUSTOMER_ID) AS "NO. OF ORDERS PLACED" FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME, C.LAST_NAME, C.EMAIL
ORDER BY COUNT(O.CUSTOMER_ID) DESC;


-- 3. Write a query that retrieves the product name, the total number of orders for each product, and the total revenue generated by each product. The results
--    should be ordered by the total revenue in descending order.
SELECT P.PRODUCT_NAME, COUNT(O.PRODUCT_ID) AS "TOTAL PRODUCTS", SUM(P.UNIT_PRICE) AS "TOTAL REVENUE" FROM PRODUCTS P
LEFT JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
ORDER BY SUM(P.UNIT_PRICE) DESC;


-- 4. Write a query that retrieves the first name, last name, email, and product name for each order. The results should only include orders where the customer
--    has placed multiple orders.
SELECT C.FIRST_NAME, C.LAST_NAME, C.EMAIL, P.PRODUCT_NAME FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE C.CUSTOMER_ID IN 
(SELECT CUSTOMER_ID FROM ORDERS GROUP BY CUSTOMER_ID HAVING COUNT(CUSTOMER_ID) > 1);


-- 5. Write a query that retrieves the first name, last name, and email for each customer who has placed at least one order for a product with a unit price greater than $50.
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE P.UNIT_PRICE > 50;


-- 6. Write a query that retrieves the product name and the number of times it has been ordered, but only includes products that have been ordered more than once.
SELECT P.PRODUCT_NAME, COUNT(O.PRODUCT_ID) AS "NO. OF TIMES IT'S ORDERED" FROM PRODUCTS P 
JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
HAVING COUNT(P.PRODUCT_ID) > 1;