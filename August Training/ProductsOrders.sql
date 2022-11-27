CREATE DATABASE ProductDB;
USE ProductDB;

-- DROP Tables
DROP TABLE IF EXISTS products_to_orders;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- CREATE Tables
CREATE TABLE customers (
	customer_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
);
CREATE TABLE products (
	product_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	price INT NOT NULL
);
CREATE TABLE orders (
	order_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	customer_id INT NOT NULL,
	order_placed_date DATE NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
CREATE TABLE products_to_orders (
	product_to_order_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY(order_id) REFERENCES orders(order_id),
	FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- INSERT INTO Tables
INSERT INTO customers
	(first_name, last_name, email)
VALUES
	('Jennifer', 'Small', 'jennifer.smith@gmail.com'),
	('Shantel', 'Morgan', 'shantel.morgan@gmail.com'),
	('Chloe', 'Name', 'chloe.name@gmail.com'),
	('Jane', 'Foster', 'jane.foster@gmail.com'),
	('Shay', 'Brown', 'shay.brown@gmail.com');

INSERT INTO products
	(name, price)
VALUES
	('Refrigerator', 120),
	('Desk', 65),
	('Laptop', 115),
	('Knapsack', 30),
	('Window', 95);

INSERT INTO orders
	(customer_id, order_placed_date)
VALUES
	(1, '2022-08-21'),
	(3, '2022-04-09'),
	(4, '2022-05-20'),
	(4, '2022-05-20'),
	(4, '2021-12-31');

INSERT INTO products_to_orders
	(order_id, product_id)
VALUES
	(1, 1),
	(1, 5),
	(3, 3),
	(3, 3),
	(4, 1),
	(5, 1);

-- QUERIES
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM products_to_orders;

-- Relationships - 1-1,1-M,M-1,M-M
-- When you need to establish a many-to-many relationship between 
-- two or more tables, the simplest way is to use a Junction Table. 
-- A Junction table in a database, also referred to as a Bridge table 
-- or Associative Table, bridges the tables together by referencing 
-- the primary keys of each data table just study about  junction table
SELECT
	--*
	c.customer_id, c.first_name, po.order_id, po.product_id, p.name
FROM
	customers c
	INNER JOIN orders o
	ON c.customer_id = o.customer_id
	INNER JOIN products_to_orders po
	ON o.order_id = po.order_id
	INNER JOIN products p
	ON p.product_id = po.product_id;