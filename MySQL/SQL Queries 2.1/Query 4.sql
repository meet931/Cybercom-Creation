-- 4. Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. \
--    Return the result table in any order.

CREATE TABLE PERSON (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    EMAIL VARCHAR(255) NOT NULL
);

INSERT INTO PERSON 
(EMAIL)
VALUES
('john@example.com'),
('bob@example.com'),
('john@example.com');

DELETE FROM Person
WHERE id NOT IN (
    SELECT id
    FROM (
        SELECT MIN(id) AS id
        FROM Person
        GROUP BY email
    ) AS t
);

SELECT * FROM PERSON;

