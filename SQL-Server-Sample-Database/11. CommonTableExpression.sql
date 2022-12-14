USE BikeStores;

WITH
    cte_sales_amounts (staff, sales, year)
    AS
    (
        SELECT
            CONCAT(first_name, ' ', last_name),
            SUM(quantity * list_price * (1 - discount)),
            YEAR(order_date)
        FROM
            sales.orders o
            INNER JOIN sales.order_items i
            ON i.order_id = o.order_id
            INNER JOIN sales.staffs s
            ON s.staff_id = o.staff_id
        GROUP BY
		CONCAT(first_name, ' ', last_name),
		year(order_date)
    )

SELECT staff, sales
FROM cte_sales_amounts
WHERE year = 2018;

-- Recursive CTE