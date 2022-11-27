SELECT *
FROM sales.customers;

--Will return an empty set, Where evaluates to TRUE making the statement unknown
SELECT customer_id, first_name, last_name, phone
FROM sales.customers
WHERE phone = NULL
ORDER BY first_name, last_name;

SELECT customer_id, first_name, last_name, phone
FROM sales.customers
WHERE phone IS NULL
ORDER BY first_name, last_name;

SELECT customer_id, first_name, last_name, phone
FROM sales.customers
WHERE phone IS NOT NULL
ORDER BY first_name, last_name;