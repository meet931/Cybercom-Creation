CREATE DATABASE SQL_Queries_3_2;

USE SQL_Queries_3_2;

-- ------------ CASE 1 ------------
CREATE TABLE blog_posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    author_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
CREATE TABLE blog_comments (
    id INT PRIMARY KEY,
    post_id INT,
    body TEXT,
    author_id INT,
    created_at TIMESTAMP
);

INSERT INTO blog_posts (id, title, body, author_id, created_at, updated_at)
VALUES
(1, 'First Post', 'This is the first post body.', 1, '2022-01-01 10:00:00', '2022-01-01 10:00:00'),
(2, 'Second Post', 'This is the second post body.', 2, '2022-01-02 11:00:00', '2022-01-02 11:00:00'),
(3, 'Third Post', 'This is the third post body.', 3, '2022-01-03 12:00:00', '2022-01-03 12:00:00'),
(4, 'Fourth Post', 'This is the fourth post body.', 1, '2022-01-04 13:00:00', '2022-01-04 13:00:00'),
(5, 'Fifth Post', 'This is the fifth post body.', 2, '2022-01-05 14:00:00', '2022-01-05 14:00:00');

INSERT INTO blog_comments (id, post_id, body, author_id, created_at)
VALUES
(1, 1, 'Great post!', 3, '2022-01-02 10:00:00'),
(2, 1, 'Nice article.', 2, '2022-01-02 11:00:00'),
(3, 2, 'Interesting read.', 1, '2022-01-03 12:00:00'),
(4, 2, 'Looking forward to more posts.', 3, '2022-01-03 13:00:00'),
(5, 3, 'Well written.', 2, '2022-01-04 14:00:00'),
(6, 4, 'Keep up the good work!', 1, '2022-01-05 15:00:00'),
(7, 4, 'I enjoyed reading this.', 3, '2022-01-05 16:00:00'),
(8, 4, 'Looking forward to the next one.', 2, '2022-01-05 17:00:00'),
(9, 5, 'This post is amazing!', 1, '2022-01-06 18:00:00'),
(10, 5, 'Can''t wait for more content.', 3, '2022-01-06 19:00:00');

SELECT * FROM blog_posts;
SELECT * FROM blog_comments;

-- Write a query to retrieve the title and body of the five most recent blog posts, along with the number of comments each post has.

SELECT bp.title, bp.body, COUNT(bc.id) FROM blog_posts bp
LEFT JOIN blog_comments bc ON bp.id = bc.post_id
GROUP BY bp.id
ORDER BY bp.created_at DESC LIMIT 5;