USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS FirstLast;
CREATE TABLE FirstLast
(
    Spaceman_ID INT,
    Job_Description VARCHAR(25),
    Mission_Count INT
);
INSERT INTO FirstLast
VALUES
    (1001, 'Astrogator', 6);
INSERT INTO FirstLast
VALUES
    (2002, 'Astrogator', 12);
INSERT INTO FirstLast
VALUES
    (3003, 'Astrogator', 17);
INSERT INTO FirstLast
VALUES
    (4004, 'Geologist', 21);
INSERT INTO FirstLast
VALUES
    (5005, 'Geologist', 9);
INSERT INTO FirstLast
VALUES
    (6006, 'Geologist', 8);
INSERT INTO FirstLast
VALUES
    (7007, 'Technician', 13);
INSERT INTO FirstLast
VALUES
    (8008, 'Technician', 2);
INSERT INTO FirstLast
VALUES
    (9009, 'Technician', 7);

-- Queries
SELECT *
FROM FirstLast;


-- Group by Job_Description, find the highest mission count as Most_Experienced and the lowest mission count as Least_Experienced
-- print Job_Description, Most_Experienced by Spaceman_ID and Least_Experienced by Spaceman_ID
WITH
    CTE
    AS
    (
        SELECT Job_Description, Mission_Count,
            MAX(Mission_Count) OVER (PARTITION BY Job_Description) AS Most_Experienced,
            MIN(Mission_Count) OVER (PARTITION BY Job_Description) AS Least_Experienced
        FROM FirstLast
    )
SELECT DISTINCT Job_Description,
    (SELECT Spaceman_ID
    FROM FirstLast
    WHERE Job_Description = CTE.Job_Description
        AND Mission_Count = CTE.Most_Experienced) AS Most_Experienced,
    (SELECT Spaceman_ID
    FROM FirstLast
    WHERE Job_Description = CTE.Job_Description
        AND Mission_Count = CTE.Least_Experienced) AS Least_Experienced
FROM CTE
