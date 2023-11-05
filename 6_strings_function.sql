-- To execute the sql file
source file.sql

-- Most of string functions works as case sensitive

-- To concat two columns
SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS full_name FROM books;

-- To concat with separator
SELECT CONCAT_WS('-', title, author_fname, author_lname) from books;

-- To make substring
SELECT SUBSTRING(author_fname, 1, 3) from books;
-- OR
SELECT SUBSTR(author_fname, 1, 3) from books;

-- To replace the column data
SELECT REPLACE(title, ' ', '-') AS title FROM books;

-- To reverse the column data
SELECT REVERSE(title) AS title FROM books;

-- To get length of column data
SELECT CHAR_LENGTH(title) FROM books; -- It return the number of characters
-- OR 
SELECT LENGTH(title) FROM books; -- It return the number of bytes, It will work differently for different languages like chinese

-- To convert into lower and upper case
SELECT LOWER(title) FROM books;
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

-- To insert substring to the string 
SELECT INSERT(title, 4,1, 'There') FROM books; -- insert at 4 replace 1 chars
SELECT INSERT(title, 4,0, 'There') FROM books; -- insert at 4 replace 0 chars

-- To get left or right most chars
SELECT LEFT(title, 3) FROM books;
SELECT RIGHT(title, 3) FROM books;

-- To remove whitespaces
SELECT TRIM(title) FROM books;