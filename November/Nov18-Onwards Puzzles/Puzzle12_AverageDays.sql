USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS AvgDays;
CREATE TABLE AvgDays (
	Workflow VARCHAR(25),
	Execution_Date VARCHAR(25)
)
INSERT INTO AvgDays VALUES ('Alpha', '6/1/2018');
INSERT INTO AvgDays VALUES ('Alpha', '6/14/2018');
INSERT INTO AvgDays VALUES ('Alpha', '6/15/2018');
INSERT INTO AvgDays VALUES ('Bravo', '6/1/2018');
INSERT INTO AvgDays VALUES ('Bravo', '6/2/2018');
INSERT INTO AvgDays VALUES ('Bravo', '6/19/2018');
INSERT INTO AvgDays VALUES ('Charlie', '6/1/2018');
INSERT INTO AvgDays VALUES ('Charlie', '6/15/2018');
INSERT INTO AvgDays VALUES ('Charlie', '6/30/2018');

--Queries
SELECT * FROM AvgDays;

SELECT Workflow,DATEDIFF(DAY,'6/1/2018','6/15/2018')/2 "Average Days" FROM AvgDays WHERE Workflow='Alpha' 
	UNION
SELECT Workflow,DATEDIFF(DAY,'6/1/2018','6/19/2018')/2 "Average Days" FROM AvgDays WHERE Workflow='Bravo'
	UNION
SELECT Workflow,ROUND(DATEDIFF(DAY,'6/1/2018','6/30/2018'),0)/2 "Average Days" FROM AvgDays WHERE Workflow='Charlie'