USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS SampleData;
CREATE TABLE SampleData (
	IntegerValue INT
)
INSERT INTO SampleData
VALUES (5),(6),(10),(10),(13),(14),(17),(20),(81),(90),(76);

--Queries
SELECT * FROM SampleData;

-- Soln 1
-- Mean
SELECT AVG(IntegerValue) Mean FROM SampleData

--Median
DECLARE @c BIGINT = (SELECT COUNT(*) FROM SampleData);
SELECT AVG(1.0 * IntegerValue)
FROM (
	SELECT IntegerValue FROM SampleData
    ORDER BY IntegerValue
    OFFSET (@c - 1) / 2 ROWS
    FETCH NEXT 1 + (1 - @c % 2) ROWS ONLY
) AS x;

-- Mode
SELECT TOP 1 IntegerValue
FROM SampleData
GROUP BY IntegerValue
ORDER BY COUNT(IntegerValue) DESC

-- Range
-- Soln 1
SELECT MAX(IntegerValue) - MIN(IntegerValue) Range 
FROM SampleData

-- Soln 2

