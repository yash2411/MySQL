-- To create the table
CREATE TABLE dogs (
	name varchar(50),
    breed varchar(50),
    age int
);

-- To show the tables of current database
show tables;
show columns from dogs;
desc dogs;

-- To delete the tables

drop table cats;

--comments in sql

-- To list all data

-- insert into table

insert into dogs(name, breed, age) values("O", "German", 5)

-- To show records in tables

select * from dogs

-- To insert multiple values

insert into cats (name, age) values ("Meatball", 5), ("Turkey", 1), ("Potato Face", 15);


-- To make column require

CREATE TABLE cats (name varchar(20) NOT NULL);

-- To define default values for columns

CREATE TABLE cats3 (name varchar(20) NOT NULL DEFAULT 'Mystery')

-- To define unique column(PRIMARY KEY)

CREATE TABLE uniques_cats(cat_id INT NOT NULL PRIMARY KEY, name VARCHAR(20), age INT)
CREATE TABLE uniques_cats(cat_id INT NOT NULL, name VARCHAR(20), age INT, PRIMARY KEY(cat_id))

-- To auto_increment the primary key

CREATE TABLE uniques_cats(cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(20), age INT)

-- CONSTRAINT IN TABLE
CREATE TABLE users(name VARCHAR(20) NOT NULL, age INT CHECK(age>0));
CREATE TABLE contacts(name VARCHAR(20) NOT NULL, phone VARCHAR(15) UNIQUE);
CREATE TABLE users (name VARCHAR(20) NOT NULL, age INT, CONSTRAINT age_over_18 CHECK(age >18));
CREATE TABLE companies (name VARCHAR(20) NOT NULL, address VARCHAR(50) NOT NULL, CONSTRAINT name_address UNIQUE(name, address))
CREATE TABLE house (sell_price INT NOT NULL, purchase_price INT NOT NULL, CONSTRAINT price CHECK(sell_price > purchase_price));

-- ALTER TABLE  add column
ALTER TABLE companies ADD COLUMN phone VARCHAR(15);
ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- drop column from table
ALTER TABLE companies DROP COLUMN phone;

-- rename column or table
RENAME TABLE companies TO suppliers;
ALTER TABLE suppliers RENAME TO companies
ALTER TABLE suppliers RENAME COLUMN employee_count TO supplier_count;

-- change column of table 
ALTER TABLE suppliers MODIFY supplier_count BIGINT DEFAULT 2;
ALTER TABLE suppliers CHANGE COLUMN supplier_count count BIGINT DEFAULT 2;

-- constraints on alter table
ALTER TABLE suppliers ADD CONSTRAINT positive_pprice CHECK(supplier_count > 0);
ALTER TABLE suppliers DROP CONSTRAINT positive_pprice