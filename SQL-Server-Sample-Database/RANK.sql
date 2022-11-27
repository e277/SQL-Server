USE BikeStores;

-- RANK(), DENSE_RANK() and ROW_NUMBER()
CREATE TABLE sales.rank_demo (
	v VARCHAR(10)
);

INSERT INTO sales.rank_demo(v)
VALUES('A'),('B'),('B'),('C'),('C'),('D'),('E');

SELECT v FROM sales.rank_demo;

SELECT
	v,
	RANK() OVER (
		ORDER BY v
		) rank_no
FROM
	sales.rank_demo;

-- Using production.products
SELECT
	product_id,
	product_name,
	list_price,
	RANK() OVER (
		ORDER BY list_price DESC
	) price_rank
FROM
	production.products;


SELECT * FROM (
	SELECT
		product_id,
		product_name,
		brand_id,
		list_price,
		RANK() OVER (
			PARTITION BY brand_id
			ORDER BY list_price DESC
		) price_rank
	FROM
		production.products
) t
WHERE price_rank <= 3;