USE HelloWorld;

CREATE TABLE Members
(
	memberID INT NOT NULL PRIMARY KEY,
	firstName VARCHAR(255) NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	clubName VARCHAR(255),
	-- set clubID to foreign key
	clubID INT NOT NULL,
	FOREIGN KEY (clubID) REFERENCES Clubs(clubID)
);

CREATE TABLE Clubs
(
	clubID INT NOT NULL PRIMARY KEY
);

INSERT INTO Members
	(memberID, firstName, lastName, clubName)
VALUES
	(001, 'Ezra', 'Muir', 'Environ');

SELECT *
FROM Members;