USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Dups;
CREATE TABLE Dups
(
    IntegerValue INT
);
INSERT INTO Dups
VALUES
    (1),
    (1),
    (2),
    (3),
    (3),
    (4);

-- Queries
SELECT *
FROM Dups;

-- Write an SQL statement that deletes all duplicate rows from the Dups table
WITH
    CTE
    AS
    (
        SELECT IntegerValue,
            ROW_NUMBER() OVER (PARTITION BY IntegerValue ORDER BY IntegerValue) AS RowNum
        FROM Dups
    )
DELETE FROM CTE
WHERE RowNum > 1;

SELECT *
FROM Dups;
