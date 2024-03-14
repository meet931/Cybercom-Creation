-- 2. Write a SQL query to retrieve the names of all employees who have sold at least one product in the "Clothing" category, along with the total revenue 
--    they have generated from those sales. The output should be sorted by total revenue generated in descending order.

CREATE TABLE EMPLOYEESQ2 (
    EMPLOYEEID INT PRIMARY KEY,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50)
);

CREATE TABLE SALESQ2 (
    SALEID INT PRIMARY KEY,
    EMPLOYEEID INT,
    PRODUCTID INT,
    QUANTITY INT,
    FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEESQ2(EMPLOYEEID)
);

CREATE TABLE PRODUCTSQ2 (
    PRODUCTID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2)
);

INSERT INTO EMPLOYEESQ2 (EMPLOYEEID, NAME, DEPARTMENT) VALUES
(1, 'John Doe', 'Sales'),
(2, 'Jane Smith', 'Sales'),
(3, 'Michael Johnson', 'Sales'),
(4, 'Emily White', 'Sales'),
(5, 'David Brown', 'Sales');

INSERT INTO PRODUCTSQ2 (PRODUCTID, NAME, CATEGORY, PRICE) VALUES
(1, 'Shirt', 'Clothing', 29.99),
(2, 'Pants', 'Clothing', 39.99),
(3, 'Shoes', 'Footwear', 49.99),
(4, 'Dress', 'Clothing', 59.99),
(5, 'Socks', 'Clothing', 9.99),
(6, 'Sandals', 'Footwear', 34.99),
(7, 'T-shirt', 'Clothing', 19.99),
(8, 'Jeans', 'Clothing', 49.99),
(9, 'Hat', 'Accessories', 14.99),
(10, 'Jacket', 'Clothing', 79.99),
(11, 'Watch', 'Accessories', 99.99);

INSERT INTO SALESQ2 (SALEID, EMPLOYEEID, PRODUCTID, QUANTITY) VALUES
(1, 1, 1, 3),
(2, 2, 2, 2),
(3, 1, 3, 1),
(4, 2, 1, 2),
(5, 1, 2, 2),
(6, 3, 4, 2),
(7, 4, 5, 3),
(8, 5, 6, 1),
(9, 3, 1, 4),
(10, 4, 3, 2);


SELECT * FROM EMPLOYEESQ2;
SELECT * FROM SALESQ2;
SELECT * FROM PRODUCTSQ2;

SELECT E.NAME AS EMPLOYEE_NAME, SUM(P.PRICE * S.QUANTITY) AS TOTAL_REVENUE_GENERATED FROM EMPLOYEESQ2 E
JOIN SALESQ2 S ON E.EMPLOYEEID = S.EMPLOYEEID
JOIN PRODUCTSQ2 P ON S.PRODUCTID = P.PRODUCTID
WHERE P.CATEGORY = 'Clothing'
GROUP BY E.NAME
ORDER BY TOTAL_REVENUE_GENERATED DESC;