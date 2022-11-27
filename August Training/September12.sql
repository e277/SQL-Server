USE HelloWorld;

-- Create an Employee_2 table with columns (Id, Name, Location, Manager_id, Domain, Gender)
DROP TABLE IF EXISTS Employee_2;
CREATE TABLE Employee_2 (
	id INT PRIMARY KEY NOT NULL,
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

-- Using the above table 
-- Write query for displaying below results 
SELECT * FROM Employee_2;
SELECT * FROM Employee;

-- Output 1: 
-- Employee name , Manager_name
SELECT
	e2.employee_name 'Employee Name',
	am.Manager_name 'Manger Name'
FROM
	Employee_2 e2
	INNER JOIN AssesDB.dbo.Managers am ON e2.manager_id = am.id
WHERE am.id > 0

-- Output 2: 
-- Manager_name, Count of employee 
SELECT
	am.Manager_name 'Manager Name',
	COUNT(am.id) 'Count of Employee(s)'
FROM
	Employee_2 e2
	INNER JOIN AssesDB.dbo.Managers am 
	ON e2.manager_id = am.id
GROUP BY am.Manager_name
ORDER BY COUNT(am.id) DESC

-- Output 3: 
-- Highest paid employee of each department 
-- Gender, Name, Salary
SELECT 
	--e.DEPARTMENT,
	ep1.GENDER 'Employee Gender',
	e.NAME 'Employee Name', 
	e.BASIC_PAY 'Salary'
FROM
	Employee e
	INNER JOIN (
		SELECT DEPARTMENT, MAX(BASIC_PAY) max_salary 
		FROM Employee 
		GROUP BY DEPARTMENT
	) m
	ON e.DEPARTMENT = m.DEPARTMENT
	AND e.BASIC_PAY = m.max_salary
	
	INNER JOIN Employee_personal ep1
	ON e.EMPID = ep1.EMPID
ORDER BY Salary DESC

