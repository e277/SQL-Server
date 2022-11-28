USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Future;
CREATE TABLE future
(
    Start_Date VARCHAR(25),
    End_Date VARCHAR(25)
);
INSERT INTO Future
VALUES
    ('1/15/2018', '1/19/2018');
INSERT INTO Future
VALUES
    ('1/12/2018', '1/16/2018');
INSERT INTO Future
VALUES
    ('1/10/2018', '1/11/2018');
INSERT INTO Future
VALUES
    ('1/3/2018', '1/9/2018');
INSERT INTO Future
VALUES
    ('1/1/2018', '1/5/2018');

-- Queries
SELECT *
FROM Future;


-- solve using declarative approach to get the following output:
-- Start_Date	End_Date
-- 1/12/2018 1/19/2018
-- 1/10/2018 1/11/2018
-- 1/1/2018 1/9/2018

