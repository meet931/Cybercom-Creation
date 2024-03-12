CREATE DATABASE SQL_Queries_5_1;
USE SQL_Queries_5_1;

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAILS;
SELECT * FROM EMPLOYEES;
SELECT * FROM PRODUCTS;
SELECT * FROM DEPARTMENTS;

DROP TABLE CUSTOMERS;
DROP TABLE ORDERS;
DROP TABLE ORDER_DETAILS;
DROP TABLE EMPLOYEES;
DROP TABLE PRODUCTS;
DROP TABLE DEPARTMENTS;

CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(255),
    COUNTRY_NAME VARCHAR(255)
);

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    TOTAL_AMOUNT DECIMAL(10, 2),
    ORDER_DATE DATE,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE ORDER_DETAILS (
    ORDER_DETAIL_ID INT PRIMARY KEY,
    ORDER_ID INT,
    PRODUCT_ID INT,
    AMOUNT DECIMAL(10, 2),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR(255),
    DEPARTMENT_ID INT,
    SALARY DECIMAL(10, 2),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);

CREATE TABLE PRODUCTS (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(255),
    PRICE DECIMAL(10, 2)
);

CREATE TABLE DEPARTMENTS (
    DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(255),
    MANAGER_ID INT,
    LOCATION VARCHAR(255)
);


INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, COUNTRY_NAME)
VALUES
    (1, 'John Doe', 'USA'),
    (2, 'Jane Smith', 'Canada'),
    (3, 'David Johnson', 'UK'),
    (4, 'Emily Wilson', 'Australia'),
    (5, 'Michael Brown', 'Germany'),
    (6, 'Sophia Martinez', 'France'),
    (7, 'William Taylor', 'Japan'),
    (8, 'Olivia Garcia', 'Mexico'),
    (9, 'James Rodriguez', 'Brazil'),
    (10, 'Isabella Hernandez', 'Spain'),
    (11, 'Liam Wilson', 'Ireland'),
    (12, 'Ava Anderson', 'Italy'),
    (13, 'Noah Martinez', 'Argentina'),
    (14, 'Emma Lopez', 'China'),
    (15, 'William Gonzalez', 'Russia'),
    (16, 'Sophia Perez', 'South Africa'),
    (17, 'James Lee', 'India'),
    (18, 'Olivia Kim', 'South Korea'),
    (19, 'Benjamin Park', 'Sweden'),
    (20, 'Charlotte Wong', 'Singapore');

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, TOTAL_AMOUNT, ORDER_DATE)
VALUES
    (101, 1, 150.00, '2024-03-10'),
    (102, 2, 200.00, '2024-03-11'),
    (103, 1, 100.00, '2024-03-12'),
    (104, 5, 250.00, '2024-03-13'),
    (105, 3, 300.00, '2024-03-14'),
    (106, 6, 180.00, '2024-03-15'),
    (107, 2, 220.00, '2024-03-16'),
    (108, 1, 175.00, '2024-03-17'),
    (109, 9, 150.00, '2024-03-18'),
    (110, 11, 200.00, '2024-03-19'),
    (111, 10, 180.00, '2024-03-20'),
    (112, 12, 220.00, '2024-03-21'),
    (113, 11, 130.00, '2024-03-22'),
    (114, 2, 280.00, '2024-03-23'),
    (115, 5, 320.00, '2024-03-24'),
    (116, 10, 190.00, '2024-03-25'),
    (117, 10, 230.00, '2024-03-26'),
    (118, 18, 185.00, '2024-03-27'),
    (119, 19, 160.00, '2024-03-28'),
    (120, 20, 210.00, '2024-03-29');

INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, AMOUNT)
VALUES
    (201, 101, 1, 50.00),
    (202, 102, 2, 100.00),
    (203, 103, 3, 100.00),
    (204, 104, 1, 150.00),
    (205, 105, 2, 200.00),
    (206, 106, 3, 120.00),
    (207, 107, 1, 100.00),
    (208, 108, 2, 125.00),
    (209, 109, 3, 100.00),
    (210, 110, 1, 150.00),
    (211, 111, 1, 60.00),
    (212, 112, 2, 120.00),
    (213, 113, 3, 80.00),
    (214, 114, 1, 200.00),
    (215, 115, 2, 250.00),
    (216, 116, 3, 110.00),
    (217, 117, 1, 120.00),
    (218, 118, 2, 95.00),
    (219, 119, 3, 80.00),
    (220, 120, 1, 180.00);

INSERT INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_NAME, DEPARTMENT_ID, SALARY)
VALUES
    (1, 'Michael Johnson', 1, 50000.00),
    (2, 'Emily Brown', 2, 60000.00),
    (3, 'Daniel Clark', 1, 55000.00),
    (4, 'Jessica Miller', 2, 62000.00),
    (5, 'Matthew Davis', 1, 51000.00),
    (6, 'Aiden Hernandez', 3, 58000.00),
    (7, 'Mia Nelson', 1, 53000.00),
    (8, 'Ethan Carter', 2, 65000.00),
    (9, 'Harper King', 1, 56000.00),
    (10, 'Elijah Rivera', 3, 60000.00);

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, PRICE)
VALUES
    (1, 'Widget', 25.00),
    (2, 'Gadget', 50.00),
    (3, 'Thingamajig', 75.00),
    (4, 'Doodad', 30.00),
    (5, 'Contraption', 55.00),
    (6, 'Widget2', 40.00);

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION)
VALUES
    (1, 'Sales', 1, 'New York'),
    (2, 'Marketing', 2, 'Los Angeles'),
    (3, 'Finance', 3, 'Chicago'),
    (4, 'Human Resources', 6, 'London'),
    (5, 'Research and Development', 7, 'Berlin'),
    (6, 'Operations', 8, 'Paris'),
    (7, 'Information Technology', 9, 'Tokyo'),
    (8, 'Customer Service', 10, 'Sydney');

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAILS;
SELECT * FROM EMPLOYEES;
SELECT * FROM PRODUCTS;
SELECT * FROM DEPARTMENTS;


-- 1. Write a SQL query to retrieve the top 10 customers who have made the most orders in the "orders" table, along with the total number of orders they have made.
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, COUNT(O.CUSTOMER_ID) AS "TOTAL ORDERS" FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME 
ORDER BY COUNT(CUSTOMER_ID) DESC
LIMIT 10;

-- --------------------------------------------------------------

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR(50)
);

CREATE TABLE ORDER_DETAILST2 (
    ORDER_ID INT PRIMARY KEY,
    EMPLOYEE_ID INT,
    AMOUNT DECIMAL(10, 2),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
);

INSERT INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_NAME) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(4, 'Eve');

INSERT INTO ORDER_DETAILST2 (ORDER_ID, EMPLOYEE_ID, AMOUNT) VALUES
(101, 1, 120000.00),
(102, 2, 95000.00),
(103, 3, 130000.00),
(104, 1, 80000.00),
(105, 4, 110000.00),
(106, 2, 105000.00),
(107, 1, 140000.00),
(108, 3, 90000.00),
(109, 4, 115000.00),
(110, 2, 125000.00);

SELECT * FROM EMPLOYEES;
SELECT * FROM ORDER_DETAILST2;
DROP TABLE ORDERST2;

-- 2. Write a SQL query to retrieve the names of all employees who have sold more than $100,000 worth of products in the "order_details" table, sorted by the amount 
--    sold in descending order.
SELECT E.EMPLOYEE_NAME, COUNT(O.EMPLOYEE_ID) AS 'TOTAL ORDERS', SUM(O.AMOUNT) AS 'TOTAL PRICE' FROM EMPLOYEES E
LEFT JOIN ORDER_DETAILST2 O ON E.EMPLOYEE_ID = O.EMPLOYEE_ID
GROUP BY E.EMPLOYEE_NAME
HAVING SUM(O.AMOUNT) > 100000
ORDER BY SUM(O.AMOUNT) DESC;
  
-- ---------------------------------------------------------------------  

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
  
-- 4. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the average salary of all employees in the "employees" table, 
--    sorted by salary in descending order.
  
-- 5. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not made any orders in the last 90 days.
  
-- 6. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the minimum salary of their department in the "employees" table, 
--    sorted by department ID and then by salary in descending order.
  
-- 7. Write a SQL query to retrieve the names and salaries of the five highest paid employees in each department of the "employees" table, sorted by department ID and then 
--    by salary in descending order.
  
-- 8. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not made any orders for products in the "products" table 
--    with a price greater than $100.
  
-- 9. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total amount they have spent on all orders and the 
--    average amount they have spent per order.
  
-- 10. Write a SQL query to retrieve the names of all products in the "products" table that have been ordered by customers in more than one country, along with the names of 
--     the countries where the products have been ordered.
