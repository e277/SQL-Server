USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Item1;
CREATE TABLE Item1 (
	--id INT IDENTITY(1,1),
	item VARCHAR(25)
)
INSERT INTO Item1 VALUES('Sugar'), ('Bread'), ('Juice'), ('Soda'), ('Flour');

DROP TABLE IF EXISTS Item2;
CREATE TABLE Item2 (
	--id INT IDENTITY(1,1),
	item VARCHAR(25)
)
INSERT INTO Item2 VALUES ('Sugar'), ('Bread'), ('Butter'), ('Cheese'), ('Fruit');

--Queries
SELECT * FROM Item1;
SELECT * FROM Item2;

SELECT *
FROM Item1 i1
	FULL OUTER JOIN Item2 i2
	ON i2.item = i1.item