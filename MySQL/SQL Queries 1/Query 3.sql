-- 3. Create a database structure for worldwide cricket team. Database will contain 
--    each player’s name, its country, its expertise and so on.

CREATE TABLE COUNTRY (
	COUNTRY_ID INT AUTO_INCREMENT PRIMARY KEY,
    COUNTRY_NAME VARCHAR(150)
);

CREATE TABLE PLAYERS (
	PLAYER_ID INT AUTO_INCREMENT PRIMARY KEY,
    PLAYER_NAME VARCHAR(150) NOT NULL,
    COUNTRY_ID INT,
    EXPERTISE VARCHAR(150),
    FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY(COUNTRY_ID)
);