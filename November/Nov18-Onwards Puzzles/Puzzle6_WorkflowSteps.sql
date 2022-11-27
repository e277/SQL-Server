USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS WorkflwS;
CREATE TABLE WorkflwS (
	Workflow VARCHAR(25),
	Step_Number INT,
	Completion_Date VARCHAR(25)
)
INSERT INTO WorkflwS(Workflow, Step_Number, Completion_Date) VALUES('Alpha', 1, '7/2/2018');
INSERT INTO WorkflwS(Workflow, Step_Number, Completion_Date) VALUES('Alpha', 2, '7/2/2018');
INSERT INTO WorkflwS(Workflow, Step_Number, Completion_Date) VALUES('Alpha', 3, '7/1/2018');
INSERT INTO WorkflwS(Workflow, Step_Number, Completion_Date) VALUES('Bravo', 1, '6/25/2018');
INSERT INTO WorkflwS(Workflow, Step_Number) VALUES('Bravo', 2);
INSERT INTO WorkflwS(Workflow, Step_Number, Completion_Date) VALUES('Bravo', 3, '6/27/2018');
INSERT INTO WorkflwS(Workflow, Step_Number) VALUES('Charlie', 1);
INSERT INTO WorkflwS(Workflow, Step_Number, Completion_Date) VALUES('Charlie', 2, '7/1/2018');

--Queries
SELECT * FROM WorkflwS;

SELECT Workflow
FROM WorkflwS
GROUP BY Workflow
HAVING COUNT(Workflow) <> COUNT(Completion_Date)
