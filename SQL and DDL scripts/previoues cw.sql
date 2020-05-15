-- I apolozise for not including the dump file but this sql script will clarify the steps i had taken for the creation of this database


-- creating an user

CONNECT sys as sysdba;
CREATE USER ShresthaRajat IDENTIFIED BY 1357;
ALTER USER ShresthaRajat ACCOUNT UNLOCK;
GRANT resource To ShresthaRajat;
GRANT create session TO ShresthaRajat;
GRANT connect, resource, dba to ShresthaRajat;
CONNECT ShresthaRajat



SELECT table_name FROM user_tables;
-- creating tables

CREATE TABLE Person(
    Person_ID NUMBER(10) NOT NULL,
    Name VARCHAR2(20) NOT NULL,
    Age  NUMBER(5) NOT NULL,
    sex VARCHAR2(20) NOT NULL,
    DOB DATE,
    E_mail VARCHAR2(50) UNIQUE,
    Cell_No NUMBER(10) UNIQUE,
    Fax_No NUMBER(10),
    Phone_No NUMBER(10),
	CONSTRAINT Person_PK 
		PRIMARY KEY (Person_ID)
);

CREATE TABLE Location(
    Location_ID NUMBER(10) NOT NULL,
    Country VARCHAR2(20) NOT NULL,
    Zone VARCHAR2(20) NOT NULL,
    City VARCHAR2(20) NOT NULL,
    Street VARCHAR2(20) NOT NULL,
    Street_Name VARCHAR2(20) NOT NULL,
	CONSTRAINT Location_PK 
		PRIMARY KEY (Location_ID)
);

CREATE TABLE Address(
	Person_ID NUMBER(10) NOT NULL,
	Location_ID NUMBER(10) NOT NULL,
	POB_Address VARCHAR2(1) DEFAULT 'T',
	CONSTRAINT Address_PK 
		PRIMARY KEY (Person_ID, Location_ID),
	CONSTRAINT Address_Location_FK 
		FOREIGN KEY (Location_ID)
		REFERENCES Location (Location_ID),
	CONSTRAINT Address_Person_FK 
		FOREIGN KEY (Person_ID)
		REFERENCES Person (Person_ID)
);

CREATE TABLE Customer(
	Person_ID NUMBER(10) NOT NULL,
	Type VARCHAR2(20) DEFAULT 'New',
	CONSTRAINT Customer_PK 
		PRIMARY KEY (Person_ID),
	CONSTRAINT Customer_Person_FK 
		FOREIGN KEY (Person_ID)
		REFERENCES Person (Person_ID)
);

CREATE TABLE Employee(
	Person_ID NUMBER(10) NOT NULL,
	Job VARCHAR2(20) NOT NULL,
	Salary NUMBER(10) NOT NULL,
	CONSTRAINT Employee_PK 
		PRIMARY KEY (Person_ID),
	CONSTRAINT Employee_Person_FK 
		FOREIGN KEY (Person_ID)
		REFERENCES Person (Person_ID)
);

CREATE TABLE Movie(
	Movie_Name VARCHAR2(20) NOT NULL,
	Rating NUMBER(10) ,
	Duration NUMBER(10) ,
	CONSTRAINT Movie_PK 
		PRIMARY KEY (Movie_Name)
);

CREATE TABLE Accommodation(
	Accommodation VARCHAR2(20) NOT NULL,
	Price NUMBER(10) NOT NULL,
	CONSTRAINT Accommodation_PK 
		PRIMARY KEY (Accommodation)
);

CREATE TABLE Show(
	Show_ID NUMBER(10) NOT NULL,
	Meal VARCHAR2(20) NOT NULL,
	Usher NUMBER(10) NOT NULL,
	Show_Date DATE NOT NULL,
	Show_Time NUMBER(10) NOT NULL,
	Hall VARCHAR2(20) NOT NULL,
	Movie_Name VARCHAR2(20) NOT NULL,
	CONSTRAINT Show_PK 
		PRIMARY KEY (Show_ID),
	CONSTRAINT Show_Employee_FK 
		FOREIGN KEY (Usher)
		REFERENCES Employee (Person_ID),
	CONSTRAINT Show_Movie_FK 
		FOREIGN KEY (Movie_Name)
		REFERENCES Movie (Movie_Name)
);

CREATE TABLE Booking(
	Person_ID NUMBER(10) NOT NULL,
	Show_ID NUMBER(10) NOT NULL,	
	No_Tickets NUMBER(10) NOT NULL,
	Booking_Date DATE NOT NULL,
	Accommodation VARCHAR2(20) NOT NULL,
	CONSTRAINT Booking_PK 
		PRIMARY KEY (Person_ID, Show_ID),
	CONSTRAINT Booking_Person_FK 
		FOREIGN KEY (Person_ID)
		REFERENCES Person (Person_ID),
	CONSTRAINT Booking_Show_FK 
		FOREIGN KEY (Show_ID)
		REFERENCES Show (Show_ID),
	CONSTRAINT Booking_Accommodation_FK 
		FOREIGN KEY (Accommodation)
		REFERENCES Accommodation (Accommodation)
);
	


-- inserting valuses in the table


INSERT INTO Accommodation VALUES ('Platinium', 500);
INSERT INTO Accommodation VALUES ('Gold', 400);
INSERT INTO Accommodation VALUES ('Silver', 300);
INSERT INTO Accommodation VALUES ('Exclusive', 0);

INSERT INTO Movie VALUES ('Aquawoman', 9, 100);
INSERT INTO Movie VALUES ('Bohemien', 10, 130);
INSERT INTO Movie VALUES ('Sinatra', 7, 140);

INSERT INTO Person VALUES (1, 'Rajat Shretha', 19, 'male', '11-mar-1999', 'rajat@mail.com', 984399999, 909090, 89891232 );
INSERT INTO Person VALUES (2, 'Saubhagya Sharma', 19, 'male', '11-dec-1998', 'sau@mail.com', 984399998, 909091, 89891233 );
INSERT INTO Person VALUES (3, 'Saurav Khadka', 19, 'male', '16-feb-1999', 'saurav@mail.com', 984399997, 909092, 89891234 );
INSERT INTO Person VALUES (4, 'Anu Shretha', 21, 'female', '11-mar-1999', 'anu@mail.com', 984399996, 909093, 89891235 );
INSERT INTO Person VALUES (5, 'Amira Shakya', 14, 'female', '11-dec-1998', 'Amira@mail.com', 984399995, 909094, 89861233 );
INSERT INTO Person VALUES (6, 'Tejan malla', 19, 'male', '11-dec-1998', 'Tejan@mail.com', 984399915, 909014, 89861223 );

INSERT INTO Employee VALUES (1, 'Usher', 20000);
INSERT INTO Employee VALUES (2, 'Usher', 20000);
INSERT INTO Employee VALUES (5, 'Accountant', 40000);

INSERT INTO Customer VALUES (1, 'Old Customer');
INSERT INTO Customer VALUES (2, 'New Customer');
INSERT INTO Customer VALUES (3, 'New Customer');
INSERT INTO Customer VALUES (4, 'New Customer');
INSERT INTO Customer VALUES (5, 'New Customer');

INSERT INTO Location VALUES (1, 'Nepal', 'Bagmati', 'Kathmandu', 'Samakhushi', 'Town-planning Rd');
INSERT INTO Location VALUES (2, 'Nepal', 'Bagmati', 'Kathmandu', 'Baneshwor', 'Bhawan');
INSERT INTO Location VALUES (3, 'Nepal', 'Bagmati', 'Kathmandu', 'Gyaneshwor', 'Kilagal');
INSERT INTO Location VALUES (4, 'Nepal', 'Bagmati', 'Kathmandu', 'Soyambu', 'Bhagwan Pau');

INSERT INTO Address VALUES (1, 1, 'y');
INSERT INTO Address VALUES (2, 2, 'y');
INSERT INTO Address VALUES (3, 3, 'y');
INSERT INTO Address VALUES (1, 4, 'n');
INSERT INTO Address VALUES (4, 4, 'y');
INSERT INTO Address VALUES (5, 4, 'y');


INSERT INTO Show VALUES (1, 'breakfast', 1, '11-jan-2019', 0900, 'A','Aquawoman');
INSERT INTO Show VALUES (2, 'dinner', 1, '11-jan-2019', 2100, 'B','Bohemien');
INSERT INTO Show VALUES (3, 'dinner', 1, '11-jan-2019', 2100, 'A','Sinatra');
INSERT INTO Show VALUES (4, 'lunch', 1, '12-jan-2019', 1200, 'B','Sinatra');


---p, s, t, d, a

-- by calling type
INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (1, 2, 1, '2-jan-2019', 'Exclusive');
INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (2, 2, 1, '3-jan-2019', 'Exclusive');
INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (3, 2, 1, '3-jan-2019', 'Silver');
INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (3, 1, 2, '3-jan-2019', 'Platinium');
INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (3, 3, 1, '3-jan-2019', 'Gold');
INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (1, 4, 1, '12-jan-2019', 'Exclusive');


INSERT INTO Booking (Person_ID, Show_ID, No_Tickets, Booking_Date, Accommodation) VALUES (5, 4, 1, '12-jan-2019', 'Exclusive');

commit;

--1. List all customers, old and current


SELECT Customer.Person_Id, Customer.Type, Person.Name 
FROM Customer 
JOIN Person
ON Customer.Person_Id = Person.Person_Id;



--2. List all customers with all their addresses

SELECT Person.Person_Id, Person.Name, Address.Location_ID, Location.Country, Location.Zone, Location.City, Location.Street, Location.Street_Name
FROM Address
JOIN Person
ON Address.Person_Id = Person.Person_Id
JOIN Location
ON Address.Location_Id = Location.Location_ID;




--3. For a given usher, find all the shows he/she ushered or will usher and the amount he/she got/will get for ushering the show.

SELECT Show.Show_Id, Show.Movie_Name, Show.Usher, Employee.Salary, Person.Name
FROM Show
Join Employee
ON Show.Usher = Employee.Person_ID
Join Person
ON Show.Usher = Person.Person_ID
WHERE Show.Usher = 1;


--4. List all customers that are also ushers.

SELECT Customer.Person_ID as Customer,
Person.Name, Employee.Job
FROM Employee
JOIN Person
ON Employee.Person_ID = Person.Person_ID
INNER JOIN Customer
ON Employee.Person_Id = Customer.Person_Id
WHERE Employee.job = 'Usher';



--1. List all ushers that attended a show that had a lunch in a given place.


SELECT Employee.Person_ID, Employee.Job, Person.Name, Show.Meal, Show.Hall, Booking.Show_ID, Booking.Person_ID
FROM Booking
JOIN Employee
ON Booking.Person_ID = Employee.Person_ID
JOIN Person
ON Booking.Person_ID = Person.Person_ID
JOIN Show
ON Booking.Show_ID = Show.Show_ID
WHERE Show.Meal = 'lunch' and Show.Hall = 'B';



--2. List the shows that will have breakfast at a given place on a given date

SELECT Show_ID, Movie_Name, Meal, Hall
FROM Show
WHERE Meal = 'breakfast' and Hall = 'A' and Show_Date = '11-jan-2019';




--3. List all employees that have worked as an usher or will work as an usher for a show or who have attended or will attend a show.

SELECT Employee.Person_ID, Employee.Job, Person.Name, Booking.Show_ID
FROM Employee
JOIN Person
ON Employee.Person_ID = Person.Person_ID
JOIN Booking
ON Employee.Person_ID = Booking.Person_ID
WHERE Employee.Job = 'Usher';


--4. List all customers booked for a show starting later or on a given date.

SELECT Person.Person_Id, Person.Name, Booking.Show_ID, Show.Movie_Name 
FROM Booking
JOIN Person
ON Booking.Person_Id = Person.Person_Id
JOIN Show
ON Booking.Show_ID = Show.Show_ID
WHERE Show_Date >= '12-jan-2019';



DESCRIBE Person;
DESCRIBE Employee;
DESCRIBE Customer;
DESCRIBE Address;
DESCRIBE Location;
DESCRIBE Show;
DESCRIBE Movie;
DESCRIBE Accommodation;
DESCRIBE Booking;

SELECT * FROM Person;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Address;
SELECT * FROM Location;
SELECT * FROM Show;
SELECT * FROM Movie;
SELECT * FROM Accommodation;
SELECT * FROM Booking;


DROP TABLE Booking;
DROP TABLE Show;
DROP TABLE Movie;
DROP TABLE Accommodation;
DROP TABLE Address;
DROP TABLE Location;
DROP TABLE Employee;
DROP TABLE Customer;
DROP TABLE Person;





CONNECT system as sysdba;
DROP USER ShresthaRajat CASCADE;



@C:\Users\kasudyy\Desktop\SQL\1.sql
@C:\Users\kasudyy\Desktop\SQL\2.sql
@C:\Users\kasudyy\Desktop\SQL\3.sql
@C:\Users\kasudyy\Desktop\SQL\4.sql
@C:\Users\kasudyy\Desktop\SQL\5.sql
@C:\Users\kasudyy\Desktop\SQL\6.sql
@C:\Users\kasudyy\Desktop\SQL\7.sql
@C:\Users\kasudyy\Desktop\SQL\8.sql
@C:\Users\kasudyy\Desktop\SQL\9.sql
@C:\Users\kasudyy\Desktop\SQL\10.sql
@C:\Users\kasudyy\Desktop\SQL\11del.sql

