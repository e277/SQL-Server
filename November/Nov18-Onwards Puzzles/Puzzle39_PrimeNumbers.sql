USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PrimeNumbers;
CREATE TABLE PrimeNumbers
(
	IntegerValue INT
);
INSERT INTO PrimeNumbers
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10);

-- Queries
SELECT *
FROM PrimeNumbers;

-- soln `
SELECT IntegerValue
FROM (SELECT
		x.IntegerValue,
		x1.IntegerValue AS divisor,
		x.IntegerValue % x1.IntegerValue AS remaindr
	FROM PrimeNumbers x
		JOIN PrimeNumbers x1 ON x1.IntegerValue <= x.IntegerValue
     ) t
GROUP BY IntegerValue
HAVING SUM(CASE WHEN remaindr = 0 THEN 1 ELSE 0 END) = 2

