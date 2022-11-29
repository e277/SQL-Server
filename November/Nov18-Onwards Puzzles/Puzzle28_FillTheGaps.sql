USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Gaps;
CREATE TABLE Gaps
(
    RowNumber INT,
    Workflow VARCHAR(25),
    Status VARCHAR(25)
);
INSERT INTO Gaps
VALUES
    (1, 'Alpha', 'Pass');
INSERT INTO Gaps
VALUES
    (2, NULL, 'Fail');
INSERT INTO Gaps
VALUES
    (3, NULL, 'Fail');
INSERT INTO Gaps
VALUES
    (4, NULL, 'Fail');
INSERT INTO Gaps
VALUES
    (5, 'Bravo', 'Pass');
INSERT INTO Gaps
VALUES
    (6, NULL, 'Fail');
INSERT INTO Gaps
VALUES
    (7, NULL, 'Fail');
INSERT INTO Gaps
VALUES
    (8, NULL, 'Pass');
INSERT INTO Gaps
VALUES
    (9, NULL, 'Pass');
INSERT INTO Gaps
VALUES
    (10, 'Charlie', 'Fail');
INSERT INTO Gaps
VALUES
    (11, NULL, 'Fail');
INSERT INTO Gaps
VALUES
    (12, NULL, 'Fail');

-- Queries
SELECT *
FROM Gaps;

-- Write an SQL statement to fill in the missing gaps

UPDATE Gaps
SET Workflow = (
    CASE WHEN RowNumber >= 1 AND RowNumber <= 4 THEN 'Alpha'
         WHEN RowNumber >= 5 AND RowNumber <= 9 THEN 'Bravo'
         WHEN RowNumber >= 10 AND RowNumber <= 12 THEN 'Charlie'
    END
)

SELECT *
FROM Gaps;
