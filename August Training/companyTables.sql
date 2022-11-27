USE PersonalCompany;

-- DROP ALL TABLES
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS business;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS company_type;
DROP TABLE IF EXISTS human;
DROP TABLE IF EXISTS gender;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS phone;
DROP TABLE IF EXISTS image;
DROP TABLE IF EXISTS user_tb;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS profile;

-- create table profile if it does not exist for sql server
-- Country Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'country')
BEGIN
	CREATE TABLE country
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
	);
END;

-- Region Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'region')
BEGIN
	CREATE TABLE region
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
		country_id INT NOT NULL,
		FOREIGN KEY (country_id) REFERENCES country(id)
	);
END;


-- Location Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'location')
BEGIN
	CREATE TABLE location
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
		region_id INT NOT NULL,
		FOREIGN KEY (region_id) REFERENCES region(id)
	);
END;

-- Address Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'address')
BEGIN
	CREATE TABLE address
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		location_id INT NOT NULL UNIQUE,
		FOREIGN KEY (location_id) REFERENCES location(id),
		additional VARCHAR(255) NOT NULL,
	);
END;

-- Profile Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'profile')
BEGIN
	CREATE TABLE profile
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		address_id INT NOT NULL,
		FOREIGN KEY (address_id) REFERENCES address(id)
	);
END;

-- User Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'user_tb')
BEGIN
	CREATE TABLE user_tb
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		email VARCHAR(25) NOT NULL,
		profile_id INT NOT NULL,
		FOREIGN KEY(profile_id) REFERENCES profile(id)
	);
END;

-- Image Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'image')
BEGIN
	CREATE TABLE image
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		image_url VARCHAR(255) NOT NULL,
		is_main BIT NOT NULL,
		profile_id INT NOT NULL,
		FOREIGN KEY (profile_id) REFERENCES profile(id)
	);
END;

-- Phone Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'phone')
BEGIN
	CREATE TABLE phone
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		number VARCHAR(255) NOT NULL,
		type VARCHAR(255) NOT NULL,
		is_main BIT NOT NULL,
		profile_id INT NOT NULL,
		FOREIGN KEY (profile_id) REFERENCES profile(id)
	);
END;

-- Gender Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'gender')
BEGIN
	CREATE TABLE gender
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
	);
END;

-- Human Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'human')
BEGIN
	CREATE TABLE human
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		profile_id INT NOT NULL,
		FOREIGN KEY (profile_id) REFERENCES profile(id),
		age INT NOT NULL,
		gender_id INT NOT NULL,
		FOREIGN KEY(gender_id) REFERENCES gender(id)
	);
END;

-- Company_Type Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'company_type')
BEGIN
	CREATE TABLE company_type
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
	);
END;

-- Company Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'company')
BEGIN
	CREATE TABLE company
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		profile_id INT NOT NULL,
		FOREIGN KEY (profile_id) REFERENCES profile(id),
		company_type_id INT NOT NULL,
		FOREIGN KEY (company_type_id) REFERENCES company_type(id)
	);
END;

-- Business Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'business')
BEGIN
	CREATE TABLE business
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		type VARCHAR(255) NOT NULL,
		-- type of business, should be ENUM type
		company_id INT NOT NULL,
		FOREIGN KEY
		(company_id) REFERENCES company
		(id),
		schedule VARCHAR
		(255) NOT NULL,
		pricing VARCHAR
		(255) NOT NULL,
	);
END;

-- Employee Table
IF NOT EXISTS (SELECT *
FROM sys.Tables
WHERE name = 'employee')
BEGIN
	CREATE TABLE employee
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		human_id INT NOT NULL,
		FOREIGN KEY (human_id) REFERENCES company(id),
		company_id INT NOT NULL,
		FOREIGN KEY (company_id) REFERENCES profile(id),
	);
END;



-- INSERT DUMMY DATA INTO TABLES
-- insert random data into country table
TRUNCATE TABLE country;
insert into country
	(name)
values
	('Russia'),
	('USA'),
	('Germany'),
	('France'),
	('Italy'),
	('Spain'),
	('China'),
	('Japan'),
	('Australia'),
	('Canada'),
	('New Zealand'),
	('Switzerland'),
	('Austria'),
	('Belgium'),
	('Denmark');

-- insert random data into region table
TRUNCATE TABLE region;
insert into region
	(name, country_id)
values
	('Moscow', 1),
	('New York', 2),
	('Berlin', 3),
	('Paris', 4),
	('Rome', 5),
	('Beijing', 6),
	('Tokyo', 7),
	('Sydney', 8),
	('Melbourne', 9),
	('Canberra', 10),
	('Vienna', 11),
	('Brussels', 12),
	('London', 13),
	('Amsterdam', 14),
	('Hamburg', 15);

-- insert random data into location table
TRUNCATE TABLE location;
insert into location
	(name, region_id)
values
	('Moscow', 1),
	('Saint Petersburg', 2),
	('New York', 3),
	('Berlin', 4),
	('Paris', 5),
	('Rome', 6),
	('Beijing', 7),
	('Tokyo', 8),
	('Sydney', 9),
	('Melbourne', 10),
	('Canberra', 11),
	('Vienna', 12),
	('Brussels', 13),
	('London', 14),
	('Amsterdam', 15);

-- insert random data into address table
TRUNCATE TABLE address;
insert into address
	(location_id, additional)
values
	(1, 'Moscow'),
	(2, 'Saint Petersburg'),
	(3, 'New York'),
	(4, 'Berlin'),
	(5, 'New York'),
	(6, 'Elsavador'),
	(7, 'Moscow'),
	(8, 'Saint Petersburg'),
	(9, 'New York'),
	(10, 'Berlin'),
	(11, 'New York'),
	(12, 'Pinland'),
	(13, 'Germany'),
	(14, 'Italy'),
	(15, 'Poland');

-- insert random data into profile table
TRUNCATE TABLE profile;
insert into profile
	(name, address_id)
values
	('John Doe', 1),
	('Jane Doe', 2),
	('John Smith', 3),
	('Jane Smith', 4),
	('Ezra Smith', 5),
	('Ezra Doe', 6),
	('Emma Ava', 7),
	('Isabella Brown', 8),
	('William Willis', 9),
	('Mia Henry', 10),
	('James Bar', 11),
	('Christine Douglas', 12),
	('Louis Muir', 13),
	('Sophia Johnson', 14),
	('Amelia Clarke', 15);

-- insert random data into user table
TRUNCATE TABLE user_tb;
insert into user_tb
	(email, profile_id)
values
	('johndoe@gmail.com', 1),
	('janedoe@yahoo.com', 2),
	('johnsmith@yahoo.com', 3),
	('janesmith@gmail.com', 4),
	('ezrasmith@yahoo.com', 5),
	('ezradoe@yahoo.com', 6),
	('emmaava@gmail.com', 7),
	('isabellabrown@gmail.com', 8),
	('williamwillis@gmail.com', 9),
	('miahenry@yahoo.com', 10),
	('jamesbar@gmail.com', 11),
	('christinedouglas@yahoo.com', 12),
	('louismuir@yahoo.com', 13),
	('sophiajohnson@gmail.com', 14),
	('ameliaclarke@gmail.com', 15);

-- insert random data into image table
TRUNCATE TABLE image;
insert into image
	(image_url, is_main, profile_id)
values
	('http://www.example.com/image1.jpg', 1, 1),
	('http://www.example.com/image2.jpg', 0, 2),
	('http://www.example.com/image3.jpg', 1, 3),
	('http://www.example.com/image4.jpg', 0, 4),
	('http://www.example.com/image5.jpg', 1, 5),
	('http://www.example.com/image6.jpg', 0, 6),
	('http://www.example.com/image7.jpg', 1, 7),
	('http://www.example.com/image8.jpg', 0, 8),
	('http://www.example.com/image9.jpg', 1, 9),
	('http://www.example.com/image10.jpg', 0, 10),
	('http://www.example.com/image11.jpg', 1, 11),
	('http://www.example.com/image12.jpg', 0, 12),
	('http://www.example.com/image13.jpg', 1, 13),
	('http://www.example.com/image14.jpg', 0, 14),
	('http://www.example.com/image15.jpg', 1, 15);

-- insert random data into phone table
TRUNCATE TABLE phone;
insert into phone
	(number, type, is_main, profile_id)
values
	('+79991234567', 'mobile', 1, 1),
	('+79991234568', 'home', 0, 2),
	('+79991234569', 'mobile', 1, 3),
	('+79991234570', 'home', 0, 4),
	('+79991234571', 'mobile', 1, 5),
	('+79991234572', 'home', 0, 6),
	('+79991234573', 'mobile', 1, 7),
	('+79991234574', 'home', 0, 8),
	('+79991234575', 'mobile', 1, 9),
	('+79991234576', 'home', 0, 10),
	('+79991234577', 'mobile', 1, 11),
	('+79991234578', 'home', 0, 12),
	('+79991234579', 'mobile', 1, 13),
	('+79991234580', 'home', 0, 14),
	('+79991234581', 'mobile', 1, 15);

-- insert random data into gender table
TRUNCATE TABLE gender;
insert into gender
	(name)
values
	('female'),
	('male'),
	('female'),
	('female'),
	('male'),
	('female'),
	('female'),
	('male'),
	('female'),
	('female'),
	('male'),
	('female'),
	('female'),
	('male'),
	('female');

-- insert random data into human table
TRUNCATE TABLE human;
INSERT INTO human
	(profile_id, age, gender_id)
VALUES
	(1, 25, 1),
	(2, 29, 2),
	(3, 45, 3),
	(4, 60, 4),
	(5, 34, 5),
	(6, 33, 6),
	(7, 26, 7),
	(8, 28, 8),
	(9, 17, 9),
	(10, 54, 10),
	(11, 38, 11),
	(12, 41, 12),
	(13, 21, 13),
	(14, 20, 14),
	(15, 45, 15);

-- insert random data into company_type table
TRUNCATE TABLE company_type;
insert INTO company_type
	(name)
VALUES
	('Corporation'),
	('Partnership'),
	('Sole Proprietor'),
	('Other'),
	('Corporation'),
	('Partnership'),
	('Sole Proprietor'),
	('Other'),
	('Corporation'),
	('Partnership'),
	('Sole Proprietor'),
	('Other'),
	('Corporation'),
	('Partnership'),
	('Sole Proprietor');

-- insert random data into company table
TRUNCATE TABLE company;
INSERT INTO company
	(profile_id, company_type_id)
VALUES
	(1, 15),
	(2, 14),
	(3, 13),
	(4, 12),
	(5, 11),
	(6, 10),
	(7, 9),
	(8, 8),
	(9, 7),
	(10, 6),
	(11, 5),
	(12, 4),
	(13, 3),
	(14, 2),
	(15, 1);

-- insert random data into business table
TRUNCATE TABLE business;
INSERT INTO business
	(type, company_id, schedule, pricing)
VALUES
	('Restaurant-A', 1, 'Mon-Fri', '$5-40'),
	('Restaurant-B', 2, 'Mon-Sat', '$10-30'),
	('Restaurant-C', 3, 'Mon-Fri', '$5-40'),
	('Restaurant-D', 4, 'Mon-Fri', '$10-30'),
	('Restaurant-E', 5, 'Mon-Fri', '$5-40'),
	('Restaurant-F', 6, 'Mon-Fri', '$10-30'),
	('Restaurant-G', 7, 'Mon-Fri', '$5-40'),
	('Restaurant-H', 8, 'Mon-Fri', '$10-30'),
	('Restaurant-I', 9, 'Mon-Fri', '$5-40'),
	('Restaurant-J', 10, 'Mon-Fri', '$10-30'),
	('Restaurant-K', 11, 'Mon-Fri', '$5-40'),
	('Restaurant-L', 12, 'Mon-Fri', '$10-30'),
	('Restaurant-M', 13, 'Mon-Fri', '$5-40'),
	('Restaurant-N', 14, 'Mon-Fri', '$10-30'),
	('Restaurant-O', 15, 'Mon-Fri', '$5-40');

-- insert random data into employee table
TRUNCATE TABLE employee;
INSERT INTO employee
	(human_id, company_id)
VALUES
	(1, 1),
	(2, 7),
	(3, 6),
	(4, 3),
	(5, 2),
	(6, 5),
	(7, 4),
	(8, 9),
	(9, 8),
	(10, 11),
	(11, 10),
	(12, 13),
	(13, 12),
	(14, 15),
	(15, 14);



-- QUERY FOR TESTING
SELECT *
FROM country;
SELECT *
FROM region;
SELECT *
FROM location;

-- JOIN QUERY FOR TESTING
SELECT * FROM country; SELECT * FROM region; SELECT * FROM location;
SELECT
	c.id AS Country_ID, 
	c.name AS Country_Name, 
	r.name AS Region_Name, 
	r.country_id AS Country_ID, 
	l.name AS Location_Name, 
	l.region_id AS Region_ID 
FROM country c
	JOIN region r ON c.id = r.country_id
	JOIN location l ON r.id = l.region_id;

