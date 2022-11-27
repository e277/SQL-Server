SELECT *
FROM sales.customers;

SELECT DISTINCT city
FROM sales.customers
ORDER BY city;

SELECT DISTINCT city, state
FROM sales.customers
ORDER BY city, state;

SELECT DISTINCT city, state
FROM sales.customers;

SELECT DISTINCT phone
FROM sales.customers
ORDER BY phone;

SELECT DISTINCT city, state, zip_code
FROM sales.customers
GROUP BY city, state, zip_code
ORDER BY city, state, zip_code;

--same as above query
SELECT DISTINCT city, state, zip_code
FROM sales.customers;