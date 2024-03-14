-- 4. Write a SQL query to retrieve the names of all employees who have sold at least one product to a customer who has a shipping 
--    address in the same city as the employee. The output should only include employees who have made at least one such sale.

CREATE TABLE EMPLOYEESQ4 (
    EMPLOYEEID INT PRIMARY KEY,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    CITY VARCHAR(50)
);

CREATE TABLE SALESQ4 (
    SALEID INT PRIMARY KEY,
    EMPLOYEEID INT,
    PRODUCTID INT,
    QUANTITY INT,
    CUSTOMERID INT,
    FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEESQ4(EMPLOYEEID),
    FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERSQ4(CUSTOMERID)
);

CREATE TABLE PRODUCTSQ4 (
    PRODUCTID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2)
);

CREATE TABLE CUSTOMERSQ4 (
    CUSTOMERID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SHIPPING_ADDRESS VARCHAR(100),
    CITY VARCHAR(50)
);

INSERT INTO EMPLOYEESQ4 (EMPLOYEEID, NAME, DEPARTMENT, CITY) VALUES
(1, 'John Doe', 'Sales', 'New York'),
(2, 'Jane Smith', 'Sales', 'Los Angeles'),
(3, 'Michael Johnson', 'Sales', 'Chicago'),
(4, 'Emily White', 'Marketing', 'San Francisco'),
(5, 'David Brown', 'Operations', 'Boston');

INSERT INTO SALESQ4 (SALEID, EMPLOYEEID, PRODUCTID, QUANTITY, CUSTOMERID) VALUES
(1, 1, 1, 2, 1),
(2, 2, 2, 1, 2),
(3, 3, 3, 3, 3),
(4, 1, 2, 2, 1),
(5, 2, 1, 1, 2),
(6, 4, 4, 2, 4),
(7, 5, 5, 1, 5),
(8, 3, 6, 1, 3),
(9, 4, 1, 3, 4),
(10, 5, 2, 2, 5);

INSERT INTO PRODUCTSQ4 (PRODUCTID, NAME, CATEGORY, PRICE) VALUES
(1, 'Laptop', 'Electronics', 999.99),
(2, 'Smartphone', 'Electronics', 599.99),
(3, 'T-shirt', 'Clothing', 19.99),
(4, 'Headphones', 'Electronics', 49.99),
(5, 'Dress', 'Clothing', 59.99),
(6, 'Sneakers', 'Footwear', 79.99),
(7, 'Tablet', 'Electronics', 399.99),
(8, 'Smartwatch', 'Electronics', 199.99),
(9, 'Bluetooth Speaker', 'Electronics', 79.99),
(10, 'Gaming Console', 'Electronics', 499.99),
(11, 'Wireless Earbuds', 'Electronics', 129.99);


INSERT INTO CUSTOMERSQ4 (CUSTOMERID, NAME, SHIPPING_ADDRESS, CITY) VALUES
(1, 'Alice Johnson', '123 Main St, New York', 'New York'),
(2, 'Bob Smith', '456 Elm St, Los Angeles', 'Los Angeles'),
(3, 'Charlie Brown', '789 Oak St, Chicago', 'Chicago'),
(4, 'Emma Green', '321 Pine St, San Francisco', 'San Francisco'),
(5, 'Frank Lee', '654 Maple St, Boston', 'Boston');

SELECT * FROM EMPLOYEESQ4;
SELECT * FROM SALESQ4;
SELECT * FROM PRODUCTSQ4;
SELECT * FROM CUSTOMERSQ4;

SELECT E.EMPLOYEEID, E.NAME FROM EMPLOYEESQ4 E
INNER JOIN SALESQ4 S ON E.EMPLOYEEID = S.EMPLOYEEID
INNER JOIN CUSTOMERSQ4 C ON S.CUSTOMERID = C.CUSTOMERID
WHERE E.CITY = C.CITY
GROUP BY E.EMPLOYEEID;