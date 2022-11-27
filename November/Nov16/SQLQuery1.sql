IF EXISTS (SELECT * FROM sys.databases WHERE name = 'MyPracticeQ_DB')
BEGIN
    DROP DATABASE MyPracticeQ_DB;  
END;
CREATE DATABASE MyPracticeQ_DB;
GO

USE MyPracticeQ_DB;

DROP TABLE IF EXISTS Museums;
CREATE TABLE Museums (
	Museum_ID VARCHAR(255),
	Museum_Name VARCHAR(255),
	Legal_Name VARCHAR(255),
	Alternate_Name VARCHAR(255),
	Museum_Type VARCHAR(255),
	Institution_Name VARCHAR(255),
	Street_Address_Adm_Loc VARCHAR(255),
	City_Adm_Loc VARCHAR(255),
	State_Adm_Loc VARCHAR(255),
	Zip_Code_Adm_Loc VARCHAR(255),
	Street_Address_Phy_Loc VARCHAR(255),
	City_Phy_Loc VARCHAR(255),
	State_Phy_Loc VARCHAR(255),
	Zip_Code_Phy_Loc VARCHAR(255),
	Phone_Number VARCHAR(255),
	Latitude VARCHAR(255),
	Longitude VARCHAR(255),
	Locale_Code_NCES INT,
	County_Code_FIPS INT,
	State_Code_FIPS INT,
	Region_Code_AAM INT,
	Employer_ID_Number VARCHAR(255),
	Tax_Period VARCHAR(255),
	Income VARCHAR(255),
	Revenue VARCHAR(255)
)

BULK INSERT Museums
FROM 'C:/Users/Ezra Muir/Documents/Training-Work/Python/Nov_Learn/Nov16/museums.csv'
WITH
(
	FORMAT = 'CSV'
	,FIRSTROW = 2
	,FIELDTERMINATOR = ','
	,ROWTERMINATOR = '0x0a'
	,KEEPNULLS
)


DROP TABLE IF EXISTS StatePops;
CREATE TABLE StatePops (
	State VARCHAR(255),
	_2018_Population BIGINT,
	State_Code VARCHAR(255)
)

BULK INSERT StatePops
FROM 'C:/Users/Ezra Muir/Documents/Training-Work/Python/Nov_Learn/Nov16/State Populations.csv'
WITH
(
	FORMAT = 'CSV'
	,FIRSTROW = 2
	,FIELDTERMINATOR = ','
	,ROWTERMINATOR = '0x0a'
	,KEEPNULLS
)

SELECT * FROM Museums;
SELECT * FROM StatePops;


-- QUERIES
SELECT COUNT(*) FROM Museums
-- Query 1 - Which city or state has the most museums per capita?
SELECT TOP 1
	State_Adm_Loc,
	COUNT(Museum_Name) 'Number of Museums'
FROM 
	Museums
GROUP BY State_Adm_Loc
ORDER BY COUNT(Museum_Name) DESC

SELECT TOP 1
	City_Adm_Loc,
	COUNT(Museum_Name) 'Number of Museums'
FROM 
	Museums
GROUP BY City_Adm_Loc
ORDER BY COUNT(Museum_Name) DESC

SELECT TOP 1
	m.City_Adm_Loc,
	COUNT(Museum_Name) 'Number_Of_Museums)'
FROM
	Museums m
	FULL OUTER JOIN StatePops sp
	ON sp.State_Code = m.State_Adm_Loc
GROUP BY m.City_Adm_Loc
ORDER BY COUNT(m.Museum_Name) DESC

SELECT TOP 1
	m.City_Adm_Loc,
	COUNT(Museum_Name) 'Number_Of_Museums)'
FROM
	Museums m
	FULL OUTER JOIN (
		SELECT State, MAX(_2018_Population) FROM StatePops GROUP BY State ORDER BY MAX(_2018_Population)
	)
	ON sp.State_Code = m.State_Adm_Loc
GROUP BY m.City_Adm_Loc
ORDER BY COUNT(m.Museum_Name) DESC


-- Query 2 - How many zoos or aquariums exist in the United States?
SELECT 
	Museum_Type,
	COUNT(Museum_Type) 'Count Of Type - ZOO'
FROM Museums
WHERE
	Museum_Type LIKE '%ZOO%'
GROUP BY Museum_Type
ORDER BY COUNT(Museum_Name) DESC

SELECT 
	Museum_Type,
	COUNT(Museum_Type) 'Count Of Type - AQUARIUM'
FROM Museums
WHERE
	Museum_Type LIKE '%AQUARIUM%'
GROUP BY Museum_Type
ORDER BY COUNT(Museum_Name) DESC

-- Query 3 - What museum or related organization had the highest revenue last year?


-- Query 4 - 

-- Query 5 - 

-- Query 6 - 

-- Query 7 - 

-- Query 8 - 
