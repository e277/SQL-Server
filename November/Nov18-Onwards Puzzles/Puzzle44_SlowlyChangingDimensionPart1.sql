USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS ChangingDimension1;
CREATE TABLE ChangingDimension1
(
    Customer_ID INT,
    [Balance Date] VARCHAR(25),
    Amount VARCHAR(25)
);
INSERT INTO ChangingDimension1
VALUES
    (1001, '10/11/2021', '$54.32');
INSERT INTO ChangingDimension1
VALUES
    (1001, '10/10/2021', '$17.65');
INSERT INTO ChangingDimension1
VALUES
    (1001, '09/18/2021', '$65.56');
INSERT INTO ChangingDimension1
VALUES
    (1001, '09/12/2021', '$56.23');
INSERT INTO ChangingDimension1
VALUES
    (1001, '09/01/2021', '$42.12');
INSERT INTO ChangingDimension1
VALUES
    (2002, '10/15/2021', '$46.52');
INSERT INTO ChangingDimension1
VALUES
    (2002, '10/13/2021', '$7.65');
INSERT INTO ChangingDimension1
VALUES
    (2002, '09/15/2021', '$75.12');
INSERT INTO ChangingDimension1
VALUES
    (2002, '09/10/2021', '$47.34');
INSERT INTO ChangingDimension1
VALUES
    (2002, '09/02/2021', '$11.11');

-- Queries
SELECT *
FROM ChangingDimension1;

-- create a new dimension record for each customer StartDate and EndDate using the Balance Date
WITH
    CTE_ChangingDimension1
    AS
    (
        SELECT
            Customer_ID
            , [Balance Date] AS StartDate
            , LAG([Balance Date], 1) OVER (PARTITION BY Customer_ID ORDER BY Customer_ID) AS EndDate
            , Amount
        FROM ChangingDimension1
    )
SELECT
    Customer_ID
    , StartDate
    , CASE WHEN EndDate IS NULL THEN '12/31/9999' 
        ELSE CONVERT(VARCHAR(25), DATEADD(DAY, -1, EndDate), 101) END AS EndDate
    , Amount
FROM CTE_ChangingDimension1
ORDER BY Customer_ID, StartDate DESC;

