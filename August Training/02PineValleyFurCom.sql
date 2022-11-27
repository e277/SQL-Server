-- 
-- 
-- query to create a database if it doesn't exist
CREATE DATABASE "02PineValleyFurCom";
USE "02PineValleyFurCom";

CREATE TABLE Customer_T
(
    CustomerID INTEGER NOT NULL,
    CustomerName VARCHAR(40) NOT NULL,
    CustomerAddress VARCHAR(40) NOT NULL,
    CustomerCity VARCHAR(20) NOT NULL,
    CustomerState VARCHAR(20) NOT NULL,
    CustomerZip VARCHAR(5) NOT NULL,
    CONSTRAINT CustomerPK PRIMARY KEY (CustomerID)
);

CREATE TABLE Order_T
(
    OrderID INTEGER NOT NULL,
    OrderDate DATE NOT NULL,
    CustomerID INTEGER NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    CONSTRAINT OrderPK PRIMARY KEY (OrderID),
    CONSTRAINT OrderFK FOREIGN KEY (CustomerID) REFERENCES Customer_T (CustomerID)
);

CREATE TABLE Product_T
(
    ProductID INTEGER NOT NULL,
    ProductName VARCHAR(40) NOT NULL,
    ProductDescription VARCHAR(40) NOT NULL,
    ProductFinish VARCHAR(20) NOT NULL CHECK(ProductFinish IN ('Cherry', 'Natural Ash', 'White Ash', 'Red Oak', 'Natural Oak', 'Walnut')),
    ProductStandardPrice DECIMAL(10,2) NOT NULL,
    CONSTRAINT ProductPK PRIMARY KEY (ProductID)
);

CREATE TABLE OrderLine_T
(
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    OrderQuantity INTEGER NOT NULL,
    CONSTRAINT OrderLinePK PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT OrderLineFK FOREIGN KEY (OrderID) REFERENCES Order_T (OrderID),
    CONSTRAINT OrderLineFK2 FOREIGN KEY (ProductID) REFERENCES Product_T (ProductID)
);

-- insert data
INSERT INTO Customer_T
    (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerZip)
VALUES
    (1, 'John Smith', '123 Main St', 'New York', 'NY', '10001');
INSERT INTO Customer_T
    (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerZip)
VALUES
    (2, 'Jane Doe', '456 Main St', 'New York', 'NY', '10001');
INSERT INTO Customer_T
    (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerZip)
VALUES
    (3, 'Joe Bloggs', '789 Main St', 'New York', 'NY', '10001');
INSERT INTO Customer_T
    (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerZip)
VALUES
    (4, 'John Smith', '123 Main St', 'New York', 'NY', '10001');
INSERT INTO Customer_T
    (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerZip)
VALUES
    (5, 'Jane Doe', '456 Main St', 'New York', 'NY', '10001');

iNSERT INTO Order_T
    (OrderID, OrderDate, CustomerID, OrderStatus)
VALUES
    (1, '2016-01-01', 1, 'Pending');
iNSERT INTO Order_T
    (OrderID, OrderDate, CustomerID, OrderStatus)
VALUES
    (2, '2016-01-02', 2, 'Pending');
iNSERT INTO Order_T
    (OrderID, OrderDate, CustomerID, OrderStatus)
VALUES
    (3, '2016-01-03', 3, 'Pending');
iNSERT INTO Order_T
    (OrderID, OrderDate, CustomerID, OrderStatus)
VALUES
    (4, '2016-01-04', 4, 'Pending');
iNSERT INTO Order_T
    (OrderID, OrderDate, CustomerID, OrderStatus)
VALUES
    (5, '2016-01-05', 5, 'Pending');

INSERT INTO Product_T
    (ProductID, ProductName, ProductDescription, ProductFinish, ProductStandardPrice)
VALUES
    (1, 'Pineapple', 'A pineapple', 'Cherry', 1.00);
INSERT INTO Product_T
    (ProductID, ProductName, ProductDescription, ProductFinish, ProductStandardPrice)
VALUES
    (2, 'Pineapple', 'A pineapple', 'Cherry', 1.00);
INSERT INTO Product_T
    (ProductID, ProductName, ProductDescription, ProductFinish, ProductStandardPrice)
VALUES
    (3, 'Pineapple', 'A pineapple', 'Cherry', 1.00);
INSERT INTO Product_T
    (ProductID, ProductName, ProductDescription, ProductFinish, ProductStandardPrice)
VALUES
    (4, 'Pineapple', 'A pineapple', 'Cherry', 1.00);
INSERT INTO Product_T
    (ProductID, ProductName, ProductDescription, ProductFinish, ProductStandardPrice)
VALUES
    (5, 'Pineapple', 'A pineapple', 'Cherry', 1.00);

INSERT INTO OrderLine_T
    (OrderID, ProductID, OrderQuantity)
VALUES
    (1, 1, 1);
INSERT INTO OrderLine_T
    (OrderID, ProductID, OrderQuantity)
VALUES
    (1, 2, 1);
INSERT INTO OrderLine_T
    (OrderID, ProductID, OrderQuantity)
VALUES
    (1, 3, 1);
INSERT INTO OrderLine_T
    (OrderID, ProductID, OrderQuantity)
VALUES
    (1, 4, 1);
INSERT INTO OrderLine_T
    (OrderID, ProductID, OrderQuantity)
VALUES
    (1, 5, 1);
