USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS IntProLog;
CREATE TABLE IntProLog
(
	Workflow VARCHAR(25),
	Step_Number INT,
	Status VARCHAR(25)
);
INSERT INTO IntProLog
VALUES
	('Alpha', 1, 'Error');
INSERT INTO IntProLog
VALUES
	('Alpha', 2, 'Complete');
INSERT INTO IntProLog
VALUES
	('Alpha', 3, 'Running');
INSERT INTO IntProLog
VALUES
	('Bravo', 1, 'Complete');
INSERT INTO IntProLog
VALUES
	('Bravo', 2, 'Complete');
INSERT INTO IntProLog
VALUES
	('Charlie', 1, 'Running');
INSERT INTO IntProLog
VALUES
	('Charlie', 2, 'Running');
INSERT INTO IntProLog
VALUES
	('Delta', 1, 'Error');
INSERT INTO IntProLog
VALUES
	('Delta', 2, 'Error');
INSERT INTO IntProLog
VALUES
	('Echo', 1, 'Running');
INSERT INTO IntProLog
VALUES
	('Echo', 2, 'Complete');

--Queries
SELECT *
FROM IntProLog;

-- Workflow Status
-- Alpha Indeterminate
-- Bravo Complete
-- Charlie Running
-- Delta Error
-- Echo Running

-- Soln 1
WITH
	PROCESS_LOG
	AS
	(
		SELECT
			Workflow,
			Step_Number,
			Status
		FROM IntProLog
	)

SELECT Workflow, Status
FROM (
	SELECT Workflow,
		CASE WHEN Status='Error'
			AND COUNT(rnk) OVER (PARTITION BY Workflow) > 2
			THEN 'Indetermine' ELSE Status END Status,
		rnk

	FROM (
		SELECT Workflow, Step_Number, Status,
			DENSE_RANK() OVER (
			PARTITION BY Workflow ORDER BY 
				CASE WHEN Status='Error' THEN 1 
				WHEN Status='Running' THEN 2
				WHEN Status='Complete' THEN 3 END, Step_Number
			) rnk
		FROM PROCESS_LOG
	) AS T
) AS T2
WHERE rnk = 1









