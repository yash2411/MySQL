CREATE TABLE customers(id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50));
CREATE TABLE orders(id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT, 
FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE);


-- CROSS JOIN (Cartesian Join) (Every combination of customer with order like customer 1 with order1, order2, customer2 with order1, order2 and so on)

-- INNER JOIN
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON customers.id = orders.customer_id;

-- OR 

SELECT first_name, last_name, order_date, amount FROM orders
JOIN customers ON customers.id = orders.customer_id;

SELECT first_name, last_name, SUM(amount) AS total FROM customers 
JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name ORDER BY total DESC;


-- LEFT JOIN It will show all customers , if customers have any order or not
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

-- RIGHT JOIN no matters if customer exist or not it will show all orders 
SELECT * FROM customers
RIGHT JOIN orders ON orders.customer_id = customers.id