SELECT *
FROM production.products;

SELECT *
FROM production.products
WHERE category_id = 1 AND list_price > 400
ORDER BY list_price DESC;

SELECT *
FROM production.products
WHERE category_id = 1 AND list_price > 400 AND brand_id = 1
ORDER BY list_price DESC;

SELECT *
FROM production.products
WHERE brand_id = 1 OR brand_id = 2 AND list_price > 1000
ORDER BY brand_id DESC;

SELECT *
FROM production.products
WHERE (brand_id = 1 OR brand_id = 2) AND list_price > 1000
ORDER BY brand_id;