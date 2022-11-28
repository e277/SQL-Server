USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PrPts;
CREATE TABLE PrPts
(
    Product_ID INT,
    Effective_Date VARCHAR(25),
    Unit_Price VARCHAR(25)
);
INSERT INTO PrPts
VALUES
    (1001, '1/1/2018', '$1.99');
INSERT INTO PrPts
VALUES
    (1001, '5/17/2018', '$2.99');
INSERT INTO PrPts
VALUES
    (1001, '6/14/2018', '$3.99');
INSERT INTO PrPts
VALUES
    (2002, '2/12/2018', '$12.99');
INSERT INTO PrPts
VALUES
    (2002, '3/1/2018', '$17.99');
INSERT INTO PrPts
VALUES
    (2002, '4/19/2018', '$20.99');

-- Queries
SELECT *
FROM PrPts;

-- assign Unit_Price to be '$3.99' for effective date between '6/1/2018' and '6/30/2018'
-- assign Unit_Price to be '$2.99' for effective date between '5/1/2018' and '5/31/2018'
-- print out the price points for each Product_ID for date '6/8/2018', Unit_Price should be '$3.99'
-- print out the price points for each Product_ID for date '5/19/2018' Unit_Price should be '$2.99'
WITH
    CTE
    AS
    (
                            SELECT Product_ID, Effective_Date, Unit_Price,
                CASE
            WHEN Effective_Date BETWEEN '6/1/2018' AND '6/30/2018' THEN '$3.99'
            WHEN Effective_Date BETWEEN '5/1/2018' AND '5/31/2018' THEN '$2.99'
            ELSE Unit_Price
        END AS New_Unit_Price
            FROM PrPts
        UNION
            SELECT Product_ID, '6/8/2018', NULL, '$3.99'
            FROM PrPts
        UNION
            SELECT Product_ID, '5/19/2018', NULL, '$2.99'
            FROM PrPts
    )
-- remove where the Effective_Date='5/19/2018' for Product_ID=1001 and Effective_Date='6/8/2018' for Product_ID=2002
SELECT Product_ID, Effective_Date, New_Unit_Price
FROM CTE
WHERE (Product_ID=1001 AND Effective_Date='6/8/2018') OR (Product_ID=2002 AND Effective_Date='5/19/2018')
ORDER BY Product_ID, Effective_Date;
