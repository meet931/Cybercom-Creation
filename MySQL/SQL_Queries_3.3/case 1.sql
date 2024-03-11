CREATE DATABASE SQL_Queries_3_3;
USE SQL_Queries_3_3;

-- ------------ CASE 1 ------------
-- Consider a table called "books" with the following columns: "id", "title", "author", "publication_year". 
-- Write a SQL query to retrieve the title and author of the oldest book in the table.

CREATE TABLE BOOKS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(50) NOT NULL,
    AUTHOR VARCHAR(50) NOT NULL,
    PUBLICATION_YEAR INT   -- used INT because YEAR has range from 1901 to 2155.
);

INSERT INTO BOOKS 
(TITLE, AUTHOR, PUBLICATION_YEAR) 
VALUES
('To Kill a Mockingbird', 'Harper Lee', 1960),
('1984', 'George Orwell', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('Pride and Prejudice', 'Jane Austen', 1813),
('The Catcher in the Rye', 'J.D. Salinger', 1951),
('The Hobbit', 'J.R.R. Tolkien', 1937);

SELECT TITLE, AUTHOR, PUBLICATION_YEAR FROM BOOKS WHERE PUBLICATION_YEAR = (SELECT MIN(PUBLICATION_YEAR) FROM BOOKS);