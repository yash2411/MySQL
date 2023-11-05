-- Data types in sql

-- CHAR vs VARCHAR

-- CHAR has fixed length, state CHAR(3), only three characters allowed to be store, if there is less than 3 chars it will add whitespaces, CHAR can be use if column requires the fixed size.


-- INT, TINYINT(-128, 128), BIGINT
-- We can use constraints like SIGNED and UNSIGNED
-- INT SIGNED

-- DECIMAL(5, 2) 5 is total number of digits and 2 digits after decimal 

-- To see warnings;
SHOW warnings;
-- FLOAT will truncate some numbers after decimal and DOUBLE will not

-- DATE and TIME
-- DATE will stored in 'yyyy-mm-dd' it will store only date
-- TIME will store only time not date like 'HH:MM::SS'

-- DATETIME will store date and time both
-- 'YYYY-MM-DD HH:MM:SS'

-- CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP OR CURDATE(), CURTIME(), NOW()
SELECT birthdate, DAY(birthdate) FROM people;
SELECT birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT birthdate, MONTHNAME(birthdate) FROM people;
SELECT DATE_FORMAT(birthdate, '%c') FROM people
SELECT DATE_FORMAT(birthdate, '%b: %h') FROM people
SELECT DATEDIFF(CURDATE(), birthdate) FROM people;