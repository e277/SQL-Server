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

-- determine if a number is prime
WITH
	PrimeNumbersCTE
	AS
	(
		SELECT IntegerValue
		FROM PrimeNumbers
		WHERE IntegerValue > 1
			AND IntegerValue % 2 = 1
	)
-- delete all the number that are not prime
DELETE
FROM PrimeNumbers
WHERE IntegerValue NOT IN
(
	SELECT IntegerValue
FROM PrimeNumbersCTE
WHERE IntegerValue + 2 <= 10
);


SELECT *
FROM PrimeNumbers;

