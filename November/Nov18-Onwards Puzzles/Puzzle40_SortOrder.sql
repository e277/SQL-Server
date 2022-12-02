USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS SortOrder;
CREATE TABLE SortOrder
(
    City VARCHAR(50)
);
INSERT INTO SortOrder
VALUES
    ('Atlanta'),
    ('Baltimore'),
    ('Chicago'),
    ('Denver');

-- Queries
SELECT *
FROM SortOrder;


-- sort the cities in alphabetical order by the even @@ROWCOUNT, then the odd @@ROWCOUNT
WITH
    SortOrder_CTE
    AS
    (
        SELECT City,
            ROW_NUMBER() OVER (ORDER BY City) AS RowNumber
        FROM SortOrder
    ),
    even
    AS
    (
        SELECT City
        FROM SortOrder_CTE
        WHERE RowNumber % 2 = 0
    ),
    odd
    AS
    (
        SELECT City
        FROM SortOrder_CTE
        WHERE RowNumber % 2 = 1
    )
-- select even first, then odd
    SELECT City
    FROM even
UNION ALL
    SELECT City
    FROM odd;
