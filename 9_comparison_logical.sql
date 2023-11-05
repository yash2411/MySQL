-- Not Equal
SELECT * FROM books WHERE author_lname != 'Gaiman';

-- Not Like
SELECT * FROM books WHERE author_lname NOT LIKE '%c%';

-- Comparison Operator
SELECT * FROM books WHERE released_year > 2005;
SELECT * FROM books WHERE released_year < 2005;
SELECT * FROM books WHERE released_year <= 2005;
SELECT * FROM books WHERE pages <= 301 && pages >=182;
SELECT * FROM books WHERE pages <= 301 && pages >=182 && author_lname = 'Lahiri';
SELECT * FROM books WHERE pages <= 301 && pages >=182 AND author_lname = 'Lahiri';
SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2014 -- 2004 and 2014 are inclusive
SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2014 -- 2004 and 2014 are inclusive
SELECT * FROM people WHERE birthdate < CAST('2005-05-12' AS DATE);


-- IN operator
SELECT * FROM books WHERE author_lname IN ('Gaiman', 'Lahiri', 'Eggers');
SELECT * FROM books WHERE author_lname NOT IN ('Gaiman', 'Lahiri', 'Eggers');
SELECT * FROM books WHERE released_year % 2 = 0;
SELECT title, stock_quantity, 
CASE
	WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
	WHEN stock_quantity BETWEEN 51 AND 100 THEN '*'
    ELSE '***'
END AS 'stars'
FROM books;

SELECT * FROM books WHERE author_lname IS NULL;