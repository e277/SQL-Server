USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Recprs;
CREATE TABLE Recprs
(
    PlayerA INT,
    PlayerB INT,
    Score INT
);
INSERT INTO Recprs
VALUES
    (1001, 2002, 150);
INSERT INTO Recprs
VALUES
    (3003, 4004, 15);
INSERT INTO Recprs
VALUES
    (4004, 3003, 125);

--Queries
SELECT *
FROM Recprs;

-- Correct, but..
UPDATE Recprs
SET PlayerA=3003 WHERE PlayerB=3003
UPDATE Recprs
SET PlayerB=4004 WHERE PlayerA=3003
SELECT PlayerA, PlayerB, SUM(Score) AS Score
FROM Recprs
GROUP BY PlayerA, PlayerB
GO

-- Soln 2
WITH
    Game
    AS
    (
        SELECT PlayerA, PlayerB, Score
        from recprs
    )
-- remove duplicate player1, plater2 if any column is the same if swapped values
SELECT playera, playerb, sum(score) AS score
FROM game
GROUP BY playera, playerb
HAVING playera < playerb
