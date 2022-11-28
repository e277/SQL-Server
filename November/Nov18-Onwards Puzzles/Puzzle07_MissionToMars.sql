USE SQL_Puzzles_DB

DROP TABLE IF EXISTS MsMars;
CREATE TABLE MsMars (
	Candidate_ID INT,
	Description VARCHAR(25)
)
INSERT INTO MsMars VALUES (1001, 'Geologist');
INSERT INTO MsMars VALUES (1001, 'Astrogator');
INSERT INTO MsMars VALUES (1001, 'Biochemist');
INSERT INTO MsMars VALUES (1001, 'Technician');
INSERT INTO MsMars VALUES (2002, 'Surgeon');
INSERT INTO MsMars VALUES (2002, 'Machinist');
INSERT INTO MsMars VALUES (2002, 'Geologist');
INSERT INTO MsMars VALUES (3003, 'Geologist');
INSERT INTO MsMars VALUES (3003, 'Astrogator');
INSERT INTO MsMars VALUES (4004, 'Selenogist');

--Queries
SELECT * FROM MsMars;

SELECT Candidate_ID FROM MsMars WHERE Description LIKE '%Geologist%'
INTERSECT
SELECT Candidate_ID FROM MsMars WHERE Description LIKE '%Astrogator%'
INTERSECT
SELECT Candidate_ID FROM MsMars WHERE Description LIKE '%Technician%'