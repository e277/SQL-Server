USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    Order_ID VARCHAR(25),
    Product VARCHAR(25),
    Delivery_Date_Days INT
);
INSERT INTO Orders
VALUES
    ('Ord893456', 'Widget', 7);
INSERT INTO Orders
VALUES
    ('Ord923654', 'Gizmo', 3);
INSERT INTO Orders
VALUES
    ('Ord187239', 'Doodad', 9);

DROP TABLE IF EXISTS Manufacturiing_Time;
CREATE TABLE Manufacturiing_Time
(
    Part VARCHAR(25),
    Product VARCHAR(25),
    Days_to_Manufacture INT
);
INSERT INTO Manufacturiing_Time
VALUES
    ('AA-111', 'Widget', 7);
INSERT INTO Manufacturiing_Time
VALUES
    ('BB-222', 'Widget', 2);
INSERT INTO Manufacturiing_Time
VALUES
    ('CC-333', 'Widget', 3);
INSERT INTO Manufacturiing_Time
VALUES
    ('DD-444', 'Widget', 1);
INSERT INTO Manufacturiing_Time
VALUES
    ('AA-111', 'Gizmo', 7);
INSERT INTO Manufacturiing_Time
VALUES
    ('BB-222', 'Gizmo', 2);
INSERT INTO Manufacturiing_Time
VALUES
    ('AA-111', 'Doodad', 7);
INSERT INTO Manufacturiing_Time
VALUES
    ('DD-444', 'Doodad', 1);

-- Queries
SELECT *
FROM Orders;

SELECT *
FROM Manufacturiing_Time;

-- How many different SQL statement can you write that determines if an order will be fulfilled by the 
-- requested delivery date?
WITH
    CTE (Order_ID, Product, Delivery_Date_Days, Part, Days_to_Manufacture)
    AS
    (
        SELECT
            o.Order_ID, o.Product, o.Delivery_Date_Days,
            m.Days_to_Manufacture, m.Part
        FROM Orders o
            FULL OUTER JOIN Manufacturiing_Time m
            ON o.Product = m.Product
        WHERE o.Delivery_Date_Days >= m.Days_to_Manufacture
    )
SELECT DISTINCT o.Order_ID, m.Product
FROM Orders o
    FULL OUTER JOIN Manufacturiing_Time m
    ON o.Product = m.Product
-- WHERE o.Delivery_Date_Days >= m.Days_to_Manufacture;
WHERE o.Delivery_Date_Days >= ALL (
    SELECT m.Days_to_Manufacture
FROM Manufacturiing_Time m
WHERE o.Product = m.Product
)
ORDER BY m.Product DESC



