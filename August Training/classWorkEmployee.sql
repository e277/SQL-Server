USE HelloWorld;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee
(
	EMPID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	COUNTRY VARCHAR(50) NOT NULL,
	SALARY DECIMAL(8,2) NOT NULL,
	JOINING_DATE DATETIME NOT NULL,
	DEPARTMENT VARCHAR(50) NOT NULL
);
-- CREATING ANOTHER TABLE - Employee_personal
-- Question 16 - Create a table Employee_personal
DROP TABLE IF EXISTS Employee_personal;
CREATE TABLE Employee_personal
(
	EMPID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PLACE VARCHAR(50) NOT NULL,
	GENDER VARCHAR(50) NOT NULL,
	AVAILABLE VARCHAR(50) NOT NULL,
	PHNO VARCHAR(50) NOT NULL,
	DEPARTMENT VARCHAR(50) NOT NULL
);

INSERT INTO 
	Employee
	(EMPID, NAME, COUNTRY, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
	(001, 'Shippy', 'Jamaica', 100000, '2022-02-20 09:00:00', 'S/W Engg-A'),
	(002, 'Christopher', 'Jamaica', 800000, '2022-06-11 09:00:00', 'S/W Engg'),
	(003, 'Alanzo', 'India', 300000, '2022-02-20 09:00:00', 'S/W Engg'),
	(004, 'Ezra', 'Jamaica', 500000, '2022-02-20 09:00:00', 'S/W Engg-C'),
	(005, 'Grant', 'India', 500000, '2022-06-11 09:00:00', 'S/W Engg'),
	(006, 'Olando', 'Jamaica', 200000, '2022-06-11 09:00:00', 'S/W Engg'),
	(007, 'Camille', 'India', 705000, '2022-01-20 09:00:00', 'S/W Engg-B'),
	(008, 'Donald', 'India', 900000, '2022-04-11 09:00:00', 'S/W Engg');

INSERT INTO
	Employee_personal
	(EMPID, NAME, PLACE, GENDER, AVAILABLE, PHNO, DEPARTMENT)
VALUES
	(001, 'Shippy', 'Kingston', 'Male', 'Yes', '(876) 987-8346', 'S/W Engg-A'),
	(002, 'Christopher', 'Montego Bay', 'Male', 'No', '(876) 785-6346', 'S/W Engg'),
	(003, 'Alanzo', 'New Delhi', 'Male', 'Yes', '(876) 864-5346', 'S/W Engg'),
	(004, 'Ezra', 'Saint James', 'Male', 'Yes', '(876) 879-5346', 'S/W Engg-C'),
	(005, 'Grant', 'Chennai', 'Male', 'No', '(876) 956-8346', 'S/W Engg'),
	(006, 'Olando', 'Portmore', 'Male', 'Yes', '(876) 849-4346', 'S/W Engg'),
	(007, 'Camille', 'Coimbatore', 'Female', 'No', '(876) 987-5346', 'S/W Engg-B'),
	(008, 'Donald', 'Udumalper', 'Male', 'No', '(876) 895-4346', 'S/W Engg');


-- SQL Query
SELECT *
FROM Employee;
SELECT *
FROM Employee_personal;

-- Question 1 - Write an SQL query to fetch “NAME” from Employee table
SELECT NAME
FROM Employee;

-- Question 2 - Write an SQL query to fetch “NAME” from Employee table in upper case.
SELECT UPPER(NAME) AS 'Upper Case Names'
FROM Employee;

-- Question 3 - Write an SQL query to fetch unique values of DEPARTMENT.
SELECT DISTINCT DEPARTMENT
FROM Employee;

-- Question 4 - Write an SQL query to print the first three characters of  NAME from table.
SELECT SUBSTRING(NAME, 1, 3)
FROM Employee;

-- Question 5 - Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Alanzo’ from the table.
SELECT NAME, CHARINDEX('a', 'Alanzo') AS 'Index of a', LEN('Alanzo')-LEN(REPLACE('Alanzo','a','')) AS 'Number of a'
FROM Employee
WHERE NAME='Alanzo';


SELECT NAME, CHARINDEX('a', 'Ezra') AS 'Position At'
FROM Employee
WHERE NAME='Ezra';

-- Question 6 - Change the column name from “SALARY” to “Basic Pay”
EXEC sp_rename 'Employee.SALARY', 'BASIC_PAY', 'COLUMN';

-- Question 7 - Write an SQL query to add column like “DA”, “Deductions”, “Gross Pay”, “Net Pay”.
ALTER TABLE Employee
ADD DA DECIMAL(8,2),
	DEDUCTIONS DECIMAL(8,2),
	GROSS_PAY DECIMAL(8,2),
	NET_PAY DECIMAL(8,2);

-- Question 8 - DA = 2% of Basic Pay
UPDATE Employee
SET DA = 0.02 * BASIC_PAY;

-- Question 9 - Deductions = 3% of Basic Pay
UPDATE Employee
SET DEDUCTIONS = 0.03 * BASIC_PAY;

-- Question 10 - Gross Pay = Basic Pay + DA
UPDATE Employee
SET GROSS_PAY = BASIC_PAY + DA;

-- Question 11 - Net Pay = Gross Pay - Deductions
UPDATE Employee
SET NET_PAY = GROSS_PAY - DEDUCTIONS;

-- Question 12 - Display highest paid employee name
SELECT NAME, NET_PAY
FROM Employee
WHERE NET_PAY = (SELECT MAX(NET_PAY)
FROM Employee);

-- Question 13 - Display lowest paid employee name
SELECT NAME, NET_PAY
FROM Employee
WHERE NET_PAY = (SELECT MIN(NET_PAY)
FROM Employee);

-- Question 14 - Display average basic pay of employees
SELECT AVG(BASIC_PAY) AS 'Average BASIC_PAY'
FROM Employee;

-- Question 15 - Display the average DA
	SELECT AVG(DA) AS 'Average DA'
	FROM Employee;

-- Question 16 - See Above for Table creation and insert
-- QUERIES FOR JOINING
-- Question 17 - Display the Place and Phone number of all employees.
SELECT
	e.EMPID, e.NAME, ep.PLACE, ep.PHNO
FROM
	Employee e
	INNER JOIN Employee_personal ep
	ON e.NAME = ep.NAME

-- Question 18 - Display the Place and Country of employees with availability “Yes”
SELECT
	e.NAME, e.COUNTRY, ep.PLACE, ep.AVAILABLE
FROM
	Employee e
	INNER JOIN Employee_personal ep
	ON e.EMPID = ep.EMPID
WHERE
	ep.AVAILABLE = 'Yes'

-- Question 19 - Display all the name and Salary of location of employee in “Coimbatore”
SELECT
	e.NAME, e.BASIC_PAY, e.DEPARTMENT, ep.PLACE
FROM
	Employee e
	INNER JOIN Employee_personal ep
	ON e.EMPID = ep.EMPID
WHERE
	ep.PLACE = 'Coimbatore'

-- Question 20 - Display the phone number, gender and name of employee with designation “S/W Engg “
SELECT
	e.NAME, ep.PHNO, ep.GENDER, e.DEPARTMENT
FROM
	Employee e
	INNER JOIN Employee_personal ep
	ON e.NAME = ep.NAME
WHERE
	e.DEPARTMENT = 'S/W Engg'


-- Question 21 - Write a query to Filter Data using where clause gender = “Female”
SELECT
	NAME, GENDER
FROM
	Employee_personal
WHERE
	GENDER = 'Female';

-- Question 22 - Sort the Employee Name using the ORDER BY Clause.
SELECT
	NAME
FROM
	Employee
ORDER BY NAME;
SELECT
	NAME
FROM
	Employee
ORDER BY NAME DESC;

-- Question 23 - Display the TOP (5) high salaried employees – display their name, salary and department.
SELECT TOP 5
	NAME, BASIC_PAY, DEPARTMENT
FROM
	Employee
ORDER BY BASIC_PAY DESC;

-- Question 24 - Retrieve the elements like available and Employee name using OFFSET - FETCH
SELECT
	e.NAME,
	ep.AVAILABLE
FROM
	Employee e
	FULL OUTER JOIN Employee_personal ep
	ON e.NAME = ep.NAME AND e.EMPID = ep.EMPID
ORDER BY
	e.NAME
OFFSET 4 ROWS
FETCH NEXT 4 ROWS ONLY;

-- Question 25 - Use the following Aggregate functions and frame a query from the table - Employee :
-- i. SUM()
-- ii. COUNT()
-- iii. AVG()
-- iv. MIN()
-- v. MAX()
-- vi. FIRST_VALUE()
-- vii. LAST_VALUE()
SELECT SUM(BASIC_PAY) AS sum_of_basic_pay
FROM Employee;

SELECT COUNT(EMPID) count_of_employee
FROM Employee;

SELECT AVG(BASIC_PAY) AS average_of_basic_pay
FROM Employee;

SELECT MIN(BASIC_PAY) AS minimum_of_basic_pay
FROM Employee;

SELECT MAX(BASIC_PAY) AS maximum_of_basic_pay
FROM Employee;

SELECT *, 
	FIRST_VALUE(BASIC_PAY) OVER (ORDER BY BASIC_PAY) AS 
	first_value_of_basic_pay
FROM Employee;

SELECT NAME, BASIC_PAY, 
	LAST_VALUE(BASIC_PAY) OVER (PARTITION BY BASIC_PAY ORDER BY BASIC_PAY) AS 
	last_value_of_basic_pay
FROM Employee;

-- Question 26 - Use the following Scalar functions and frame a query from the table - Employee_personal :
-- i. LCASE()
-- ii. UCASE()
-- iii. LEN()
-- iv. MID is SUBSTRING() in sql server
-- v. ROUND()
-- vi. NOW() is SYSDATETIME() in sql server
-- vii. FORMAT()

SELECT UPPER(NAME) AS upper_case_of_name
FROM Employee_personal;

SELECT LOWER(NAME) AS lower_case_of_name
FROM Employee_personal;

SELECT NAME, LEN(NAME) AS length_of_name
FROM Employee_personal;

SELECT NAME, SUBSTRING(NAME, 1, 4) AS substring_of_name
FROM Employee_personal;

SELECT AVG(e.BASIC_PAY) AS average_basic_pay, ROUND(AVG(e.BASIC_PAY), 2) AS rounded_basic_pay
FROM Employee e
	INNER JOIN Employee_personal ep
	ON e.NAME = ep.NAME;

-- SYS.DATETIME() is the current date and time
SELECT SYSDATETIME() AS current_date_time
FROM Employee_personal
WHERE NAME = 'Ezra';

-- FORMAT() is a function that returns the formatted date and time
SELECT FORMAT(SYSDATETIME(), 'dd-MM-yyyy hh:mm:ss') AS formatted_date_time
FROM Employee_personal;


-- 27.	Update the following columns to the table 
-- Employee (i) (iii) and Employee_Personal (ii) (iii)
-- i.	Rank 1,2,3,1,2,3,1,2 
-- ii.	 Grade A,B,C,D,A,B,C,D
-- iii.	Project Platform – Java , Python, Oracle, Flutter, Springboard, Oracle, Flutter, Springboard

ALTER TABLE Employee_personal
ADD Rank INT,
	Grade CHAR(1),
	Project_Platform VARCHAR(50);

UPDATE Employee_personal
SET Rank = 1, Grade = 'A', Project_Platform = 'Java'
WHERE NAME = 'Shippy';

UPDATE Employee_personal
SET Rank = 2, Grade = 'B', Project_Platform = 'Python'
WHERE NAME = 'Christopher';

UPDATE Employee_personal
SET Rank = 3, Grade = 'C', Project_Platform = 'Oracle'
WHERE NAME = 'Alanzo';

UPDATE Employee_personal
SET Rank = 4, Grade = 'D', Project_Platform = 'Flutter'
WHERE NAME = 'Ezra';

UPDATE Employee_personal
SET Rank = 5, Grade = 'E', Project_Platform = 'Springboard'
WHERE NAME = 'Grant';

UPDATE Employee_personal
SET Rank = 6, Grade = 'F', Project_Platform = 'Oracle'
WHERE NAME = 'Olando';

UPDATE Employee_personal
SET Rank = 7, Grade = 'G', Project_Platform = 'Flutter'
WHERE NAME = 'Camille';

UPDATE Employee_personal
SET Rank = 8, Grade = 'H', Project_Platform = 'Springboard'
WHERE NAME = 'Donald';

--28	Apply the Rank (), Dense_rank() and Row_number() function in all possible ways in both table.
SELECT *
FROM Employee_personal;
-- To check the changes

-- RANK()
SELECT
	NAME, Rank, Grade, Project_Platform,
	RANK() OVER (
		ORDER BY Project_Platform
	) AS rank_of_project_platform
FROM Employee_personal;

-- RANK() with OUTER JOIN
SELECT
	ep.NAME, Rank, Grade, Project_Platform,
	RANK() OVER (
		PARTITION BY Project_Platform
		ORDER BY Project_Platform
	) AS rank_of_project_platform
FROM Employee_personal ep
	FULL OUTER JOIN Employee e
	ON ep.NAME = e.NAME;


-- DENSE_RANK()
SELECT
	NAME, Rank, Grade, Project_Platform,
	DENSE_RANK() OVER (
		ORDER BY Project_Platform
	) AS rank_of_project_platform
FROM Employee_personal;


-- ROW_NUMBER()
SELECT
	NAME, Rank, Grade, Project_Platform, DEPARTMENT,
	ROW_NUMBER() OVER (
		PARTITION BY DEPARTMENT
		ORDER BY NAME
	) AS rank_of_row_number
FROM Employee_personal;


-- Question 29 - Implement the following Set Operators in both the tables(write syntax and example with existing tables)
-- i. UNION
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee
UNION
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee_personal;

-- ii. UNION ALL
	SELECT

		EMPID, NAME, DEPARTMENT
	FROM Employee
UNION ALL
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee_personal;

-- iii. INTERSECT
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee
INTERSECT
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee_personal;

-- iv. MINUS (i.e. EXCEPT in sql server)
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee
EXCEPT
	SELECT
		EMPID, NAME, DEPARTMENT
	FROM Employee_personal;

-- Question 30
 

 -- Question 31 - Self-Learn topics (write the concept, syntax and example with existing tables) 2:
    -- a. COMMIT & ROLLBACK statements

    -- b. Using the SAVEPOINT statement

    -- c. Automatic COMMIT behavior in SQL

    -- d. MERGE statement



 -- Question 32 - SQL Performance Tuning (write the concept, syntax and example with existing tables)
--  i. Query Tuning by rewriting SQL’s
 SELECT 
	e.NAME, e.BASIC_PAY, e.DEPARTMENT, 
	ep.NAME, ep.DEPARTMENT, ep.Project_Platform
FROM
	Employee e
	INNER JOIN Employee_personal ep
	ON e.NAME = ep.NAME;

SET STATISTICS IO, TIME ON;
SELECT 
	e.NAME, e.BASIC_PAY, e.DEPARTMENT, 
	ep.NAME, ep.DEPARTMENT, ep.Project_Platform
FROM Employee e 
	INNER JOIN Employee_personal ep
	ON e.EMPID = ep.EMPID
-- Query Tuning


-- ii. Query Tuning by using Indexes Data dictionary views and Introduction to Database Definition Language DDL


