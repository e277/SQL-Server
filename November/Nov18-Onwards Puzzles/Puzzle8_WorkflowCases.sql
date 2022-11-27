USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS WrkCs;
CREATE TABLE WrkCs (
	Workflow VARCHAR(25),
	Case1 INT,
	Case2 INT,
	Case3 INT
);
INSERT INTO WrkCs VALUES ('Alpha', 0, 0, 0);
INSERT INTO WrkCs VALUES ('Bravo', 0, 1, 1);
INSERT INTO WrkCs VALUES ('Charlie', 1, 0, 0);
INSERT INTO WrkCs VALUES ('Delta', 0, 0, 0);

--Queries
SELECT * FROM WrkCs;

SELECT Workflow, (Case1 + Case2 + Case3) AS Passed
FROM WrkCs