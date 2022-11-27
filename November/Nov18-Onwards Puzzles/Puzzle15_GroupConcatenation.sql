USE SQL_Puzzles_DB

DROP TABLE IF EXISTS GrpCon;
CREATE TABLE GrpCon (
	Sequence INT,
	Syntax VARCHAR(25)
)
INSERT INTO GrpCon VALUES (1, 'SELECT');
INSERT INTO GrpCon VALUES (2, 'Product,');
INSERT INTO GrpCon VALUES (3, 'UnitPrice,');
INSERT INTO GrpCon VALUES (4, 'EffectiveDate');
INSERT INTO GrpCon VALUES (5, 'FROM');
INSERT INTO GrpCon VALUES (6, 'Products');
INSERT INTO GrpCon VALUES (7, 'WHERE');
INSERT INTO GrpCon VALUES (8, 'UnitPrice');
INSERT INTO GrpCon VALUES (9, '> 100');

--Queries
SELECT * FROM GrpCon;

SELECT CONCAT_WS(' ', 
	'SELECT',
	'Product,', 
	'UnitPrice,',
	'EffectiveDate',
	'FROM',
	'Products',
	'WHERE',
	'UnitPrice',
	'> 100') AS Syntax