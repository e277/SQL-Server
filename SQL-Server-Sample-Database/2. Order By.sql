SELECT first_name, last_name, email
FROM sales.customers
ORDER BY email;

SELECT first_name, last_name, email
FROM sales.customers
ORDER BY email DESC;

SELECT city, first_name, last_name
FROM sales.customers
ORDER BY city, first_name;

SELECT city, first_name, last_name
FROM sales.customers
ORDER BY city DESC, first_name ASC;

SELECT city, first_name, last_name
FROM sales.customers
ORDER BY state ASC;

SELECT first_name, last_name, city
FROM sales.customers
ORDER BY LEN(city) DESC;
