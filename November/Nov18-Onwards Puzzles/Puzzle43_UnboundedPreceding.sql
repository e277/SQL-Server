USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS UnboundedPreceding;
CREATE TABLE UnboundedPreceding
(
    [Order] INT,
    Customer_ID INT,
    Quantity INT
);
INSERT INTO UnboundedPreceding
VALUES
    (1, 1001, 5);
INSERT INTO UnboundedPreceding
VALUES
    (2, 1001, 8);
INSERT INTO UnboundedPreceding
VALUES
    (3, 1001, 3);
INSERT INTO UnboundedPreceding
VALUES
    (4, 1001, 7);
INSERT INTO UnboundedPreceding
VALUES
    (1, 2002, 4);
INSERT INTO UnboundedPreceding
VALUES
    (2, 2002, 9);

-- Queries
SELECT *
FROM UnboundedPreceding;

-- Determine the minimum quantity for each record between the current row and all previous rows for 
-- each Customer ID
WITH
    CTE_UnboundedPreceding
    AS
    (
        SELECT
            *,
            MIN(Quantity) OVER (PARTITION BY Customer_ID ORDER BY [Order] ROWS UNBOUNDED PRECEDING) AS MinQuantity
        FROM UnboundedPreceding
    )
SELECT
    [Order],
    Customer_ID,
    Quantity,
    MinQuantity
FROM CTE_UnboundedPreceding;
