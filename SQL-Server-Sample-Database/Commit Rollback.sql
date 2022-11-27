USE BikeStores;

CREATE TABLE invoices (
  id int IDENTITY PRIMARY KEY,
  customer_id int NOT NULL,
  total decimal(10, 2) NOT NULL DEFAULT 0 CHECK (total >= 0)
);

CREATE TABLE invoice_items (
  id int,
  invoice_id int NOT NULL,
  item_name varchar(100) NOT NULL,
  amount decimal(10, 2) NOT NULL CHECK (amount >= 0),
  tax decimal(4, 2) NOT NULL CHECK (tax >= 0),
  PRIMARY KEY (id, invoice_id),
  FOREIGN KEY (invoice_id) REFERENCES invoices (id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

SELECT * FROM invoices; SELECT * FROM invoice_items;

-- COMMIT AND ROLLBACK
BEGIN TRANSACTION;

INSERT INTO
	invoices (customer_id, total)
VALUES
	(100, 0);
	SAVE TRANSACTION first_insert
INSERT INTO
	invoice_items (id, invoice_id, item_name, amount, tax)
VALUES
	(10, 1, 'Keyboard', 70, 0.00),
	(20, 1, 'Mouse', 50, 0.00);

UPDATE invoices
SET total = (SELECT SUM(amount * (1 + tax))
FROM invoice_items
WHERE invoice_id = 1);

COMMIT;
