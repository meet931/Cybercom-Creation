-- -------- CASE 2 --------
-- Write an SQL query to report all the classes that have at least five students. Return the result table in any order.

CREATE TABLE COURSES (
	STUDENT VARCHAR(50) NOT NULL,
    CLASS VARCHAR(50) NOT NULL,
    PRIMARY KEY(STUDENT, CLASS)
);

INSERT INTO COURSES 
(STUDENT, CLASS)
VALUES 
('A', 'Math '),
('B', 'English '),
('C', 'Math '),
('D', 'Biology'),
('E', 'Math '),
('F', 'Computer'),
('G', 'Math '),
('H', 'Math '),
('I', 'Math ');

SELECT CLASS FROM COURSES GROUP BY CLASS HAVING COUNT(STUDENT) >= 5;