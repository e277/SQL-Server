USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PhneNums;
CREATE TABLE PhneNums
(
    Customer_ID INT PRIMARY KEY NOT NULL,
    Phone_Number NVARCHAR(25)
        CHECK (
            Phone_Number 
            NOT LIKE '^([0-9]{3})-[^0-9]{3}-[^0-9]{4}'
        )
);
-- insert some data based on the Check constraint
INSERT INTO PhneNums
VALUES
    (1, '(123)-456-7890');
INSERT INTO PhneNums
VALUES
    (2, '(123)-456-7890');
INSERT INTO PhneNums
VALUES
    (3, '123-456-7890');

-- Queries
SELECT *
FROM PhneNums;