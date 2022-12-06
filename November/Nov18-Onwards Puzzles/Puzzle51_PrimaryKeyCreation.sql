USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PriKeyCreation;
CREATE TABLE PriKeyCreation
(
    Assembly_ID INT,
    Part NVARCHAR(25)
);
INSERT INTO PriKeyCreation
VALUES
    (1001, 'Bolt');
INSERT INTO PriKeyCreation
VALUES
    (1001, 'Screw');
INSERT INTO PriKeyCreation
VALUES
    (2002, 'Nut');
INSERT INTO PriKeyCreation
VALUES
    (2002, 'Washer');
INSERT INTO PriKeyCreation
VALUES
    (3003, 'Toggle');
INSERT INTO PriKeyCreation
VALUES
    (3003, 'Bolt');

-- Queries
SELECT *
FROM PriKeyCreation;


-- SELECT HASHBYTES('SHA2_512', Assembly_ID) FROM PriKeyCreation;
SELECT
    *
    , CHECKSUM(Part) AS [CHECKSUM]
    , HASHBYTES('SHA2_512', Part) AS [HASHBYTES]
FROM PriKeyCreation;
