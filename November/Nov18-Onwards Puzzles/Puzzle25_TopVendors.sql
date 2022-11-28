USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS TopVendors;
CREATE TABLE TopVendors
(
    Order_ID VARCHAR(25),
    Customer_ID INT,
    Order_Count INT,
    Vendor VARCHAR(25)
);
INSERT INTO TopVendors
VALUES
    ('Ord195342', 1001, 12, 'Direct Parts');
INSERT INTO TopVendors
VALUES
    ('Ord245532', 1001, 54, 'Direct Parts');
INSERT INTO TopVendors
VALUES
    ('Ord344394', 1001, 32, 'ACME');
INSERT INTO TopVendors
VALUES
    ('Ord442423', 2002, 7, 'ACME');
INSERT INTO TopVendors
VALUES
    ('Ord524232', 2002, 16, 'ACME');
INSERT INTO TopVendors
VALUES
    ('Ord645363', 2002, 5, 'Direct Parts');

-- Queries
SELECT *
FROM TopVendors;

-- Write an SQL statement that returns the vendor from which each customer has placed the most orders.
WITH
    CTE
    AS
    (
        SELECT Customer_ID, Vendor, Order_Count,
            ROW_NUMBER() OVER (PARTITION BY Customer_ID ORDER BY Order_Count DESC) AS RowNum
        FROM TopVendors
    )
SELECT Customer_ID, Vendor
FROM CTE
WHERE RowNum = 1
ORDER BY Customer_ID;


 
