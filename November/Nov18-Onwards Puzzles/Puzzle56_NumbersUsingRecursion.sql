USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers
(
    [Number] INT
);

-- populate the table from 1 to 10 using a recursive CTE
WITH
    NumbersCTE
    AS
    (
                    SELECT 1 AS [Number]
        UNION ALL
            SELECT [Number] + 1
            FROM NumbersCTE
            WHERE [Number] < 10
    )
INSERT INTO Numbers
SELECT [Number]
FROM NumbersCTE;

-- Queries
SELECT *
FROM Numbers;
