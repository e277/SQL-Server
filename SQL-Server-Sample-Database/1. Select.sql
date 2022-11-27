SELECT *
FROM sales.customers;

SELECT first_name, last_name, email
FROM sales.staffs;

SELECT customer_id, first_name, last_name
FROM sales.customers;

SELECT first_name, last_name, email
FROM sales.customers
WHERE state='CA';

SELECT first_name, last_name, email
FROM sales.customers
WHERE state='CA'
ORDER BY last_name;

SELECT city, COUNT(*) AS customer_count
FROM sales.customers
WHERE state='CA'
GROUP BY city
ORDER BY city;

SELECT city, COUNT(*) AS customer_count
FROM sales.customers
WHERE state='CA'
GROUP BY city
HAVING COUNT(*) > 10
ORDER BY city;
