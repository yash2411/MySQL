-- To see the number of records or row
SELECT COUNT(*) FROM books;

-- To count the value of column 
SELECT COUNT(author_fname) FROM books; -- This will not count NULL if it is present in a column
SELECT COUNT(DISTINCT(author_fname)) FROM books;
SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

-- To fetch records based that one author_lname has how many books
SELECT author_lname, count(*) FROM books GROUP BY author_lname;
SELECT author_lname, COUNT(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written DESC
SELECT title, MAX(pages) AS book_pages FROM books GROUP BY title ORDER BY book_pages DESC LIMIT 0,1;
SELECT author_lname, COUNT(*) AS books_writter, 
MIN(released_year) AS earliest_release, 
MAX(released_year) AS latest_release FROM books GROUP BY author_lname;

-- Subqueries
SELECT title, pages FROM books WHERE pages = (SELECT MAX(PAGES) FROM books);

-- GROUP BY with multiple columns
SELECT author_lname FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT_WS(' ', author_fname, author_lname) AS 'full_name', COUNT(*) AS 'books_written' FROM books GROUP BY full_name ORDER BY books_written DESC

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;
SELECT author_lname, AVG(pages) FROM books GROUP BY author_lname;