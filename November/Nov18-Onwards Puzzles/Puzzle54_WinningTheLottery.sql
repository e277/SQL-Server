USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS WinningNumbers;
CREATE TABLE WinningNumbers
(
    [Number] INT
);
INSERT INTO WinningNumbers
VALUES
    (25),
    (45),
    (78);

DROP TABLE IF EXISTS Tickets;
CREATE TABLE Tickets
(
    Ticket_ID VARCHAR(25),
    [Number] INT
);
INSERT INTO Tickets
VALUES
    ('A23423', 25);
INSERT INTO Tickets
VALUES
    ('A23423', 45);
INSERT INTO Tickets
VALUES
    ('A23423', 78);
INSERT INTO Tickets
VALUES
    ('B35643', 25);
INSERT INTO Tickets
VALUES
    ('B35643', 45);
INSERT INTO Tickets
VALUES
    ('B35643', 98);
INSERT INTO Tickets
VALUES
    ('C98787', 67);
INSERT INTO Tickets
VALUES
    ('C98787', 86);
INSERT INTO Tickets
VALUES
    ('C98787', 91);

-- Queries
SELECT *
FROM WinningNumbers;
SELECT *
FROM Tickets;

WITH
    WinningNumbers_Ranked
    AS
    (
        SELECT w.Number, t.Ticket_ID
        FROM WinningNumbers w
            INNER JOIN Tickets t
            ON w.[Number] = t.[Number]
    ),
    WinningNumbers_Ranked_Sorted
    AS
    (
        SELECT
            Ticket_ID
            , CASE WHEN COUNT(*) = 3 THEN 100 ELSE 10 END AS [Prize]
        FROM WinningNumbers_Ranked
        GROUP BY Ticket_ID
    )
SELECT SUM(Prize) AS [TotalPrize]
FROM WinningNumbers_Ranked_Sorted;