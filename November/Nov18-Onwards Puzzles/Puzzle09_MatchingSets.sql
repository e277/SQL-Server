USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS MatSets;
CREATE TABLE MatSets
(
	Employee_ID INT,
	License VARCHAR(25)
)
INSERT INTO MatSets
VALUES
	(1001, 'Class A');
INSERT INTO MatSets
VALUES
	(1001, 'Class B');
INSERT INTO MatSets
VALUES
	(1001, 'Class C');
INSERT INTO MatSets
VALUES
	(2002, 'Class A');
INSERT INTO MatSets
VALUES
	(2002, 'Class B');
INSERT INTO MatSets
VALUES
	(2002, 'Class C');
INSERT INTO MatSets
VALUES
	(3003, 'Class A');
INSERT INTO MatSets
VALUES
	(3003, 'Class D');

--Queries
SELECT *
FROM MatSets;

-- Soln 1
	SELECT Employee_ID
	FROM MatSets
	WHERE License IN ('Class A')
INTERSECT
	SELECT Employee_ID
	FROM MatSets
	WHERE License IN ('Class B')
INTERSECT
	SELECT Employee_ID
	FROM MatSets
	WHERE License IN ('Class C');

-- Soln 2
SELECT Employee_ID
FROM MatSets
GROUP BY Employee_ID
HAVING COUNT(Employee_ID) = 3
-- Testing with 3 implicitly assumes that there are 3 License types



