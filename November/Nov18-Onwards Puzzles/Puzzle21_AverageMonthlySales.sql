USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS AvgMonthlySales;
CREATE TABLE AvgMonthlySales
(
    Order_ID VARCHAR(25),
    Customer_ID INT,
    Order_Date VARCHAR(25),
    Amount INT,
    State VARCHAR(25)
);
INSERT INTO AvgMonthlySales
VALUES
    ('Ord145332', 1001, '1/1/2018', 100, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord657895', 1001, '1/1/2018', 150, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord887612', 1001, '1/1/2018', 75, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord654374', 1001, '2/1/2018', 100, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord345362', 1001, '3/1/2018', 100, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord912376', 2002, '2/1/2018', 75, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord543219', 2002, '2/1/2018', 150, 'TX');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord156357', 3003, '1/1/2018', 100, 'IA');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord956541', 3003, '2/1/2018', 100, 'IA');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord856993', 3003, '3/1/2018', 100, 'IA');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord864573', 4004, '4/1/2018', 100, 'IA');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord654525', 4004, '5/1/2018', 50, 'IA');
INSERT INTO AvgMonthlySales
VALUES
    ('Ord987654', 4004, '5/1/2018', 100, 'IA');

-- Queries
SELECT *
FROM AvgMonthlySales;

-- Write an SQL statement that returns a list of states where customers have an average monthly sales
-- value that is consistently greater than 100 
-- (i.e. the average monthly sales value for each month is greater than 100 for each State).
WITH
    MonthlySales
    AS
    (
        SELECT State,
            DATEPART(MONTH, Order_Date) AS Month,
            AVG(Amount) AS Average
        FROM AvgMonthlySales
        GROUP BY State, DATEPART(MONTH, Order_Date)
    )
SELECT State
FROM MonthlySales
GROUP BY State
HAVING AVG(Average) > 100;

