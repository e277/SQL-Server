USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS DeGroup;
CREATE TABLE DeGroup
(
    Product VARCHAR(25),
    Quantity INT
);
INSERT INTO DeGroup
VALUES('Pencil', 3);
INSERT INTO DeGroup
VALUES('Eraser', 4);
INSERT INTO DeGroup
VALUES('Notebook', 2);

--Queries
SELECT *
FROM DeGroup;

-- Soln 1
SELECT Product, 1 AS Quantity
FROM DeGroup
CROSS APPLY
(
                        SELECT 1 AS RowNum
    UNION ALL
        SELECT 2 AS RowNum
    UNION ALL
        SELECT 3 AS RowNum
    UNION ALL
        SELECT 4 AS RowNum
    UNION ALL
        SELECT 5 AS RowNum
) AS RowNums
WHERE RowNum <= Quantity

