SELECT *
FROM production.products;

SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE category_id = 1
ORDER BY list_price DESC, product_name;

SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE category_id = 1 AND model_year = 2018
ORDER BY list_price DESC;

SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE list_price > 300 AND model_year = 2018
ORDER BY list_price DESC;

SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE list_price > 3000 OR model_year = 2018
ORDER BY list_price DESC;

--BETWEEN
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE list_price BETWEEN 1899 AND 1999.99
ORDER BY list_price DESC;

--IN
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE list_price IN (299.99, 466.99, 489.99)
ORDER BY list_price DESC;

--LIKE
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products
WHERE product_name LIKE '%Cruiser%'
ORDER BY list_price;