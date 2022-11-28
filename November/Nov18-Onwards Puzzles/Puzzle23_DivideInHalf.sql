USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS InHalves
CREATE TABLE InHalves
(
    Player_ID INT,
    Score INT
);
GO
INSERT INTO InHalves
VALUES
    (1001, 2343);
INSERT INTO InHalves
VALUES
    (2002, 9432);
INSERT INTO InHalves
VALUES
    (3003, 6548);
INSERT INTO InHalves
VALUES
    (4004, 1054);
INSERT INTO InHalves
VALUES
    (5005, 6832);
GO

-- Queries
SELECT *
FROM InHalves;
GO

-- Players that rank in the top half must be given a value of 1, and the remaining players must be given a 
-- value of 2.
WITH
    CTE
    AS
    (
        SELECT Player_ID, Score
        --,AVG(Score) OVER (PARTITION BY 1) AS AvgScore
        , CASE WHEN Score >= (SELECT AVG(Score)
            FROM InHalves) THEN 1 ELSE 2 END AS Rank
        FROM InHalves
    )
SELECT *
FROM CTE;
