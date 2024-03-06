-- 2. Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring". 
--    Return the result table ordered by rating in descending order.

CREATE TABLE CINEMA (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    MOVIE VARCHAR(100),
    DESCRIPTION TEXT,
    RATING DECIMAL(3,1)
);

INSERT INTO CINEMA
(MOVIE, DESCRIPTION, RATING)
VALUES
('War', 'great 3D', '8.9'),
('Science', 'fiction', '8.5'),
('irish', 'boring', '6.2'),
('Ice song', 'Fantacy', '8.6'),
('House card', 'Interesting', '9.1');

SELECT * FROM CINEMA WHERE ID % 2 <> 0 AND DESCRIPTION <> 'boring' ORDER BY 4 DESC;