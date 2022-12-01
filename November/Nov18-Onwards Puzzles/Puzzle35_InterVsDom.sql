USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS InterDomSales;
CREATE TABLE InterDomSales
(
    Invoice_ID VARCHAR(25),
    Sales_Rep_ID INT,
    Amount VARCHAR(25),
    Sales_Type VARCHAR(25)
);
INSERT INTO InterDomSales
VALUES
    ('Inv345756', 1001, '$13,454', 'International');
INSERT INTO InterDomSales
VALUES
    ('Inv546744', 2002, '$3,434', 'International');
INSERT INTO InterDomSales
VALUES
    ('Inv345756', 4004, '$54,645', 'International');
INSERT INTO InterDomSales
VALUES
    ('Inv895745', 5005, '$234,345', 'International');
-- INSERT INTO InterDomSales VALUES ('Inv006321', 7007, '$776', 'International');
INSERT INTO InterDomSales
VALUES
    ('Inv734534', 1001, '$4,564', 'Domestic');
INSERT INTO InterDomSales
VALUES
    ('Inv600213', 2002, '$34,534', 'Domestic');
INSERT INTO InterDomSales
VALUES
    ('Inv757853', 3003, '$345', 'Domestic');
INSERT INTO InterDomSales
VALUES
    ('Inv198632', 6006, '$6,543', 'Domestic');
-- INSERT INTO InterDomSales VALUES ('Inv977654', 8008, '$67', 'Domestic');

-- Queries
SELECT *
FROM InterDomSales;

-- Write an SQL statement that shows all sales representatives who either had a domestic sale or an 
-- international sale, but not both
SELECT Sales_Rep_ID
FROM InterDomSales
GROUP BY Sales_Rep_ID
HAVING COUNT(DISTINCT Sales_Type) = 1;
