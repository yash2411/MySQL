-- To find the data with specific column
SELECT * FROM cats where age = 4

-- aliases

SELECT cat_id as id, name FROM cats;

-- Update existing records

UPDATE cats SET age = 13 WHERE cat_id = 5

-- Delete records from table