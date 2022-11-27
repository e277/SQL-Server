CREATE DATABASE AssesDB;
USE AssesDB;

DROP TABLE IF EXISTS Employee;
-- Question A
CREATE TABLE Employee (
	id INT NOT NULL,
	Name VARCHAR(25),
	Joining_dt date,
	Manager_id INT,
	Dept VARCHAR(25),
	Salary Decimal(8,2)
);

INSERT INTO
	Employee(id, Name, Joining_dt, Manager_id, Dept, Salary)
VALUES
	(1, 'abc', '01-01-2021', 2, 'IT', 10000),
	(2, 'bcd', '01-01-2020', 3, 'IT', 20000),
	(3, 'dce', '01-01-2020', 4, 'Admin', 10000),
	(4, 'xyz', '01-01-2022', 0, 'IT', 20000),
	(5, 'pqr', '01-01-2022', 2, 'IT', 15000);

-- test
SELECT * FROM Employee;

-- Output 1 - Employee name, Manager_id
SELECT Name, Manager_id
FROM Employee;

-- Output 2 - manager id, count of employees
SELECT Manager_id, count(Manager_id) 'count_of_employee(s)'
FROM Employee
GROUP BY Manager_id
ORDER BY COUNT(Manager_id) DESC;

-- Output 3 - Highest paid employee of each department
SELECT Dept, Name, Salary,
	rank() over(partition by Dept ORDER BY Salary DESC) rnk
FROM Employee
GROUP BY Dept, Name, Salary


DROP TABLE IF EXISTS Account;
-- Question B
CREATE TABLE Account (
	id INT NOT NULL,
	Name VARCHAR(25),
	Status VARCHAR(25),
	Tran_id INT NOT NULL,
	Tran_type VARCHAR(1),
	Tran_amt DECIMAL(8,2),
	Tran_dt date
);

INSERT INTO
	Account(id, Name, Status, Tran_id, Tran_type, Tran_amt, Tran_dt)
VALUES
	(1, 'abc', 'act', 1, 'c', 500, '01-01-2022'),
	(1, 'abc', 'act', 2, 'c', 500, '02-02-2022'),
	(1, 'abc', 'act', 3, 'c', 500, '02-03-2022'),
	(1, 'abc', 'act', 2, 'd', 500, '02-04-2022'),
	(1, 'abc', 'act', 4, 'd', 500, '02-05-2022'),
	(2, 'xyz', 'act', 1, 'c', 500, '01-01-2022'),
	(2, 'xyz', 'act', 2, 'c', 500, '02-02-2022'),
	(3, 'pqr', 'act', 3, 'c', 500, '02-03-2022'),
	(3, 'pqr', 'act', 2, 'c', 1000, '02-04-2022'),
	(4, 'suv', 'act', 4, 'c', 1000, '02-04-2022'),
	(4, 'suv', 'act', 4, 'd', 500, '02-05-2022');

-- test
SELECT * FROM Account;

-- Output 1 - Latest transaction of each account
SELECT
	id, MAX(Tran_dt) 'Latest Transaction'
FROM Account
GROUP BY id;

-- Output 2 - ID, sum(credit), sum(debit)
SELECT
	id,
	Tran_type,
	SUM(Tran_amt) 'SUM'
FROM Account
GROUP BY Tran_type, id;

-- Create Manager table
DROP TABLE IF EXISTS Managers;
CREATE TABLE Managers (
	id INT,
	Manager_name VARCHAR(50),
);

INSERT INTO 
	Managers (id, Manager_name)
VALUES
	(0, '-'),
	(2, 'bcd'),
	(3, 'dce'),
	(4, 'xyz');

SELECT * FROM Managers;

-- output:
-- Employee name , Manager_name
SELECT
	e.Name 'Employee Name', 
	m.Manager_name 'Manager Name'
FROM
	Employee e
	INNER JOIN Managers m
	ON e.Manager_id = m.id;
-- Employee_name, Manager_name
-- abc,bcd
-- bcd,dce
-- dce,xyz
-- xyz,-
-- pqr, bcd


-- we need to get manager , number of employee
SELECT
	m.Manager_name 'Manager Name', 
	COUNT(m.id) 'Count of employee(s)'
FROM
	Employee e
	INNER JOIN Managers m
	ON e.Manager_id = m.id
GROUP BY m.Manager_name
ORDER BY COUNT(m.id) DESC;
-- Manager_name, Count of employee
-- bcd,2
-- dce,1
-- xyz,1

-- Highest paid employee of each department
SELECT
	e.Dept 'Department Name', 
	e.Name 'Employee Name', 
	e.Salary 'Salary'
FROM
	Employee e
	INNER JOIN (
		SELECT Dept, MAX(Salary) max_salary 
		FROM Employee 
		GROUP BY Dept
	) m
	ON e.Dept = m.Dept AND e.Salary = m.max_salary
-- Dept,Name,Salary
-- IT, BCD, 20000
-- IT, xyz, 20000
-- Admin, DCE, 10000