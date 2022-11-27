SELECT TOP 10
    product_name, list_price
FROM production.products
ORDER BY list_price DESC;

SELECT TOP 1 percent
    product_name, list_price
FROM production.products
ORDER BY list_price DESC;

SELECT TOP 3 with ties
    product_name, list_price
FROM production.products
ORDER BY list_price DESC;
