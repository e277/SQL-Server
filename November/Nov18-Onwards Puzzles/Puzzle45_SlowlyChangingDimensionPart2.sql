USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS ChangingDimension2;
CREATE TABLE ChangingDimension2
(
    Customer_ID INT,
    [Start_Date] VARCHAR(25),
    End_Date VARCHAR(25),
    Amount VARCHAR(25)
);
INSERT INTO ChangingDimension2
VALUES
    (1001, '10/11/2021', '10/31/9999', '$54.32');
INSERT INTO ChangingDimension2
VALUES
    (1001, '10/10/2021', '10/10/2021', '$17.65');
INSERT INTO ChangingDimension2
VALUES
    (1001, '9/18/2021', '10/12/2021', '$65.56');
INSERT INTO ChangingDimension2
VALUES
    (2002, '9/12/2021', '9/17/2021', '$56.23');
INSERT INTO ChangingDimension2
VALUES
    (2002, '9/1/2021', '9/17/2021', '$42.12');
INSERT INTO ChangingDimension2
VALUES
    (2002, '8/15/2021', '8/31/2021', '$16.32');

-- Queries
SELECT *
FROM ChangingDimension2;

-- print the last record of each customer id, start date, end date, and amount
WITH
    CTE
    AS
    (
        SELECT Customer_ID,
            [Start_Date],
            End_Date,
            Amount,
            -- using ROW_NUMBER() to get the last record
            ROW_NUMBER() OVER (PARTITION BY Customer_ID ORDER BY [Start_Date] DESC) AS [RowNum]
        FROM ChangingDimension2
    )
SELECT *
FROM CTE
WHERE [RowNum] = 1;