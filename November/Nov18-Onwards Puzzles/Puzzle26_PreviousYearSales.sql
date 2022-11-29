USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PreYrSales;
CREATE TABLE PreYrSales
(
    Year_k INT NOT NULL,
    Amount INT
);
INSERT INTO PreYrSales
VALUES
    (2018, 352645);
INSERT INTO PreYrSales
VALUES
    (2017, 165565);
INSERT INTO PreYrSales
VALUES
    (2017, 254654);
INSERT INTO PreYrSales
VALUES
    (2016, 159521);
INSERT INTO PreYrSales
VALUES
    (2016, 251696);
INSERT INTO PreYrSales
VALUES
    (2016, 111894);

-- Queries
-- SELECT *
-- FROM PreYrSales;

-- Write an SQL statement that shows the current year’s sales SUM, 
-- along with the previous year’s sales SUM, and 
-- the sales from two years ago SUM.
-- the result should be the year as column name and the sales as the value
WITH
    CTE
    AS
    (
        SELECT Year_k, Amount,
            ROW_NUMBER() OVER (PARTITION BY Year_k ORDER BY Amount DESC) AS RowNum
        FROM PreYrSales
    )
-- find
SELECT
    SUM(CASE WHEN Year_k = 2018 THEN Amount END) AS [2018],
    SUM(CASE WHEN Year_k = 2017 THEN Amount END) AS [2017],
    SUM(CASE WHEN Year_k = 2016 THEN Amount END) AS [2016]
FROM CTE
WHERE RowNum <= 2

