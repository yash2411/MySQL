CREATE DATABASE tv_db;
USE tv_db;
CREATE TABLE reviewers (id INT PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL);
CREATE TABLE series (id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(100), release_year YEAR, genre VARCHAR(100));
CREATE TABLE reviews (id INT PRIMARY KEY AUTO_INCREMENT, rating DECIMAL(2,1), series_id INT, reviewer_id INT, FOREIGN KEY (series_id) REFERENCES series(id), FOREIGN KEY (reviewer_id) REFERENCES reviewers(id))

SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id;

SELECT title, ROUND(AVG(rating),2) AS average FROM series
JOIN reviews ON series.id = reviews.series_id GROUP BY title ORDER BY average;

SELECT first_name, last_name, rating FROM reviewers
JOIN reviews ON reviewers.id = reviews.reviewer_id;

SELECT title AS unreviewed_series FROM series
LEFT JOIN reviews ON reviews.series_id = series.id WHERE rating IS NULL;

SELECT genre, AVG(rating) FROM series
JOIN reviews ON series.id = reviews.series_id GROUP BY genre;

SELECT first_name, last_name, COUNT(rating), IFNULL(MIN(rating), 0),  IFNULL(MAX(rating), 0), IFNULL(AVG(rating), 0),
CASE
	WHEN count(rating) > 0 THEN 'ACTIVE'
    ELSE 'INACTIVE'
END AS status
 FROM reviewers
LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id GROUP BY first_name, last_name

SELECT first_name, last_name, COUNT(rating), IFNULL(MIN(rating), 0),  IFNULL(MAX(rating), 0), IFNULL(AVG(rating), 0),
IF(COUNT(rating)>0, 'ACTIVE', 'INACTIVE')
 FROM reviewers
LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id GROUP BY first_name, last_name