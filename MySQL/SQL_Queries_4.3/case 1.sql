CREATE DATABASE SQL_Queries_4_3;
USE SQL_Queries_4_3;

-- ------------ CASE 1 ------------

DROP TABLE USERS;
DROP TABLE ORDERS;

CREATE TABLE USERS (
    ID INT PRIMARY KEY,
    NAME TEXT NOT NULL,
    EMAIL TEXT NOT NULL,
    PASSWORD TEXT NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ORDERS (
    ID INT PRIMARY KEY,
    USER_ID INT,
    AMOUNT FLOAT NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES USERS(ID),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert dummy data into the USERS table
INSERT INTO USERS (ID, NAME, EMAIL, PASSWORD) 
VALUES 
(1, 'Clert Jeson', 'clerk@example.com', 'password123'),
(2, 'Jane Smith', 'jane@example.com', 'secret321'),
(3, 'Alice Johnson', 'alice@example.com', 'pass123'),
(4, 'Bob Brown', 'bob@example.com', 'qwerty'),
(5, 'Mennie Rian', 'mennie@gmail.com', 'mennie123'),
(6, 'Abben Jie', 'abbentest@gmail.com', 'abben123'),
(7, 'Margie Patel', 'margietest@gmail.com', 'margie123');

INSERT INTO ORDERS (ID, USER_ID, AMOUNT) 
VALUES 
    (1, 1, 100.50),
    (2, 2, 200.75),
    (3, 3, 50.25),
    (4, 1, 75.00),
    (5, 4, 150.00),
    (6, 6, 70.00),
    (7, 7, 40.00);
    

SELECT * FROM USERS;
SELECT * FROM ORDERS;

-- 1. Create a new user with the following information:
-- name: John Doe
-- email: john.doe@example.com
-- password: 123456
-- created_at: current timestamp
-- updated_at: current timestamp
INSERT INTO USERS 
(ID, NAME, EMAIL, PASSWORD, CREATED_AT, UPDATED_AT)
VALUES
(6, 'John Doe', 'john.doe@example.com', '123456');


-- 2. Retrieve the names and email addresses of all users who have placed at least one order.
SELECT U.NAME, U.EMAIL FROM USERS U 
LEFT JOIN ORDERS O ON U.ID = O.USER_ID
GROUP BY U.NAME, U.EMAIL
HAVING COUNT(O.USER_ID) >= 1;


-- 3. Retrieve the total amount of orders placed by each user, sorted in descending order of total amount.
SELECT U.NAME, COUNT(USER_ID) AS "TOTAL AMOUNT OF ORDERS", SUM(O.AMOUNT) AS "TOTAL AMOUNT" FROM USERS U
LEFT JOIN ORDERS O ON U.ID = O.USER_ID
GROUP BY U.NAME
ORDER BY SUM(O.AMOUNT) DESC;


-- 4. Retrieve the email address of the user who has placed the most orders.
SELECT U.EMAIL, COUNT(O.USER_ID) AS 'NUMBER OF ORDERS' FROM USERS U
LEFT JOIN ORDERS O ON U.ID = O.USER_ID
GROUP BY U.EMAIL
ORDER BY COUNT(O.USER_ID) DESC LIMIT 1;


-- 5. Retrieve the user IDs and the total amount of orders placed by users who have placed at least one order and whose total amount of orders exceeds $100.
SELECT U.ID, SUM(O.AMOUNT) AS 'TOTAL AMOUNT OF ORDERS' FROM USERS U
LEFT JOIN ORDERS O ON U.ID = O.USER_ID
GROUP BY U.ID
HAVING COUNT(O.USER_ID) >= 1 AND SUM(O.AMOUNT) > 100;


-- 6. Retrieve the number of users who have not placed any orders.
SELECT U.ID, U.NAME, COUNT(O.USER_ID) AS 'NUM OF ORDERS' FROM USERS U
LEFT JOIN ORDERS O ON U.ID = O.USER_ID
GROUP BY U.ID, U.NAME
HAVING COUNT(O.USER_ID) = 0;


-- 7. Update the user with ID 1 to change their email address to "jane.doe@example.com".
UPDATE USERS SET EMAIL = "jane.doe@example.com" WHERE ID = 1;


-- 8. Delete all orders placed by users whose email address contains the string "test".
DELETE FROM ORDERS
WHERE USER_ID IN (SELECT ID FROM USERS WHERE EMAIL LIKE "%test%");


-- 9. Retrieve the total amount of orders placed on each day of the current week, grouped by day.
SELECT DATE(CREATED_AT) AS ORDER_DATE, SUM(AMOUNT) AS TOTAL_AMOUNT FROM ORDERS
WHERE WEEK(CREATED_AT) = WEEK(CURRENT_DATE)
GROUP BY ORDER_DATE;


-- 10. Retrieve the IDs and email addresses of users who have placed an order in the current year and whose email address is in the format "example.com".
SELECT U.ID, U.EMAIL FROM USERS U
LEFT JOIN ORDERS O ON U.ID = O.USER_ID
WHERE  YEAR(O.CREATED_AT) = '2024' AND U.EMAIL LIKE "%example.com"
GROUP BY U.ID, U.EMAIL;