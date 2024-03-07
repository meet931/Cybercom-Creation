-- ------------ CASE 3 ------------

CREATE TABLE sales (
    id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2)
);

SELECT * FROM sales;

INSERT INTO sales (id, date, customer_id, product_id, quantity, total_price)
VALUES
(1, '2021-01-05', 1, 101, 2, 100.00),
(2, '2021-02-12', 2, 102, 1, 50.00),
(3, '2021-02-20', 3, 103, 3, 150.00),
(4, '2021-03-07', 1, 104, 2, 120.00),
(5, '2021-04-15', 2, 105, 1, 70.00),
(6, '2021-04-25', 3, 106, 4, 200.00),
(7, '2021-05-10', 1, 107, 3, 180.00),
(8, '2021-05-18', 2, 108, 1, 60.00),
(9, '2021-06-02', 3, 109, 2, 100.00),
(10, '2021-07-12', 1, 110, 1, 50.00),
(11, '2021-07-20', 2, 111, 2, 100.00),
(12, '2021-08-05', 3, 112, 3, 150.00),
(13, '2021-09-08', 1, 113, 2, 120.00),
(14, '2021-10-15', 2, 114, 1, 70.00),
(15, '2021-11-25', 3, 115, 4, 200.00),
(16, '2021-12-10', 1, 116, 3, 180.00),
(17, '2021-12-18', 2, 117, 1, 60.00),
(18, '2021-12-25', 3, 118, 2, 100.00);


-- Write a query to retrieve the total sales for each month in the year 2021, sorted in ascending order by month.

SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(total_price) AS total_sales
FROM sales
WHERE YEAR(date) = 2021
GROUP BY YEAR(date), MONTH(date)
ORDER BY YEAR(date), MONTH(date);

