USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS ConSales;
CREATE TABLE ConSales
(
    Sales_ID INT,
    [Year] INT
);
INSERT INTO ConSales
VALUES
    (1001, 2018);
INSERT INTO ConSales
VALUES
    (1001, 2019);
INSERT INTO ConSales
VALUES
    (1001, 2020);
INSERT INTO ConSales
VALUES
    (2002, 2020);
INSERT INTO ConSales
VALUES
    (2002, 2021);
INSERT INTO ConSales
VALUES
    (3003, 2018);
INSERT INTO ConSales
VALUES
    (3003, 2020);
INSERT INTO ConSales
VALUES
    (3003, 2021);
INSERT INTO ConSales
VALUES
    (4004, 2019);
INSERT INTO ConSales
VALUES
    (4004, 2020);
INSERT INTO ConSales
VALUES
    (4004, 2021);

-- Queries
SELECT *
FROM ConSales;

-- write an SQL statement to determine customers that had a sale in the
-- current year, plus the previous two consecutive years.
WITH
    ConsecutiveSales
    AS
    (
        SELECT Sales_ID, [Year]
    , CASE WHEN [Year] = 2021
                AND LAG([Year], 1) OVER (PARTITION BY Sales_ID ORDER BY [Year]) = 2020
                AND LAG([Year], 2) OVER (PARTITION BY Sales_ID ORDER BY [Year]) = 2019
        THEN 'Yes'
        ELSE 'No'
        END AS [Consecutive Sales]
        FROM ConSales
    )
-- select the sales ID where the consecutive sales is 'Yes'
SELECT Sales_ID
FROM ConsecutiveSales
WHERE [Consecutive Sales] = 'Yes'