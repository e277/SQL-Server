USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Groupings;
CREATE TABLE Groupings
(
    Step_Number INT,
    Status VARCHAR(25)
);
INSERT INTO Groupings
VALUES
    (1, 'Passed');
INSERT INTO Groupings
VALUES
    (2, 'Passed');
INSERT INTO Groupings
VALUES
    (3, 'Passed');
INSERT INTO Groupings
VALUES
    (4, 'Passed');
INSERT INTO Groupings
VALUES
    (5, 'Failed');
INSERT INTO Groupings
VALUES
    (6, 'Failed');
INSERT INTO Groupings
VALUES
    (7, 'Failed');
INSERT INTO Groupings
VALUES
    (8, 'Failed');
INSERT INTO Groupings
VALUES
    (9, 'Failed');
INSERT INTO Groupings
VALUES
    (10, 'Passed');
INSERT INTO Groupings
VALUES
    (11, 'Passed');
INSERT INTO Groupings
VALUES
    (12, 'Passed');

-- Queries
SELECT *
FROM Groupings;


-- Write an SQL statement to count the number of consecutive groupings of the same status
-- print minimum number of step_number, maximum number of step_number, status, count of status

-- WITH CTE AS
-- (
--     SELECT Status, COUNT(*)
--     FROM (
--         SELECT
--             Status,
--             ( ROW_NUMBER() OVER (ORDER BY Step_Number) - ROW_NUMBER() OVER (PARTITION BY Status ORDER BY Step_NUMBER)) as grp
--         FROM Groupings
--     ) AS t
--     GROUP BY Status, grp
-- )
-- SELECT
--     MIN(Step_Number) AS [Min Step Number],
--     MAX(Step_Number) AS [Max Step Number],
--     Status,
--     COUNT(*) AS CountOfStatus
-- FROM CTE
-- GROUP BY Status, CountOfStatus
-- ORDER BY Status, CountOfStatus;



SELECT
    -- for grp = 0, the min step number is 1 and max step number is 4
    -- for grp = 4, the min step number is 5 and max step number is 9
    -- for grp = 5, the min step number is 10 and max step number is 12
    CASE WHEN grp = 0 THEN 1
         WHEN grp = 4 THEN 5
         WHEN grp = 5 THEN 10
    END AS [Min Step Number],
    CASE WHEN grp = 0 THEN 4
         WHEN grp = 4 THEN 9
         WHEN grp = 5 THEN 12
    END AS [Max Step Number],

    Status,
    COUNT(*) AS CountOfStatus

FROM (
    SELECT
        MIN(Step_Number) OVER (PARTITION BY Status ORDER BY Step_Number) AS [Min Step Number],
        MAX(Step_Number) OVER (PARTITION BY Status ORDER BY Step_Number) AS [Max Step Number],
        Status,
        (ROW_NUMBER() OVER (ORDER BY Step_Number) - ROW_NUMBER() OVER (PARTITION BY Status ORDER BY Step_Number)) as grp
    FROM Groupings
) AS t

GROUP BY Status, grp


