-- ------------ CASE 2 ------------
-- Consider the following table structure for a social media platform:

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP
);
CREATE TABLE posts (
    id INT PRIMARY KEY,
    user_id INT,
    body TEXT,
    created_at TIMESTAMP
);
CREATE TABLE likes (
    id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    created_at TIMESTAMP
);

INSERT INTO users (id, name, created_at) VALUES
(1, 'John Doe', '2023-01-01 10:00:00'),
(2, 'Jane Smith', '2023-01-02 11:00:00'),
(3, 'Bob Johnson', '2023-01-03 12:00:00'),
(4, 'Rahul Kumar', '2022-05-15 09:30:00'),
(5, 'Priya Sharma', '2022-07-20 14:45:00');

INSERT INTO posts (id, user_id, body, created_at) VALUES
(1, 1, 'This is the first post.', '2023-01-01 10:00:00'),
(2, 2, 'Hello, world!', '2023-01-02 11:00:00'),
(3, 3, 'Post number three.', '2023-01-03 12:00:00'),
(4, 4, 'Excited to join this platform!', '2022-05-15 09:30:00'),
(5, 5, 'New user, looking forward to interacting!', '2022-07-20 14:45:00');

INSERT INTO likes (id, user_id, post_id, created_at) VALUES
(1, 2, 1, '2023-01-01 10:00:00'),
(2, 3, 1, '2023-01-01 11:00:00'),
(3, 1, 2, '2023-01-02 12:00:00'),
(4, 3, 3, '2023-01-03 13:00:00'),
(5, 2, 3, '2023-01-03 14:00:00'),
(6, 1, 4, '2022-05-15 10:00:00'),
(7, 2, 4, '2022-05-15 10:30:00'),
(8, 3, 5, '2022-07-20 15:00:00'),
(9, 1, 5, '2022-07-20 15:30:00');

SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM likes;

-- Write a query to retrieve the name and number of posts for each user who joined the platform in the year 2022, 
-- along with the total number of likes received for each user's posts.

SELECT u.name, COUNT(DISTINCT p.id) "Number of Posts", COUNT(l.id) "Number of Likes" FROM users u
LEFT JOIN posts p ON u.id = p.user_id
LEFT JOIN likes l ON p.id = l.post_id
WHERE YEAR(u.created_at) = 2022
GROUP BY u.id, u.name;

