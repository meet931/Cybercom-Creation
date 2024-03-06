-- 3. Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement 
-- and no intermediate temporary tables.Note that you must write a single update statement, do not write any select statement for this problem.

CREATE TABLE SALARY (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    SEX ENUM('M', 'F', 'O'),
	SALARY BIGINT
);

INSERT INTO SALARY 
(NAME, SEX, SALARY)
VALUES
('A', 'M', '2500'),
('B', 'F', '1500'),
('C', 'M', '5500'),
('D', 'F', '500');

UPDATE SALARY SET SEX = 
CASE 
	WHEN SEX = 'M' THEN 'F'
    WHEN SEX = 'F' THEN 'M'
END;
