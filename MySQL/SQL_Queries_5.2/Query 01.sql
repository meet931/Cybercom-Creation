-- 1. Write a SQL query to retrieve the names of all customers who have placed orders for products in the "Electronics" category, along with the total amount they have spent 
--    on all orders. The output should be sorted by the total amount spent in descending order.

CREATE DATABASE SQL_Queries_5_2;
USE SQL_Queries_5_2;

CREATE TABLE CUSTOMERS (
    CUSTOMERID INT PRIMARY KEY,
    NAME VARCHAR(50),
    EMAIL VARCHAR(100)
);

CREATE TABLE ORDERS (
    ORDERID INT PRIMARY KEY,
    CUSTOMERID INT,
    ORDERDATE DATE,
    FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);

CREATE TABLE PRODUCTS (
    PRODUCTID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2)
);

CREATE TABLE ORDERDETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDERID INT,
    PRODUCTID INT,
    QUANTITY INT,
    FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID),
    FOREIGN KEY (PRODUCTID) REFERENCES PRODUCTS(PRODUCTID)
);

INSERT INTO CUSTOMERS (CUSTOMERID, NAME, EMAIL) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com');

INSERT INTO ORDERS (ORDERID, CUSTOMERID, ORDERDATE) VALUES
(1, 1, '2024-03-13'),
(2, 2, '2024-03-12');

INSERT INTO PRODUCTS (PRODUCTID, NAME, CATEGORY, PRICE) VALUES
(1, 'Laptop', 'Electronics', 999.99),
(2, 'Smartphone', 'Electronics', 599.99),
(3, 'T-shirt', 'Clothing', 19.99),
(4, 'Headphones', 'Electronics', 49.99),
(5, 'Smart TV', 'Electronics', 799.99),
(6, 'Digital Camera', 'Electronics', 349.99),
(7, 'Wireless Mouse', 'Electronics', 29.99),
(8, 'Fitness Tracker', 'Electronics', 89.99),
(9, 'Jeans', 'Clothing', 39.99),
(10, 'Running Shoes', 'Footwear', 99.99),
(11, 'Backpack', 'Accessories', 49.99),
(12, 'Watch', 'Accessories', 199.99),
(13, 'Office Chair', 'Furniture', 249.99);


INSERT INTO ORDERDETAILS (ORDERDETAILID, ORDERID, PRODUCTID, QUANTITY) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 2, 1, 1);

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERDETAILS;

SELECT C.NAME AS CUSTOMER_NAME, SUM(P.PRICE * OD.QUANTITY) AS TOTALAMOUNTSPENT FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
JOIN ORDERDETAILS OD ON O.ORDERID = OD.ORDERID
JOIN PRODUCTS P ON OD.PRODUCTID = P.PRODUCTID
WHERE P.CATEGORY = 'Electronics'
GROUP BY C.NAME
ORDER BY TOTALAMOUNTSPENT DESC;