CREATE DATABASE instagram;
USE instagram;
CREATE TABLE USERS(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255),
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN_KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos (image_url, user_id) VALUES
('/jasjdfh', 1),
('/asahdf', 2),
('/jklkjs', 3)

CREATE TABLE comments(
	id INT AUTO_INCREMENT PRIMARY KEY,
    comments VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
)

INSERT INTO comments (comments, user_id, photo_id) VALUES
('Meow!', 1, 2),
('Amazing Shot!', 3, 2),
('I <3 This', 2, 1);

CREATE TABLE likes(
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photos(id),
PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(3, 3)
);

CREATE TABLE follows (
follower_id INT NOT NULL,
followee_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(follower_id) REFERENCES users(id),
FOREIGN KEY(followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES
(1, 2),
(1, 3),
(3, 1),
(2, 3);

CREATE TABLE tags(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
photo_id INT NOT NULL,
tag_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(tag_id) REFERENCES tags(id),
PRIMARY KEY(photo_id, tag_id)
)

CREATE TABLE tags(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
photo_id INT NOT NULL,
tag_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(tag_id) REFERENCES tags(id),
PRIMARY KEY(photo_id, tag_id)
)

SELECT * FROM users ORDER BY created_at ASC	LIMIT 5

SELECT DAYNAME(created_at) AS day, COUNT(*) AS new_users FROM users GROUP BY day ORDER BY new_users DESC LIMIT 1;

SELECT username FROM users
LEFT JOIN photos ON photos.user_id = users.id
WHERE photos.id IS NULL;

SELECT photos.id, photos.image_url, COUNT(likes.photo_id) AS COUNT FROM photos
JOIN likes ON photos.id = likes.photo_id
GROUP BY photos.id ORDER BY count DESC LIMIT 1 ;

SELECT photos.id, photos.image_url, username, COUNT(likes.photo_id) AS COUNT FROM photos
JOIN likes ON photos.id = likes.photo_id
JOIN users ON photos.user_id = users.id
GROUP BY photos.id ORDER BY count DESC LIMIT 1 ;

SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users);

SELECT tag_id, tag_name, COUNT(*) AS hashtags FROM photo_tags 
JOIN tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id ORDER BY hashtags DESC;