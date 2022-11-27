USE HelloWorld;

-- Question 42
-- Create a table Employee_personal_new
DROP TABLE IF EXISTS Employee_personal_new;
CREATE TABLE Employee_personal_new (
	EMPID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PLACE VARCHAR(50) NOT NULL,
	GENDER VARCHAR(50) NOT NULL,
	AVAILABLE VARCHAR(50) NOT NULL,
	PHNO VARCHAR(50) NOT NULL,
	DEPARTMENT VARCHAR(50) NOT NULL
);

-- Insert into tables
INSERT INTO
	Employee_personal_new
	(EMPID, NAME, PLACE, GENDER, AVAILABLE, PHNO, DEPARTMENT)
VALUES
	(001, 'Shippy', 'Kingston', 'Male', 'Yes', '(876) 987-8346', 'S/W Engg-A'),
	(002, 'Priya', 'Montego Bay', 'Male', 'No', '(876) 785-6346', 'S/W Engg-C'),
	(003, 'Alanzo', 'New Delhi', 'Male', 'Yes', '(876) 864-5346', 'S/W Engg'),
	(004, 'Punitha', 'Saint James Parish', 'Female', 'Yes', '(876) 879-5346', 'S/W Engg-C'),
	(005, 'Grant', 'Chennai', 'Male', 'No', '(876) 956-8346', 'S/W Engg-K'),
	(006, 'Olando', 'Portmore', 'Male', 'Yes', '(876) 849-4346', 'S/W Engg'),
	(007, 'Camille', 'Coimbatore', 'Female', 'No', '(876) 987-5346', 'S/W Engg-B'),
	(008, 'Donald', 'Udumalper', 'Male', 'No', '(876) 895-4346', 'S/W Engg');

SELECT * FROM Employee_personal_new;
SELECT * FROM Employee;

--QUERIES

-- Question 43
-- Use INNER Join to create a query to display the emp_id and Emp_name if the
-- department is S/W Engg from the table Employee and Emp_Personal_new.
SELECT
	epn.EMPID 'Employee ID',
	epn.NAME 'Employee Name'
FROM
	Employee e
	INNER JOIN Employee_personal_new epn
	ON e.EMPID = epn.EMPID AND e.DEPARTMENT = epn.DEPARTMENT
WHERE epn.DEPARTMENT = 'S/W Engg' AND e.DEPARTMENT = 'S/W Engg'

-- Question 44
-- Use left Join to create a query to display the emp_id and Emp_name if the
-- department is S/W Engg from the table Employee and Emp_Personal_new.
SELECT
	epn.EMPID 'Employee ID',
	epn.NAME 'Employee Name'
FROM
	Employee e
	LEFT JOIN Employee_personal_new epn
	ON e.EMPID = epn.EMPID AND e.DEPARTMENT = epn.DEPARTMENT
WHERE e.DEPARTMENT = 'S/W Engg'

-- Question 45
-- Use full Join to create a query to display the emp_id and Emp_name if the
-- department is S/W Engg from the table Employee and Emp_Personal_new.
SELECT
	epn.EMPID 'Employee ID',
	epn.NAME 'Employee Name'
FROM
	Employee e
	FULL OUTER JOIN Employee_personal_new epn
	ON e.EMPID = epn.EMPID AND e.DEPARTMENT = epn.DEPARTMENT
WHERE epn.DEPARTMENT = 'S/W Engg' OR e.DEPARTMENT = 'S/W Engg'

-- Question 46
-- Use right Join to create a query to display the emp_id and Emp_name if the
-- department is S/W Engg from the table Employee and Emp_Personal_new.
SELECT
	epn.EMPID 'Employee ID',
	epn.NAME 'Employee Name'
FROM
	Employee e
	INNER JOIN Employee_personal_new epn
	ON e.EMPID = epn.EMPID AND e.DEPARTMENT = epn.DEPARTMENT
WHERE epn.DEPARTMENT = 'S/W Engg'

-- Question 47
-- Create a table as follows:
--	a. Table name: table_1
--	b. Primary key : id
--	c. Table Format:
DROP TABLE IF EXISTS table_1;
DROP TABLE IF EXISTS table_2;

CREATE TABLE table_1 (
	id INT IDENTITY(1,1) PRIMARY KEY,
	indian_name VARCHAR(25),
	jamaican_name VARCHAR(25),
	age INT
);
CREATE TABLE table_2 (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(25),
	city VARCHAR(25),
	age INT
);

-- INSERT INTO Tables
INSERT INTO table_1
	(indian_name, jamaican_name, age)
VALUES
	('Prahan', 'Shippy', 19),
	('Aavani', 'Christopher', 18),
	('Nemi', 'Alanzo', 19),
	('Exhil', 'Ezra', 20),
	('Raksha', 'Grant', 20);

INSERT INTO table_2
	(name, city, age)
VALUES
	('Prahan', 'New Delhi', 19),
	('Kiruthi', 'Kingston', 19),
	('Nemi', 'Glassgow', 19),
	('Kavitha', 'Paris', 20),
	('Ramya', 'Chennai', 20);

-- QUERIES
SELECT * FROM table_1;
SELECT * FROM table_2;

-- Question 48
-- Display Student Indian name and City if the Id is same.
-- (Use Inner Join)
SELECT 
	t1.indian_name 'Indian Name',
	t2.city 'City Name'
FROM table_1 t1
	INNER JOIN table_2 t2 ON t1.id = t2.id
	AND t1.indian_name = t2.name

-- Question 49
-- Display Student Jamaican name and City if the Id is same.
-- (Use Left Inner Join)
SELECT
	t1.jamaican_name 'Jamaican Name',
	t2.city 'City Name'
FROM table_1 t1
	LEFT JOIN table_2 t2 ON t1.id = t2.id
	AND t1.indian_name = t2.name

-- Question 50 
-- Display Student Indian name, Jamaican Name and City if the Id is not same. 
-- (Use Right Inner Join)
SELECT
	t1.indian_name 'Indian Name',
	t1.jamaican_name 'Jamaican Name',
	t2.city 'City Name'
FROM table_1 t1
	RIGHT JOIN table_2 t2 ON t1.id <> t2.id
	AND t1.indian_name = t2.name

-- Question 51
-- Display Student Jamaican Name, age and City if the age is same.
-- (Use Right Inner Join)
SELECT
	t1.jamaican_name 'Jamaican Name',
	t2.age 'Age',
	t2.city 'City Name'
FROM table_1 t1
	RIGHT JOIN table_2 t2 ON t1.age = t2.age
	AND t1.indian_name = t2.name

-- Question 52
-- Display Student Jamaican Name, age and City if the age is not same.
-- (Use Left Inner Join)
SELECT
	t1.jamaican_name 'Jamaican Name',
	t1.age 'Age',
	t2.city 'City Name'
FROM table_1 t1
	LEFT JOIN table_2 t2 ON t1.age <> t2.age
	AND t1.indian_name = t2.name

-- Question 53 
-- Write a Query which can be implemented using : 
-- Outer Join and Full join using the table_1 and table_2
SELECT * 
FROM table_1 t1
	FULL OUTER JOIN table_2 t2 ON t1.id = t2.id
	AND t1.indian_name = t2.name
