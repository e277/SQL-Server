USE HelloWorld;

-- Question 54
-- Create an Employee_2 table with columns (Id, Name, Location, Manager_id, Domain, Gender)
DROP TABLE IF EXISTS Employee_2;
CREATE TABLE Employee_2 (
	id INT,
	employee_name VARCHAR(25),
	location VARCHAR(25),
	manager_id INT,
	domain VARCHAR(25),
	gender VARCHAR(25)
);

-- Insert the data like below: 
-- Id, Employee_Name, Location, Manager_id, Domain, Gender
-- 1, Olando,India, 2, UI, Male
-- 2, Priya, Glassgow,3,Data Analyst, Female
-- 3, Shippy, Paris,4,Oracle, Male 
-- 4, Sabarish, Dubai, 0, UI, Male
-- 5, Christoper,Banglore,2,BI, Male
-- 6,Punitha, Chennai, 1,UI, Female
-- 7,Muir, Kingston, 3, Oracle, Male
-- 8,Grant, Mumbai, 4, UI, Male
INSERT INTO Employee_2
	(id, employee_name, location, manager_id, domain, gender)
VALUES
	(1, 'Olando', 'India', 2, 'UI', 'Male'),
	(2, 'Priya', 'Glassgow', 3, 'Data Analyst', 'Female'),
	(3, 'Shippy', 'Paris', 4, 'Oracle', 'Male'),
	(4, 'Sabarish', 'Dubai', 0, 'UI', 'Male'),
	(5, 'Christoper', 'Bangalore', 2, 'BI', 'Male'),
	(6, 'Punitha', 'Chennai', 1, 'UI', 'Female'),
	(7, 'Muir', 'Kingston', 3, 'Oracle', 'Male'),
	(8, 'Grant', 'Mumbai', 4, 'UI', 'Male');

-- QUERIES
SELECT * FROM Employee_2;


-- Output 1: 
-- Employee name , Manager_name
SELECT
	e.employee_name 'Employee Name',
	m.employee_name 'Manager Name'
FROM
	Employee_2 e
	INNER JOIN Employee_2 m
	ON e.manager_id = m.id 

-- Output 2
-- Manager_name, Count of employee 
SELECT
	m.employee_name 'Manager Name',
	COUNT(m.id) 'Count of Employee(s)'
FROM
	Employee_2 e
	INNER JOIN Employee_2 m
	ON e.manager_id = m.id
GROUP BY m.employee_name
ORDER BY COUNT(m.id) DESC

-- Output 3
-- Highest paid employee of each department
-- Gender, Name, Salary



-- Question 55
-- Write an SQL Query for COALESEC()


-- Question 56
-- Insert the following in the table - Employee_2
-- 8,Grant, Mumbai, 4, UI, Male
INSERT INTO Employee_2
	(id, employee_name, location, manager_id, domain, gender)
VALUES
	(8, 'Grant', 'Mumbai', 4, 'UI', 'Male');

-- Question 57
-- Find and Delete the duplicate entry in the table Employee_2
SELECT * FROM Employee_2;

DELETE D
FROM 
	(SELECT *,
		ROW_NUMBER() OVER(PARTITION BY employee_name ORDER BY id) rn
	FROM Employee_2
	) AS D
WHERE rn > 1

-- Question 58
-- Write a query using pattern matching (display the Employee_name which ends with
-- r and also display the manager_id 1)
SELECT
	employee_name, manager_id
FROM Employee_2
WHERE employee_name LIKE '%r'

-- Question 59
-- Insert DOJ for all the employees on the month of 1, Jan 2022, 2 Feb, 
-- 3 March – 8 Aug 2022 respectively.
ALTER TABLE Employee_2
ADD doj DATE

UPDATE Employee_2
SET doj='2022-01-01' WHERE id=1;
UPDATE Employee_2
SET doj='2022-02-02' WHERE id=2;
UPDATE Employee_2
SET doj='2022-03-03' WHERE id=3;
UPDATE Employee_2
SET doj='2022-04-04' WHERE id=4;
UPDATE Employee_2
SET doj='2022-05-05' WHERE id=5;
UPDATE Employee_2
SET doj='2022-06-06' WHERE id=6;
UPDATE Employee_2
SET doj='2022-07-07' WHERE id=7;
UPDATE Employee_2
SET doj='2022-08-08' WHERE id=8;

-- a. Each employee will be credited with salary after the 15th day from their DOJ.
SELECT
	e1.*,
	e2.*
FROM
	Employee e1
	INNER JOIN Employee_2 e2
	ON e1.NAME = e2.employee_name

-- b. Display the salary date and store it in a new column


-- Question 60
-- Insert salary to all employees ranging 70,000 - 5,00,000


-- Question 61
-- Query to display the female employees of all employees based on 
-- a location whose salary &gt; 2,30,000?


-- Question 62
-- Display the even records from the table.


-- Question 63
-- How can be the table Employee_2 normalized?