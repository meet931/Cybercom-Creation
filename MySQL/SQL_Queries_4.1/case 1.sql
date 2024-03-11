CREATE DATABASE SQL_Queries_4_1;
USE SQL_Queries_4_1;

DROP TABLE AUTHORS;
DROP TABLE BOOK_CATEGORIES;
-- ------------ CASE 1 ------------
CREATE TABLE BOOKS (
	ID INT PRIMARY KEY,
    TITLE VARCHAR(50),
    AUTHOR_ID INT,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(ID)
);

CREATE TABLE AUTHORS (
	ID INT PRIMARY KEY,
    NAME VARCHAR(50)
);

CREATE TABLE BOOK_CATEGORIES (
	ID INT PRIMARY KEY,
    NAME VARCHAR(50)
);

CREATE TABLE BOOK_CATEGORY_MAPPINGS (
	ID INT PRIMARY KEY,
    BOOK_ID INT,
    CATEGORY_ID INT,
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(ID),
    FOREIGN KEY (CATEGORY_ID) REFERENCES BOOK_CATEGORIES(ID)
);

INSERT INTO AUTHORS (ID, NAME)
VALUES
(1, 'Stephen King'),
(2, 'J.K. Rowling'),
(3, 'Agatha Christie');

INSERT INTO BOOK_CATEGORIES (ID, NAME)
VALUES
(1, 'Fiction'),
(2, 'Mystery'),
(3, 'Thriller');

INSERT INTO BOOKS (ID, TITLE, AUTHOR_ID, PUBLICATION_DATE)
VALUES
(1, 'The Shining', 1, '1977-01-28'),
(2, 'Harry Potter and the Philosopher''s Stone', 2, '1997-06-26'),
(3, 'Murder on the Orient Express', 3, '1934-01-01'),
(4, 'It', 1, '1986-09-15'),
(5, 'The Murder of Roger Ackroyd', 3, '1926-06-19'),
(6, 'Harry Potter and the Chamber of Secrets', 2, '1998-07-02'),
(7, 'Misery', 1, '1987-06-08'),
(8, 'Death on the Nile', 3, '1937-11-01'),
(9, 'Book Title 2020', 1, '2020-01-01'),
(10, 'Another Book 2020', 2, '2020-05-15');

INSERT INTO BOOK_CATEGORY_MAPPINGS (ID, BOOK_ID, CATEGORY_ID)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 1);


SELECT * FROM BOOKS; 
SELECT * FROM AUTHORS;
SELECT * FROM BOOK_CATEGORIES;
SELECT * FROM BOOK_CATEGORY_MAPPINGS;


-- 1. Write a query to find all books published in the year 2020.
SELECT * FROM BOOKS WHERE PUBLICATION_DATE LIKE '2020%';

-- 2. Write a query to find the name of the author who has written the most number of books.
SELECT A.NAME, COUNT(B.AUTHOR_ID) AS "NUMBER OF BOOKS WRITEN" FROM AUTHORS A
LEFT JOIN BOOKS B ON A.ID = B.AUTHOR_ID
GROUP BY A.NAME
HAVING COUNT(B.AUTHOR_ID) > 1;


-- 3. Write a query to find the name of the category with the most number of books.
SELECT BC.NAME, COUNT(BCM.BOOK_ID) AS "NUMBER OF BOOKS" FROM BOOK_CATEGORIES BC
JOIN BOOK_CATEGORY_MAPPINGS BCM ON BC.ID = BCM.CATEGORY_ID
GROUP BY BC.NAME
ORDER BY COUNT(BCM.BOOK_ID) DESC
LIMIT 1;


-- 4. Write a query to find the name of the author who has written the most number of books in the category "fiction".
SELECT A.NAME, COUNT(BCM.CATEGORY_ID) AS "Number of Books" FROM AUTHORS A
JOIN BOOKS B ON A.ID = B.AUTHOR_ID
JOIN BOOK_CATEGORY_MAPPINGS BCM ON B.ID = BCM.BOOK_ID
JOIN BOOK_CATEGORIES BC ON BCM.CATEGORY_ID = BC.ID
WHERE BC.NAME = 'Fiction'
GROUP BY A.NAME
ORDER BY COUNT(B.ID) DESC
LIMIT 1;


-- 5. Write a query to find the titles of the top 5 most popular books. The popularity of a book is defined as the number of times it has been borrowed by customers. 
--    Assume that information about book borrowings is stored in a separate table called book_borrowings with the following columns:
-- id: unique identifier for each borrowing
-- book_id: foreign key pointing to the books table
-- customer_id: foreign key pointing to the customers table
-- borrow_date: date on which the book was borrowed
SELECT B.TITLE, COUNT(BB.ID) AS "Number of Borrowings"
FROM BOOKS B
LEFT JOIN BOOK_BORROWINGS BB ON B.ID = BB.BOOK_ID
GROUP BY B.TITLE
ORDER BY COUNT(BB.ID) DESC
LIMIT 5;

