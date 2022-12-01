USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS GrCrKeys;
CREATE TABLE GrCrKeys
(
    Order_ID VARCHAR(25),
    Distributor VARCHAR(25),
    Facility INT,
    Zone VARCHAR(25),
    Amount VARCHAR(25)
);
INsERT INTO GrCrKeys
VALUES
    ('Ord156795', 'ACME', 123, 'ABC', '$100');
INsERT INTO GrCrKeys
VALUES
    ('Ord826109', 'ACME', 123, 'ABC', '$75');
INsERT INTO GrCrKeys
VALUES
    ('Ord342876', 'Direct Parts', 789, 'XYZ', '$150');
INsERT INTO GrCrKeys
VALUES
    ('Ord994981', 'Direct Parts', 789, 'XYZ', '$125');

-- -- Queries
SELECT *
FROM GrCrKeys;

-- Write an SQL statement that provides a key based upon the distinct combination of distributor, facility, 
-- and zone
WITH
    CTE
    AS
    (
        SELECT Order_ID, Distributor, Facility, Zone, Amount,
            DENSE_RANK() OVER (ORDER BY Distributor, Facility, Zone) AS [Criteria ID]
        FROM GrCrKeys
    )
SELECT [Criteria ID], Order_ID, Distributor, Facility, Zone, Amount
FROM CTE

