USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PhoneDir;
CREATE TABLE PhoneDir (
	Customer_ID INT,
	Type VARCHAR(25),
	Phone_Number VARCHAR(25)
)
INSERT INTO PhoneDir
	(Customer_ID, Type, Phone_Number)
VALUES
	(1001, 'Cellular', '555-897-5421'),
	(1001, 'Work', '555-897-6542'),
	(1001, 'Home', '555-698-9874'),
	(2002, 'Cellular', '555-963-6544'),
	(2002, 'Work', '555-812-9856'),
	(3003, 'Cellular', '555-987-6541');

--Queries
SELECT * FROM PhoneDir;

--1
SELECT
	Customer_ID, Cellular, Work, Home
FROM (
	SELECT  Customer_ID, Phone_Number, Type
	FROM PhoneDir
) d
PIVOT
(
	MAX(Phone_Number) 
	FOR Type IN (Cellular, Work, Home) 
) piv

--2
SELECT
	Customer_ID, Cellular, Work, Home
FROM 
	PhoneDir
PIVOT
(
	MAX(Phone_Number) 
	FOR Type IN (Cellular, Work, Home) 
) piv