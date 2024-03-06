-- 5. Write an SQL query to report all customers who never order anything. Return the result table in any order.

CREATE TABLE CUSTOMERS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(150)
);

CREATE TABLE ORDERS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(ID)
);

INSERT INTO CUSTOMERS
(NAME)
VALUES
('Joe'),
('Henry'),
('Sam'),
('Max');

INSERT INTO ORDERS 
(CUSTOMER_ID)
VALUES
(3),
(1);

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS ORDER BY 2 DESC;

SELECT c.NAME FROM CUSTOMERS c
LEFT JOIN ORDERS o ON c.ID = o.CUSTOMER_ID
WHERE  o.ID IS NULL;