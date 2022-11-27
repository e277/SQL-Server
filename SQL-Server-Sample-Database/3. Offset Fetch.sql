SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name;

SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name
offset 10 ROWS;

SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name
offset 10 ROWS
FETCH NEXT 10 ROWS only;

SELECT product_name, list_price
FROM production.products
ORDER BY list_price DESC, product_name
offset 0 ROWS
FETCH NEXT 10 ROWS only;