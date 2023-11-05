CREATE VIEW full_reviews AS SELECT title, released_year, genre, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id

-- above one will create virtual table named full_reviews, we can use this make our query shorter, they are not tables they can act like tables

show tables;
SELECT * FROM full_reviews;
SELECT * FROM full_reviews WHERE genre = 'Animation';

-- can't update the views when it is using join, aggregate functions group by

CREATE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year;	-- can update this

INSERT INTO ordered_series (title, released_year, genre) VALUES ('The Great', 2020, 'Comedy')
DELETE FROM ordered_series WHERE title = 'The Great';

-- To replace and create
CREATE OR REPLACE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year;

-- HAVING clause this will filte the group by for below example it will not include those title whose record of rating is 1
-- example:
-- hello 8
-- mm 9
-- mm 9
-- for this hello have only one rating so it will not include that title
SELECT title, AVG(rating) FROM full_reviews GROUP BY title HAVING count(rating) > 1

-- ROLLUP
SELECT title, AVG(rating) FROM full_reviews GROUP BY title WITH ROLLUP
-- if we specify the average of rating the it will add aditional row with all average of rating of group by
-- if we specify the count of rating the it will add aditional row with all count of rating of group by
SELECT title, AVG(rating) FROM full_reviews GROUP BY title, genre WITH ROLLUP