USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS PayRates;
CREATE TABLE PayRates
(
    EmployeeID INT IDENTITY PRIMARY KEY NOT NULL,
    FiscalYear INT NOT NULL,
    StartDate DATE CHECK (StartDate >= '1/1/2018' AND StartDate <= '12/31/2018'),
    EndDate DATE CHECK (EndDate >= '1/1/2018' AND EndDate <= '12/31/2018'),
    -- assume no pay rate is given mid year
    PayRate MONEY NOT NULL CHECK (PayRate > 0)
);