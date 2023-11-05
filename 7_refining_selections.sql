-- To eliminate duplicate results
SELECT DISTINCT author_lname from books;
SELECT DISTINCT CONCAT_WS(' ', author_fname, author_lname) from books;
SELECT DISTINCT author_fname, released_year from books; -- It will eliminate if both column have duplicate values

-- To sort the results in order
SELECT author_lname FROM books ORDER BY author_lname;
SELECT * FROM books ORDER BY author_lname DESC;
SELECT author_fname, author_lname FROM books ORDER BY 2 DESC; -- Here it will sort the records with author_lname as 2 is referring to second selecting columns

-- To sort the records with two column
SELECT author_fname, author_lname, released_year FROM books ORDER BY author_lname, released_year;
-- Ex: if there are 3 same records of author_lname and released_year different it will first sort author_lname, then it will sort release years

-- Michael	Chabon	2000
-- Don	DeLillo	1985
-- Dave	Eggers	2001
-- Dave	Eggers	2012
-- Dave	Eggers	2013

SELECT CONCAT(author_fname, ' ', author_lname) AS 'author' FROM books ORDER BY author -- This will combine the author_fname and author_lname and then it will sort

-- To limit the records
SELECT * FROM books ORDER BY released_year DESC LIMIT 5
SELECT * FROM books ORDER BY released_year DESC LIMIT 0, 5


-- To get the records with contain similar string
SELECT * FROM books WHERE author_fname LIKE '%da%' -- It will return the records whose author_fname has any characters before and after but should include da

SELECT * FROM books WHERE author_fname LIKE  '_a__' -- This will return the records whose author_fname has 4 characters and second character should be a

-- Escape characte should be present in title
SELECT * FROM books WHERE title LIKE '%\%%'