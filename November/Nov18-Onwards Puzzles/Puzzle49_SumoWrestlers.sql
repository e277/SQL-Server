USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Wrestlers;
CREATE TABLE Wrestlers
(
    [Order] INT,
    [Name] VARCHAR(25),
    [Weight] INT
);
INSERT INTO Wrestlers
VALUES
    (1, 'Haruto', 611);
INSERT INTO Wrestlers
VALUES
    (2, 'Minato', 533);
INSERT INTO Wrestlers
VALUES
    (3, 'Haruki', 623);
INSERT INTO Wrestlers
VALUES
    (4, 'Sota', 569);
INSERT INTO Wrestlers
VALUES
    (5, 'Aoto', 610);
INSERT INTO Wrestlers
VALUES
    (6, 'Hinata', 525);

-- Queries
SELECT *
FROM Wrestlers;

-- Soln 1: Using a CTE
WITH
    CTE_Wrestlers
    AS
    (
        SELECT
            [Order],
            [Name],
            [Weight],
            SUM([Weight]) OVER (ORDER BY [Order] ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal1,
            SUM([Weight]) OVER (ORDER BY [Order] ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RunningTotal2,
            CASE WHEN SUM([Weight]) OVER (ORDER BY [Order]) <= 2000 THEN 1 ELSE 0 END AS flag

        FROM Wrestlers
    )
SELECT TOP 1
    [Name]
FROM CTE_Wrestlers
WHERE RunningTotal1 <= 2000 AND flag = 1
ORDER BY [Order] DESC;