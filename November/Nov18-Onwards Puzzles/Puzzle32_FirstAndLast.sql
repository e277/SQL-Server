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

-- Write an SQL statement that determines the most and least experienced Spaceman ID by their job description.
-- group the most and least experienced spaceman by job description
-- print as Job_Description, Most_Exp_Spaceman_ID, , Least_Exp_Spaceman_ID
-- order by job description
WITH
    CTE
    AS
    (
        SELECT Job_Description, Spaceman_ID, Mission_Count,
            MAX(Mission_Count) OVER (PARTITION BY Job_Description) AS Most_Exp_Mission_Count,
            MIN(Mission_Count) OVER (PARTITION BY Job_Description) AS Least_Exp_Mission_Count
        FROM FirstLast
    )
SELECT DISTINCT Job_Description,
    MAX(Spaceman_ID) OVER (PARTITION BY Job_Description, Most_Exp_Mission_Count) AS [Most Experienced],
    MIN(Spaceman_ID) OVER (PARTITION BY Job_Description, Least_Exp_Mission_Count) AS [Least Experienced]
FROM CTE
ORDER BY Job_Description;
