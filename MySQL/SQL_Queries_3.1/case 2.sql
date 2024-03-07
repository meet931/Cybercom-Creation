-- ------------ CASE 2 ------------

CREATE TABLE inventory (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    quantity INT,
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO inventory (id, name, quantity, price, category)
VALUES
(1, 'Laptop', 10, 899.99, 'Electronics'),
(2, 'Desk Chair', 20, 149.99, 'Furniture'),
(3, 'Printer', 5, 299.99, 'Electronics'),
(4, 'Bookshelf', 15, 79.99, 'Furniture'),
(5, 'Mouse', 30, 29.99, 'Electronics');

SELECT * FROM inventory;

-- Write a query to retrieve the name and price of all items in the inventory where the quantity is greater than 0 and 
-- the category is 'electronics', sorted in descending order by price.

SELECT name, price FROM inventory WHERE quantity > 0 AND category = 'electronics';