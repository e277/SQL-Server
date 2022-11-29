USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS SecHighest;
CREATE TABLE SecHighest
(
    IntegerVAlue INT
);
INSERT INTO SecHighest
VALUES
    (3759),
    (3760),
    (3761),
    (3762),
    (3763);

-- Queries
SELECT *
FROM SecHighest;

-- How many different SQL statements can you write that will return the second highest integer?

-- Soln 1
SELECT MAX(IntegerVAlue)
FROM SecHighest
WHERE IntegerVAlue < (SELECT MAX(IntegerVAlue)
FROM SecHighest);
-- Soln 2
SELECT MAX(IntegerVAlue)
FROM SecHighest
WHERE IntegerVAlue NOT IN (SELECT MAX(IntegerVAlue)
FROM SecHighest);
-- Soln 3
SELECT MAX(IntegerVAlue)
FROM SecHighest
WHERE IntegerVAlue <> (SELECT MAX(IntegerVAlue)
FROM SecHighest);
-- Soln 4
SELECT MAX(IntegerVAlue)
FROM SecHighest
WHERE IntegerVAlue != (SELECT MAX(IntegerVAlue)
FROM SecHighest);
-- Soln 5
SELECT MAX(IntegerVAlue)
FROM SecHighest
WHERE IntegerVAlue < ANY (SELECT IntegerVAlue
FROM SecHighest);
-- Sol 6
SELECT MAX(IntegerVAlue)
FROM SecHighest
WHERE IntegerVAlue < SOME (SELECT IntegerVAlue
FROM SecHighest);