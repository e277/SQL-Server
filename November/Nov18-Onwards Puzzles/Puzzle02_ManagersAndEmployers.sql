USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Mngs_Emps;
CREATE TABLE Mngs_Emps (
	Employee_ID INT,
	Manager_ID INT,
	Job_Title VARCHAR(25),
	Salary VARCHAR(25)
)
INSERT INTO Mngs_Emps
	(Employee_ID, Manager_ID, Job_Title, Salary)
VALUES
	(1001, NULL, 'President', '$185,000'),
	(2002, 1001, 'Director', '$120,000'),
	(3003, 1001, 'Office Manager', '$97,000'),
	(4004, 2002, 'Engineer', '$110,000'),
	(5005, 2002, 'Engineer', '$142,000'),
	(6006, 2002, 'Engineer', '$160,000'),
	--For Testing
	(7007, 5005, 'Teacher', '$160,000');

--Queries
SELECT * FROM Mngs_Emps;

SELECT 
	*,
	DENSE_RANK() OVER (ORDER BY Manager_ID)
	-
	SUM(CASE
			WHEN Manager_ID IS NULL THEN 1
			ELSE 0 END
	) OVER (ORDER BY Employee_ID) Depth 
FROM 
	Mngs_Emps

