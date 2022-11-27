USE HelloWorld;

DROP TABLE IF EXISTS Employee_trigtable;
CREATE TABLE Employee_trigtable (    
	id int IDENTITY,   
	trigger_event text   
)

CREATE TRIGGER Emp_tri_Ins_table
ON Employee_2 
FOR INSERT  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_trigtable
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
END

INSERT INTO Employee_2 VALUES (1,'Ezra','Maryland',6,'Data Engineering','Male', '2022-09-15')
--New employee with Id =1 is added at <>

CREATE TRIGGER Emp_tri_Del_table
ON Employee_2 
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from deleted  
  INSERT INTO Employee_trigtable
  VALUES ('Employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

DELETE FROM Employee_2 WHERE Id = 2; 
--Employee with Id =2 is deleted at <>


--Testing
SELECT * FROM Employee_2;
SELECt * FROM Employee_trigtable;


-- Disabling Triggers
DISABLE TRIGGER Employee_2.Emp_tri_Del_table
ON Employee_2;

-- Enabling Triggers
ENABLE TRIGGER Employee_2.Emp_tri_Del_table
ON Employee_2;




-- Exercise - Triggers
DROP TABLE IF EXISTS Employee_personal_audits;
CREATE TABLE Employee_personal_audits (
	change_id INT IDENTITY(1,1) PRIMARY KEY,
	EMPID INT NOT NULL,
	name VARCHAR(25) NOT NULL,
	Grade CHAR(1),
	action_performed VARCHAR(25) NOT NULL,
	CHECK(action_performed='INSERT' OR action_performed='DELETE')
);

-- Trigger
CREATE TRIGGER trg_emp_personal_audit
ON Employee_personal
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Employee_personal_audits (
		EMPID
		,name
		,Grade
		,action_performed
	)
	SELECT
		i.EMPID
		,name
		,Grade
		,'INSERT'
	FROM
		inserted i
	UNION ALL
	-- delete
	SELECT
		d.EMPID
		,name
		,Grade
		,'DELETE'
	FROM
		deleted d
END

CREATE TRIGGER trg_emp_personal_audit_upt
ON Employee_personal
FOR UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	-- update
	UPDATE Employee_personal_audits
	SET Grade = 'A'
	FROM Employee_personal_audits epa
		INNER JOIN inserted i ON epa.EMPID = i.EMPID
END

-- Testing
INSERT INTO Employee_personal
	(EMPID, NAME,PLACE,GENDER,AVAILABLE,PHNO,DEPARTMENT,Rank,Grade,Project_Platform)
VALUES
	(9,'Test','Place_1','male','no','6546','eng',1,'a','sql');

DELETE FROM Employee_personal
WHERE EMPID = 9;

UPDATE Employee_personal
SET Grade = 'A'
WHERE EMPID = 9;


SELECT * FROM Employee_personal;
SELECT * FROM Employee_personal_audits;

