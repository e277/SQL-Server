USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Salesman;
CREATE TABLE Salesman
(
    Departure_City VARCHAR(25),
    Arrival_City VARCHAR(25),
    Cost INT
);
INSERT INTO Salesman
VALUES
    ('Austin', 'Dallas', 100);
INSERT INTO Salesman
VALUES
    ('Dallas', 'Memphis', 200);
INSERT INTO Salesman
VALUES
    ('Memphis', 'Des Moines', 300);
INSERT INTO Salesman
VALUES
    ('Dallas', 'Des Moines', 400);

-- -- Queries
SELECT *
FROM Salesman;


-- Write an SQL query to find the shortest path from Austin to Des Moines.
-- Write an SQL query to find the longest path from Austin to Des Moines.
-- Find the cost for each path
WITH
    CTE_Salesman
    AS
    (
                    SELECT
                Departure_City,
                Arrival_City,
                Cost
            FROM Salesman
        UNION ALL
            SELECT
                S1.Departure_City,
                S2.Arrival_City,
                S1.Cost + S2.Cost
            FROM Salesman AS S1
                INNER JOIN CTE_Salesman AS S2
                ON S1.Arrival_City = S2.Departure_City
    )
-- SELECT * FROM CTE_Salesman; -- Print all routes
SELECT
    Departure_City,
    Arrival_City,
    min(cost) as [Least Expensive Route],
    max(cost) as [Most Expensive Route]
FROM CTE_Salesman
WHERE Departure_City = 'Austin'
    AND Arrival_City = 'Des Moines'
GROUP BY Departure_City, Arrival_City;
