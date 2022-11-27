CREATE SCHEMA hr;
GO

USE HelloWorld;

DROP TABLE IF EXISTS hr.candidates;
DROP TABLE IF EXISTS hr.employees;

CREATE TABLE hr.candidates(
	id INT PRIMARY KEY IDENTITY(1,1),
	fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
	id INT PRIMARY KEY IDENTITY(1,1),
	fullname VARCHAR(100) NOT NULL
);
-- left table
INSERT INTO
	hr.candidates(fullname)
VALUES
	('Ezra Muir'),
	('Camille Newman'),
	('Peter Tosh'),
	('Jane Foster');
-- right table
INSERT INTO
	hr.employees(fullname)
VALUES
	('Camille Newman'),
    ('Jane Doe'),
    ('Ezra Muir'),
    ('Jack Sparrow');

SELECT * FROM hr.candidates;
SELECT * FROM hr.employees;
-- INNER JOIN
SELECT
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM
	hr.candidates c
	INNER JOIN hr.employees e
	ON e.fullname = c.fullname;

