USE BikeStores;

CREATE TABLE sales.dense_rank_demo (
	v VARCHAR(10)
);
	
INSERT INTO sales.dense_rank_demo(v)
VALUES('A'),('B'),('B'),('C'),('C'),('D'),('E');
	
SELECT * FROM sales.dense_rank_demo;

-- Query
SELECT
	v,
	DENSE_RANK() OVER (
		ORDER BY v
	) my_dense_rank,
	RANK() OVER (
		ORDER BY v
	) my_rank
FROM
	sales.dense_rank_demo;
