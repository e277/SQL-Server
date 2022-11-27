USE BikeStores;

SELECT * FROM sales.orders;

SELECT
	order_status,
	COUNT(order_id) order_count
FROM
	sales.orders
WHERE
	YEAR(order_date) = 2018
GROUP BY
	order_status

-- CASE - simple expression
SELECT
	CASE order_status
		WHEN 1 THEN 'Pending'
		WHEN 2 THEN 'Processing'
		WHEN 3 THEN 'Rejected'
		WHEN 4 THEN 'Completed'
	END AS order_status,
	COUNT(order_id) order_count
FROM
	sales.orders
WHERE
	YEAR(order_date) = 2018
GROUP BY
	order_status;

-- CASE - with aggregate function
SELECT
	SUM(CASE
			WHEN order_status=1 THEN 1 ELSE 0 END
		) AS 'Pending',
	SUM(CASE
			WHEN order_status=2 THEN 1 ELSE 0 END
		) AS 'Processing',
	SUM(CASE
			WHEN order_status=3 THEN 1 ELSE 0 END
		) AS 'Rejected',
	SUM(CASE
			WHEN order_status=4 THEN 1 ELSE 0 END
		) AS 'Completed',
	COUNT(*) AS Total
FROM
	sales.orders
WHERE
	YEAR(order_date)=2018;

-- Search CASE
SELECT
	o.order_id,
	SUM(quantity*list_price) order_value,
	CASE
		WHEN SUM(quantity*list_price) <= 500
			THEN 'Very Low'
		WHEN SUM(quantity*list_price) > 500 AND
			SUM(quantity*list_price) <= 1000
			THEN 'Low'
		WHEN SUM(quantity*list_price) > 1000 AND
			SUM(quantity*list_price) <= 5000
			THEN 'Medium'
		WHEN SUM(quantity*list_price) > 5000 AND
			SUM(quantity*list_price) <= 10000
			THEN 'High'
		WHEN SUM(quantity*list_price) > 10000
			THEN 'Very High'
	END order_priority
FROM
	sales.orders o
	INNER JOIN sales.order_items i
	ON i.order_id = o.order_id
WHERE
	YEAR(order_date) = 2018
GROUP BY
	o.order_id;