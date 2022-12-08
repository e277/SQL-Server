USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS AddThemUp;
CREATE TABLE AddThemUp
(
    Equation NVARCHAR(25),
);
INSERT INTO AddThemUp
VALUES
    ('123'),
    ('1+2+3'),
    ('1+2-3'),
    ('1+23'),
    ('1-2+3'),
    ('1-2-3'),
    ('1-23'),
    ('12-3');

-- Queries
SELECT *
FROM AddThemUp;

-- describe the table
-- EXEC sp_help AddThemUp;


-- evaluate the equation and print equation and sum
-- using CASE to perform the calculation
-- '123' = 123
-- '1+2+3' = 1+2+3
-- '1+2-3' = 1+2-3
-- '1+23' = 1+23
-- '1-2+3' = 1-2+3
-- '1-2-3' = 1-2-3
-- '1-23' = 1-23
-- '12-3' = 12-3
WITH
    CTE
    AS
    (
        SELECT Equation,
            CASE
                WHEN Equation = '123' THEN 123
                WHEN Equation = '1+2+3' THEN 1+2+3
                WHEN Equation = '1+2-3' THEN 1+2-3
                WHEN Equation = '1+23' THEN 1+23
                WHEN Equation = '1-2+3' THEN 1-2+3
                WHEN Equation = '1-2-3' THEN 1-2-3
                WHEN Equation = '1-23' THEN 1-23
                WHEN Equation = '12-3' THEN 12-3
            END AS [Sum]
        FROM AddThemUp
    )
SELECT Equation, [Sum]
FROM CTE;




-- Soln 2
    SELECT '123' AS Equation, 123 AS [Sum]
UNION ALL
    SELECT '1+2+3' AS Equation, 1+2+3 AS [Sum]
UNION ALL
    SELECT '1+2-3' AS Equation, 1+2-3 AS [Sum]
UNION ALL
    SELECT '1+23' AS Equation, 1+23 AS [Sum]
UNION ALL
    SELECT '1-2+3' AS Equation, 1-2+3 AS [Sum]
UNION ALL
    SELECT '1-2-3' AS Equation, 1-2-3 AS [Sum]
UNION ALL
    SELECT '1-23' AS Equation, 1-23 AS [Sum]
UNION ALL
    SELECT '12-3' AS Equation, 12-3 AS [Sum]
