USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS TestCase;
CREATE TABLE TestCase (
	Test_Case CHAR(1)
);
INSERT INTO TestCase VALUES ('A'), ('B'), ('C');

--Queries
SELECT * FROM TestCase;

--Soln
--Permutations: P(3,3)
SELECT 
	ROW_NUMBER() OVER (ORDER BY T1.Test_Case) AS "Row Number", 
	STRING_AGG(CONVERT(NVARCHAR(max), CONCAT(T1.Test_Case, ',', T2.Test_Case, ',', T3.Test_Case)), CHAR(13)) AS Output 
FROM TestCase T1
	INNER JOIN TestCase T2
	ON T1.Test_Case != T2.Test_Case
	INNER JOIN TestCase T3
	ON T3.Test_Case != T2.Test_Case 
	AND T3.Test_Case != T1.Test_Case
GROUP BY T1.Test_Case, T2.Test_Case, T3.Test_Case

--Combinations: C(3,3)
SELECT 
	ROW_NUMBER() OVER (ORDER BY T1.Test_Case) AS "Row Number", 
	STRING_AGG(CONVERT(NVARCHAR(max), CONCAT(T1.Test_Case, ',', T2.Test_Case, ',', T3.Test_Case)), CHAR(13)) AS Output 
FROM TestCase T1
	INNER JOIN TestCase T2
	ON T1.Test_Case < T2.Test_Case
	INNER JOIN TestCase T3
	ON T3.Test_Case < T2.Test_Case 
	AND T3.Test_Case < T1.Test_Case
GROUP BY T1.Test_Case, T2.Test_Case, T3.Test_Case