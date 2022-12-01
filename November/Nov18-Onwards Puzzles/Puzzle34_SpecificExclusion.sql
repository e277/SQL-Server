USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Exclusion;
CREATE TABLE Exclusion
(
    Order_ID VARCHAR(25),
    Customer_ID INT,
    Amount VARCHAR(25)
);
INSERT INTO Exclusion
VALUES
    ('Ord143933', 1001, '$25');
INSERT INTO Exclusion
VALUES
    ('Ord789765', 1001, '$50');
INSERT INTO Exclusion
VALUES
    ('Ord345434', 2002, '$65');
INSERT INTO Exclusion
VALUES
    ('Ord785633', 3003, '$50');

-- Queries
SELECT *
FROM Exclusion;

-- Write an SQL statement that returns all rows except where the Customer ID is 1001 and the Amount is 
-- $50
SELECT *
FROM Exclusion
WHERE Customer_ID <> 1001 OR Amount <> '$50';