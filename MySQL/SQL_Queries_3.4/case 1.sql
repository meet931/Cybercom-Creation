CREATE DATABASE SQL_Queries_3_4;
USE SQL_Queries_3_4;

-- ------------ CASE 1 ------------
-- Assume you are working on a database for a car dealership.

CREATE TABLE CARS (
	CAR_ID INT PRIMARY KEY,
    BRAND VARCHAR(50),
    MODEL VARCHAR(50),
    YEAR INT,
    MILEAGE INT,
    PRICE DECIMAL(10,2),
    AVAILABLE TINYINT
);

CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_NUMBER VARCHAR(20)
);

CREATE TABLE SALES (
	SALE_ID INT PRIMARY KEY,
    CAR_ID INT,
    CUSTOMER_ID INT,
    SALE_DATE DATE,
    SALE_PRICE DECIMAL(10,2),
    FOREIGN KEY (CAR_ID) REFERENCES CARS(CAR_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

INSERT INTO CARS 
(CAR_ID, BRAND, MODEL, YEAR, MILEAGE, PRICE, AVAILABLE)
VALUES
(1, 'Maruti', 'Swift', 2018, 25000, 550000.00, 3),
(2, 'Chevrolet Camaro', '1LT', 2015, 68601, 5600000.00, 1),
(3, 'Tata', 'Tiago', 2020, 15000, 500000.00, 5),
(4, 'Honda', 'City', 2017, 30000, 800000.00, 6),
(5, 'Toyota', 'Innova', 2015, 40000, 1200000.00, 1),
(6, 'Ford', 'Fusion', 2019, 32000, 700000.00, 1),
(7, 'Chevrolet', 'Malibu', 2020, 15000, 900000.00, 1),
(8, 'Hyundai', 'Elantra', 2018, 25000, 800000.00, 0),
(9, 'Honda', 'Civic', 2016, 40000, 850000.00, 1),
(10, 'Toyota', 'Corolla', 2017, 35000, 750000.00, 1);

INSERT INTO CUSTOMERS 
(CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER)
VALUES
(1, 'Rahul', 'Gupta', 'rahul@example.com', '1234567890'),
(2, 'Mitesh', 'Chaudhari', 'mitesh@example.com', '9876543210'),
(3, 'Amit', 'Patel', 'amit@example.com', '8765432109'),
(4, 'Pooja', 'Jain', 'pooja@example.com', '9087654321'),
(5, 'Suresh', 'Kumar', 'suresh@example.com', '8907654321'),
(6, 'Neha', 'Sharma', 'neha@example.com', '9876543210'),
(7, 'Rajesh', 'Mehta', 'rajesh@example.com', '8765432109'),
(8, 'Preeti', 'Singh', 'preeti@example.com', '9087654321'),
(9, 'Manish', 'Agarwal', 'manish@example.com', '8907654321'),
(10, 'Anita', 'Mishra', 'anita@example.com', '7654321098');

INSERT INTO SALES 
(SALE_ID, CAR_ID, CUSTOMER_ID, SALE_DATE, SALE_PRICE)
VALUES
(1, 1, 2, '2023-01-15', 550000.00),
(2, 2, 2, '2023-02-20', 5600000.00),
(3, 2, 4, '2023-03-25', 600000.00),
(4, 4, 3, '2023-04-30', 800000.00),
(5, 5, 5, '2023-05-10', 1200000.00),
(6, 6, 6, '2023-06-15', 700000.00),
(7, 7, 7, '2023-07-20', 900000.00),
(8, 8, 8, '2023-08-25', 800000.00),
(9, 9, 9, '2023-09-30', 850000.00),
(10, 10, 10, '2023-10-10', 750000.00);

SELECT * FROM CARS;
SELECT * FROM CUSTOMERS;
SELECT * FROM SALES;

-- Retrieve the top 10 most expensive cars from the Cars table.
SELECT CAR_ID, PRICE FROM CARS ORDER BY PRICE DESC LIMIT 10;

-- Retrieve the average price of all available cars from the Cars table.
SELECT AVG(PRICE) "AVERAGE PRICE" FROM CARS WHERE AVAILABLE >= 1;

-- Retrieve the list of customers who have purchased a car, along with the total number of cars each customer has purchased.
SELECT C.CUSTOMER_ID, COUNT(S.CUSTOMER_ID) AS "TOTAL CAR PURCHASED" FROM CUSTOMERS C
LEFT JOIN SALES S ON C.CUSTOMER_ID = S.CUSTOMER_ID
LEFT JOIN CARS CR ON S.CAR_ID = CR.CAR_ID
GROUP BY C.CUSTOMER_ID;

-- Retrieve the list of customers who have not yet made a purchase.
SELECT C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME FROM CUSTOMERS C
LEFT JOIN SALES S ON C.CUSTOMER_ID = S.CUSTOMER_ID
GROUP BY CUSTOMER_ID, FIRST_NAME, LAST_NAME
HAVING COUNT(S.CUSTOMER_ID) = 0;

-- Insert a new car into the Cars table with the following information: Brand='Toyota', Model='Corolla', Year=2022, Mileage=0, Price=20000, Available=1.
INSERT INTO CARS
VALUES
(11, 'Toyota', 'Corolla', '2022', 0, 20000, 1);

-- Update the price of all cars in the Cars table by adding 10% to their current price.
UPDATE CARS
SET PRICE = PRICE + (0.10 * PRICE);

-- Delete all sales from the Sales table that occurred before January 1, 2022.
DELETE FROM SALES
WHERE SALE_DATE < ('2022-01-01');