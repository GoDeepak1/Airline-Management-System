-- create database Airline;

-- create table Admin(

-- Admin_ID varchar(20) primary key,

-- Name varchar(20),

-- Pswd varchar(20));

-- create table Customer(

-- User_Name varchar(20) primary key,

-- Pswd varchar(20),

-- Email varchar(30),

-- Phone varchar(13),

-- Age int);

-- create table Planes(

-- Plane_Name varchar(20) primary key,

-- Class varchar(10),

-- Seats int);

-- create table Aircraft(

-- Flight_ID varchar(20),

-- Dep_Time DateTime,

-- Arr_Time DateTime,

-- Plane_Name varchar(20),

-- foreign key(Plane_Name) references Planes(Plane_Name) on update cascade on delete cascade,

-- Src varchar(20),

-- Dstn varchar(20),

-- Fare int,

-- Primary key (Flight_ID, Dep_Time) );

-- create table Payment(

-- Type varchar(20) primary key);

-- create table Records(

-- Book_ID varchar(20) primary key,

-- Flight_ID varchar(20),

-- foreign key(Flight_ID) references Aircraft(Flight_ID) on update cascade,

-- Book_Time DateTime,

-- User_Name varchar(20),

-- foreign key(User_Name) references Customer(User_Name) on delete cascade on update cascade,

-- Payment_Type varchar(20),

-- foreign key(Payment_Type) references Payment(Type) on update cascade

-- );

-- DELIMITER $$

-- CREATE TRIGGER Before_Insert_User

-- BEFORE INSERT ON customer

-- FOR EACH ROW

-- BEGIN

-- IF (EXISTS(SELECT 1 FROM customer WHERE User_Name = NEW.User_Name)) THEN

-- SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate mobile number';

-- END IF;

-- END$$

-- DELIMITER ;

-- Delimiter //

-- CREATE PROCEDURE insert_cust (IN name varchar(20),IN pass varchar(20),IN email varchar(30) ,IN phone varchar(13), ,IN age int)

-- BEGIN

-- insert into Customer (User_Name,Pswd,Email,Phone,Age) values (name ,pass,email,phone,age)
-- END//

-- Delimiter ;



CREATE DATABASE IF NOT EXISTS Airline;

USE Airline;

CREATE TABLE IF NOT EXISTS Admin (
    Admin_ID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(20),
    Pswd VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Customer (
    User_Name VARCHAR(20) PRIMARY KEY,
    Pswd VARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(13),
    Age INT
);

CREATE TABLE IF NOT EXISTS Planes (
    Plane_Name VARCHAR(20) PRIMARY KEY,
    Class VARCHAR(10),
    Seats INT
);

CREATE TABLE IF NOT EXISTS Aircraft (
    Flight_ID VARCHAR(20),
    Dep_Time DATETIME,
    Arr_Time DATETIME,
    Plane_Name VARCHAR(20),
    FOREIGN KEY (Plane_Name) REFERENCES Planes(Plane_Name) ON UPDATE CASCADE ON DELETE CASCADE,
    Src VARCHAR(20),
    Dstn VARCHAR(20),
    Fare INT,
    Dep_Date DATE,
    PRIMARY KEY (Flight_ID, Dep_Time)
);

CREATE TABLE IF NOT EXISTS Payment (
    Type VARCHAR(20) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Records (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Flight_ID VARCHAR(20),
    Book_Time DATETIME,
    User_Name VARCHAR(20),
    Payment_Type VARCHAR(20),
    Dep_Time DATETIME,
    FOREIGN KEY (Flight_ID) REFERENCES Aircraft(Flight_ID) ON UPDATE CASCADE,
    FOREIGN KEY (User_Name) REFERENCES Customer(User_Name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Payment_Type) REFERENCES Payment(Type) ON UPDATE CASCADE
);

DELIMITER $$

CREATE TRIGGER Before_Insert_User
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF (EXISTS(SELECT 1 FROM Customer WHERE User_Name = NEW.User_Name)) THEN
        SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate username';
    END IF;
END$$

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_cust (IN name VARCHAR(20), IN pass VARCHAR(20), IN email VARCHAR(30), IN phone VARCHAR(13), IN age INT)
BEGIN
    INSERT INTO Customer (User_Name, Pswd, Email, Phone, Age) VALUES (name, pass, email, phone, age);
END//

DELIMITER ;
Insert into PLANES(Plane_Name, Class, Seats)

Values

('MercuryA','Economy',100),

('VenusA','Economy',100),

('PlutoA','Economy',150),

('SaturnA','Economy',150),

('JupiterA','Economy',200),

('NeptuneA','Economy',200);

Insert into AIRCRAFT(Flight_ID, Dep_Time, Arr_Time, Plane_Name, Src, Dstn, Fare, Dep_Date)

Values

('M1','2018-12-01 08:00:00', '2018-12-01 10:00:00', 'MercuryA', 'Delhi','Bangalore', 7000,'2018-12-01'),

('M1','2018-12-02 08:00:00', '2018-12-02 10:00:00', 'MercuryA', 'Delhi','Bangalore', 6000,'2018-12-02'),

('M1','2018-12-03 08:00:00', '2018-12-03 10:00:00', 'MercuryA', 'Delhi','Bangalore', 6000,'2018-12-03'),

('M1','2018-12-04 08:00:00', '2018-12-04 10:00:00', 'MercuryA', 'Delhi','Bangalore', 5000,'2018-12-04'),

('M1','2018-12-05 08:00:00', '2018-12-05 10:00:00', 'MercuryA', 'Delhi','Bangalore', 5000,'2018-12-05'),

('M1','2018-12-06 08:00:00', '2018-12-06 10:00:00', 'MercuryA', 'Delhi','Bangalore', 4000,'2018-12-06'),

('M1','2018-12-07 8:00:00', '2018-12-07 10:00:00', 'MercuryA', 'Delhi','Bangalore', 4000,'2018-12-07'),

('M2','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'MercuryA', 'Bangalore','Delhi', 7000,'2018-12-01'),

('M2','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'MercuryA', 'Bangalore','Delhi', 6000,'2018-12-02'),

('M2','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'MercuryA', 'Bangalore','Delhi', 6000,'2018-12-03'),

('M2','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'MercuryA', 'Bangalore','Delhi', 5000,'2018-12-04'),

('M2','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'MercuryA', 'Bangalore','Delhi', 5000,'2018-12-05'),

('M2','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'MercuryA', 'Bangalore','Delhi', 4000,'2018-12-06'),

('M2','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'MercuryA', 'Bangalore','Delhi', 4000,'2018-12-07'),

('V1','2018-12-01 08:00:00', '2018-12-01 10:00:00', 'VenusA', 'Delhi','Patna', 7000,'2018-12-01'),

('V1','2018-12-02 08:00:00', '2018-12-02 10:00:00', 'VenusA', 'Delhi','Patna', 6000,'2018-12-02'),

('V1','2018-12-03 08:00:00', '2018-12-03 10:00:00', 'VenusA', 'Delhi','Patna', 6000,'2018-12-03'),

('V1','2018-12-04 08:00:00', '2018-12-04 10:00:00', 'VenusA', 'Delhi','Patna', 5000,'2018-12-04'),

('V1','2018-12-05 08:00:00', '2018-12-05 10:00:00', 'VenusA', 'Delhi','Patna', 5000,'2018-12-05'),

('V1','2018-12-06 08:00:00', '2018-12-06 10:00:00', 'VenusA', 'Delhi','Patna', 4000,'2018-12-06'),

('V1','2018-12-07 08:00:00', '2018-12-07 10:00:00', 'VenusA', 'Delhi','Patna', 4000,'2018-12-07'),

('V2','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-01'),

('V2','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-02'),

('V2','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-03'),

('V2','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-04'),

('V2','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-05'),

('V2','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-06'),

('V2','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'VenusA','Patna','Delhi', 4000,'2018-12-07'),

('P1','2018-12-01 08:00:00', '2018-12-01 10:00:00', 'PlutoA','Ahmedabad','Patna', 7000,'2018-12-01'),

('P1','2018-12-02 08:00:00', '2018-12-02 10:00:00', 'PlutoA','Ahmedabad','Patna', 6000,'2018-12-02'),

('P1','2018-12-03 08:00:00', '2018-12-03 10:00:00', 'PlutoA','Ahmedabad','Patna', 6000,'2018-12-03'),

('P1','2018-12-04 08:00:00', '2018-12-04 10:00:00', 'PlutoA','Ahmedabad','Patna', 5000,'2018-12-04'),

('P1','2018-12-05 08:00:00', '2018-12-05 10:00:00', 'PlutoA','Ahmedabad','Patna', 5000,'2018-12-05'),

('P1','2018-12-06 08:00:00', '2018-12-06 10:00:00', 'PlutoA','Ahmedabad','Patna', 4000,'2018-12-06'),

('P1','2018-12-07 08:00:00', '2018-12-07 10:00:00', 'PlutoA','Ahmedabad','Patna', 4000,'2018-12-07'),

('P2','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'PlutoA','Patna','Ahmedabad', 7000,'2018-12-01'),

('P2','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'PlutoA','Patna','Ahmedabad', 6000,'2018-12-02'),

('P2','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'PlutoA','Patna','Ahmedabad', 6000,'2018-12-03'),

('P2','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'PlutoA','Patna','Ahmedabad', 5000,'2018-12-04'),

('P2','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'PlutoA','Patna','Ahmedabad', 5000,'2018-12-05'),

('P2','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'PlutoA','Patna','Ahmedabad', 4000,'2018-12-06'),

('P2','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'PlutoA','Patna','Ahmedabad', 4000,'2018-12-07'),

('S1','2018-12-01 08:00:00', '2018-12-01 10:00:00', 'SaturnA','Delhi','Ahmedabad',7000,'2018-12-01'),

('S1','2018-12-02 08:00:00', '2018-12-02 10:00:00', 'SaturnA','Delhi','Ahmedabad',6000,'2018-12-02'),

('S1','2018-12-03 08:00:00', '2018-12-03 10:00:00', 'SaturnA','Delhi','Ahmedabad',6000,'2018-12-03'),

('S1','2018-12-04 08:00:00', '2018-12-04 10:00:00', 'SaturnA','Delhi','Ahmedabad',5000,'2018-12-04'),

('S1','2018-12-05 08:00:00', '2018-12-05 10:00:00', 'SaturnA','Delhi','Ahmedabad',5000,'2018-12-05'),

('S1','2018-12-06 08:00:00', '2018-12-06 10:00:00', 'SaturnA','Delhi','Ahmedabad',4000,'2018-12-06'),

('S1','2018-12-07 08:00:00', '2018-12-07 10:00:00', 'SaturnA','Delhi','Ahmedabad',4000,'2018-12-07'),

('S2','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'SaturnA','Ahmedabad','Delhi',7000,'2018-12-01'),

('S2','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'SaturnA','Ahmedabad','Delhi',6000,'2018-12-02'),

('S2','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'SaturnA','Ahmedabad','Delhi',6000,'2018-12-03'),

('S2','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'SaturnA','Ahmedabad','Delhi',5000,'2018-12-04'),

('S2','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'SaturnA','Ahmedabad','Delhi',5000,'2018-12-05'),

('S2','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'SaturnA','Ahmedabad','Delhi',4000,'2018-12-06'),

('S2','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'SaturnA','Ahmedabad','Delhi',4000,'2018-12-07'),

('J1','2018-12-01 08:00:00', '2018-12-01 10:00:00', 'JupiterA','Bangalore','Ahmedabad',7000,'2018-12-01'),

('J1','2018-12-02 08:00:00', '2018-12-02 10:00:00', 'JupiterA','Bangalore','Ahmedabad',6000,'2018-12-02'),

('J1','2018-12-03 08:00:00', '2018-12-03 10:00:00', 'JupiterA','Bangalore','Ahmedabad',6000,'2018-12-03'),

('J1','2018-12-04 08:00:00', '2018-12-04 10:00:00', 'JupiterA','Bangalore','Ahmedabad',5000,'2018-12-04'),

('J1','2018-12-05 08:00:00', '2018-12-05 10:00:00', 'JupiterA','Bangalore','Ahmedabad',5000,'2018-12-05'),

('J1','2018-12-06 08:00:00', '2018-12-06 10:00:00', 'JupiterA','Bangalore','Ahmedabad',4000,'2018-12-06'),

('J1','2018-12-07 08:00:00', '2018-12-07 10:00:00', 'JupiterA','Bangalore','Ahmedabad',4000,'2018-12-07'),

('J2','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'JupiterA','Ahmedabad','Bangalore',7000,'2018-12-01'),

('J2','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'JupiterA','Ahmedabad','Bangalore',6000,'2018-12-02'),

('J2','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'JupiterA','Ahmedabad','Bangalore',6000,'2018-12-03'),

('J2','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'JupiterA','Ahmedabad','Bangalore',5000,'2018-12-04'),

('J2','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'JupiterA','Ahmedabad','Bangalore',5000,'2018-12-05'),

('J2','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'JupiterA','Ahmedabad','Bangalore',4000,'2018-12-06'),

('J2','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'JupiterA','Ahmedabad','Bangalore',4000,'2018-12-07'),

('N1','2018-12-01 08:00:00', '2018-12-01 10:00:00', 'NeptuneA','Bangalore','Patna',7000,'2018-12-01'),

('N1','2018-12-02 08:00:00', '2018-12-02 10:00:00', 'NeptuneA','Bangalore','Patna',6000,'2018-12-02'),

('N1','2018-12-03 08:00:00', '2018-12-03 10:00:00', 'NeptuneA','Bangalore','Patna',6000,'2018-12-03'),

('N1','2018-12-04 08:00:00', '2018-12-04 10:00:00', 'NeptuneA','Bangalore','Patna',5000,'2018-12-04'),

('N1','2018-12-05 08:00:00', '2018-12-05 10:00:00', 'NeptuneA','Bangalore','Patna',5000,'2018-12-05'),

('N1','2018-12-06 08:00:00', '2018-12-06 10:00:00', 'NeptuneA','Bangalore','Patna',4000,'2018-12-06'),

('N1','2018-12-07 08:00:00', '2018-12-07 10:00:00', 'NeptuneA','Bangalore','Patna',4000,'2018-12-07'),

('N2','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'NeptuneA','Patna','Bangalore',7000,'2018-12-01'),

('N2','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'NeptuneA','Patna','Bangalore',6000,'2018-12-02'),

('N2','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'NeptuneA','Patna','Bangalore',6000,'2018-12-03'),

('N2','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'NeptuneA','Patna','Bangalore',5000,'2018-12-04'),

('N2','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'NeptuneA','Patna','Bangalore',5000,'2018-12-05'),

('N2','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'NeptuneA','Patna','Bangalore',4000,'2018-12-06'),

('N2','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'NeptuneA','Patna','Bangalore',4000,'2018-12-07');

Insert into PLANES(Plane_Name, Class, Seats)

Values

('MercuryB','Economy',100),

('VenusB','Economy',100),
('MercuryC','Economy',100),

('PlutoB','Economy',150),

('SaturnB','Economy',150),

('JupiterB','Economy',200),

('NeptuneB','Economy',200);

Insert into AIRCRAFT(Flight_ID, Dep_Time, Arr_Time, Plane_Name, Src, Dstn, Fare, Dep_Date)

Values

('M1','2018-12-01 10:00:00', '2018-12-01 12:00:00', 'MercuryB', 'Delhi','Bangalore', 7000,'2018-12-01'),

('M1','2018-12-02 10:00:00', '2018-12-02 12:00:00', 'MercuryB', 'Delhi','Bangalore', 6000,'2018-12-02'),

('M1','2018-12-03 10:00:00', '2018-12-03 12:00:00', 'MercuryB', 'Delhi','Bangalore', 6000,'2018-12-03'),

('M1','2018-12-04 10:00:00', '2018-12-04 12:00:00', 'MercuryB', 'Delhi','Bangalore', 5000,'2018-12-04'),

('M1','2018-12-05 10:00:00', '2018-12-05 12:00:00', 'MercuryB', 'Delhi','Bangalore', 5000,'2018-12-05'),

('M1','2018-12-06 10:00:00', '2018-12-06 12:00:00', 'MercuryB', 'Delhi','Bangalore', 4000,'2018-12-06'),

('M1','2018-12-07 10:00:00', '2018-12-07 12:00:00', 'MercuryB', 'Delhi','Bangalore', 4000,'2018-12-07'),

('M2','2018-12-01 15:00:00', '2018-12-01 17:00:00', 'MercuryB', 'Bangalore','Delhi', 7000,'2018-12-01'),

('M2','2018-12-02 15:00:00', '2018-12-02 17:00:00', 'MercuryB', 'Bangalore','Delhi', 6000,'2018-12-02'),

('M2','2018-12-03 15:00:00', '2018-12-03 17:00:00', 'MercuryB', 'Bangalore','Delhi', 6000,'2018-12-03'),

('M2','2018-12-04 15:00:00', '2018-12-04 17:00:00', 'MercuryB', 'Bangalore','Delhi', 5000,'2018-12-04'),

('M2','2018-12-05 15:00:00', '2018-12-05 17:00:00', 'MercuryB', 'Bangalore','Delhi', 5000,'2018-12-05'),

('M2','2018-12-06 15:00:00', '2018-12-06 17:00:00', 'MercuryB', 'Bangalore','Delhi', 4000,'2018-12-06'),

('M2','2018-12-07 15:00:00', '2018-12-07 17:00:00', 'MercuryB', 'Bangalore','Delhi', 4000,'2018-12-07'),

('V1','2018-12-01 10:00:00', '2018-12-01 12:00:00', 'VenusB', 'Delhi','Patna', 7000,'2018-12-01'),

('V1','2018-12-02 10:00:00', '2018-12-02 12:00:00', 'VenusB', 'Delhi','Patna', 6000,'2018-12-02'),

('V1','2018-12-03 10:00:00', '2018-12-03 12:00:00', 'VenusB', 'Delhi','Patna', 6000,'2018-12-03'),

('V1','2018-12-04 10:00:00', '2018-12-04 12:00:00', 'VenusB', 'Delhi','Patna', 5000,'2018-12-04'),

('V1','2018-12-05 10:00:00', '2018-12-05 12:00:00', 'VenusB', 'Delhi','Patna', 5000,'2018-12-05'),

('V1','2018-12-06 10:00:00', '2018-12-06 12:00:00', 'VenusB', 'Delhi','Patna', 4000,'2018-12-06'),

('V1','2018-12-07 10:00:00', '2018-12-07 12:00:00', 'VenusB', 'Delhi','Patna', 4000,'2018-12-07'),

('V2','2018-12-01 15:00:00', '2018-12-01 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-01'),

('V2','2018-12-02 15:00:00', '2018-12-02 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-02'),

('V2','2018-12-03 15:00:00', '2018-12-03 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-03'),

('V2','2018-12-04 15:00:00', '2018-12-04 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-04'),

('V2','2018-12-05 15:00:00', '2018-12-05 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-05'),

('V2','2018-12-06 15:00:00', '2018-12-06 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-06'),

('V2','2018-12-07 15:00:00', '2018-12-07 17:00:00', 'VenusB','Patna','Delhi', 4000,'2018-12-07'),

('P1','2018-12-01 10:00:00', '2018-12-01 12:00:00', 'PlutoB','Ahmedabad','Patna', 7000,'2018-12-01'),

('P1','2018-12-02 10:00:00', '2018-12-02 12:00:00', 'PlutoB','Ahmedabad','Patna', 6000,'2018-12-02'),

('P1','2018-12-03 10:00:00', '2018-12-03 12:00:00', 'PlutoB','Ahmedabad','Patna', 6000,'2018-12-03'),

('P1','2018-12-04 10:00:00', '2018-12-04 12:00:00', 'PlutoB','Ahmedabad','Patna', 5000,'2018-12-04'),

('P1','2018-12-05 10:00:00', '2018-12-05 12:00:00', 'PlutoB','Ahmedabad','Patna', 5000,'2018-12-05'),

('P1','2018-12-06 10:00:00', '2018-12-06 12:00:00', 'PlutoB','Ahmedabad','Patna', 4000,'2018-12-06'),

('P1','2018-12-07 10:00:00', '2018-12-07 12:00:00', 'PlutoB','Ahmedabad','Patna', 4000,'2018-12-07'),

('P2','2018-12-01 15:00:00', '2018-12-01 17:00:00', 'PlutoB','Patna','Ahmedabad', 7000,'2018-12-01'),

('P2','2018-12-02 15:00:00', '2018-12-02 17:00:00', 'PlutoB','Patna','Ahmedabad', 6000,'2018-12-02'),

('P2','2018-12-03 15:00:00', '2018-12-03 17:00:00', 'PlutoB','Patna','Ahmedabad', 6000,'2018-12-03'),

('P2','2018-12-04 15:00:00', '2018-12-04 17:00:00', 'PlutoB','Patna','Ahmedabad', 5000,'2018-12-04'),

('P2','2018-12-05 15:00:00', '2018-12-05 17:00:00', 'PlutoB','Patna','Ahmedabad', 5000,'2018-12-05'),

('P2','2018-12-06 15:00:00', '2018-12-06 17:00:00', 'PlutoB','Patna','Ahmedabad', 4000,'2018-12-06'),

('P2','2018-12-07 15:00:00', '2018-12-07 17:00:00', 'PlutoB','Patna','Ahmedabad', 4000,'2018-12-07'),

('S1','2018-12-01 10:00:00', '2018-12-01 12:00:00', 'SaturnB','Delhi','Ahmedabad',7000,'2018-12-01'),

('S1','2018-12-02 10:00:00', '2018-12-02 12:00:00', 'SaturnB','Delhi','Ahmedabad',6000,'2018-12-02'),

('S1','2018-12-03 10:00:00', '2018-12-03 12:00:00', 'SaturnB','Delhi','Ahmedabad',6000,'2018-12-03'),

('S1','2018-12-04 10:00:00', '2018-12-04 12:00:00', 'SaturnB','Delhi','Ahmedabad',5000,'2018-12-04'),

('S1','2018-12-05 10:00:00', '2018-12-05 12:00:00', 'SaturnB','Delhi','Ahmedabad',5000,'2018-12-05'),

('S1','2018-12-06 10:00:00', '2018-12-06 12:00:00', 'SaturnB','Delhi','Ahmedabad',4000,'2018-12-06'),

('S1','2018-12-07 10:00:00', '2018-12-07 12:00:00', 'SaturnB','Delhi','Ahmedabad',4000,'2018-12-07'),

('S2','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'SaturnB','Ahmedabad','Delhi',7000,'2018-12-01'),

('S2','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'SaturnB','Ahmedabad','Delhi',6000,'2018-12-02'),

('S2','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'SaturnB','Ahmedabad','Delhi',6000,'2018-12-03'),

('S2','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'SaturnB','Ahmedabad','Delhi',5000,'2018-12-04'),

('S2','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'SaturnB','Ahmedabad','Delhi',5000,'2018-12-05'),

('S2','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'SaturnB','Ahmedabad','Delhi',4000,'2018-12-06'),

('S2','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'SaturnB','Ahmedabad','Delhi',4000,'2018-12-07'),

('J1','2018-12-01 10:00:00', '2018-12-01 12:00:00', 'JupiterB','Bangalore','Ahmedabad',7000,'2018-12-01'),

('J1','2018-12-02 10:00:00', '2018-12-02 12:00:00', 'JupiterB','Bangalore','Ahmedabad',6000,'2018-12-02'),

('J1','2018-12-03 10:00:00', '2018-12-03 12:00:00', 'JupiterB','Bangalore','Ahmedabad',6000,'2018-12-03'),

('J1','2018-12-04 10:00:00', '2018-12-04 12:00:00', 'JupiterB','Bangalore','Ahmedabad',5000,'2018-12-04'),

('J1','2018-12-05 10:00:00', '2018-12-05 12:00:00', 'JupiterB','Bangalore','Ahmedabad',5000,'2018-12-05'),

('J1','2018-12-06 10:00:00', '2018-12-06 12:00:00', 'JupiterB','Bangalore','Ahmedabad',4000,'2018-12-06'),

('J1','2018-12-07 10:00:00', '2018-12-07 12:00:00', 'JupiterB','Bangalore','Ahmedabad',4000,'2018-12-07'),

('J2','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'JupiterB','Ahmedabad','Bangalore',7000,'2018-12-01'),

('J2','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'JupiterB','Ahmedabad','Bangalore',6000,'2018-12-02'),

('J2','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'JupiterB','Ahmedabad','Bangalore',6000,'2018-12-03'),

('J2','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'JupiterB','Ahmedabad','Bangalore',5000,'2018-12-04'),

('J2','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'JupiterB','Ahmedabad','Bangalore',5000,'2018-12-05'),

('J2','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'JupiterB','Ahmedabad','Bangalore',4000,'2018-12-06'),

('J2','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'JupiterB','Ahmedabad','Bangalore',4000,'2018-12-07'),

('N1','2018-12-01 10:00:00', '2018-12-01 12:00:00', 'NeptuneB','Bangalore','Patna',7000,'2018-12-01'),

('N1','2018-12-02 10:00:00', '2018-12-02 12:00:00', 'NeptuneB','Bangalore','Patna',6000,'2018-12-02'),

('N1','2018-12-03 10:00:00', '2018-12-03 12:00:00', 'NeptuneB','Bangalore','Patna',6000,'2018-12-03'),

('N1','2018-12-04 10:00:00', '2018-12-04 12:00:00', 'NeptuneB','Bangalore','Patna',5000,'2018-12-04'),

('N1','2018-12-05 10:00:00', '2018-12-05 12:00:00', 'NeptuneB','Bangalore','Patna',5000,'2018-12-05'),

('N1','2018-12-06 10:00:00', '2018-12-06 12:00:00', 'NeptuneB','Bangalore','Patna',4000,'2018-12-06'),

('N1','2018-12-07 10:00:00', '2018-12-07 12:00:00', 'NeptuneB','Bangalore','Patna',4000,'2018-12-07'),

('N2','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'NeptuneB','Patna','Bangalore',7000,'2018-12-01'),

('N2','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'NeptuneB','Patna','Bangalore',6000,'2018-12-02'),

('N2','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'NeptuneB','Patna','Bangalore',6000,'2018-12-03'),

('N2','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'NeptuneB','Patna','Bangalore',5000,'2018-12-04'),

('N2','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'NeptuneB','Patna','Bangalore',5000,'2018-12-05'),

('N2','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'NeptuneB','Patna','Bangalore',4000,'2018-12-06'),

('N2','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'NeptuneB','Patna','Bangalore',4000,'2018-12-07');


Insert into AIRCRAFT(Flight_ID, Dep_Time, Arr_Time, Plane_Name, Src, Dstn, Fare, Dep_Date)

Values

('M1','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'MercuryC', 'Delhi','Bangalore', 7000,'2018-12-01'),

('M1','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'MercuryC', 'Delhi','Bangalore', 6000,'2018-12-02'),

('M1','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'MercuryC', 'Delhi','Bangalore', 6000,'2018-12-03'),

('M1','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'MercuryC', 'Delhi','Bangalore', 5000,'2018-12-04'),

('M1','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'MercuryC', 'Delhi','Bangalore', 5000,'2018-12-05'),

('M1','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'MercuryC', 'Delhi','Bangalore', 4000,'2018-12-06'),

('M1','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'MercuryC', 'Delhi','Bangalore', 4000,'2018-12-07'),

('M2','2018-12-01 17:00:00', '2018-12-01 19:00:00', 'MercuryC', 'Bangalore','Delhi', 7000,'2018-12-01'),

('M2','2018-12-02 17:00:00', '2018-12-02 19:00:00', 'MercuryC', 'Bangalore','Delhi', 6000,'2018-12-02'),

('M2','2018-12-03 17:00:00', '2018-12-03 19:00:00', 'MercuryC', 'Bangalore','Delhi', 6000,'2018-12-03'),

('M2','2018-12-04 17:00:00', '2018-12-04 19:00:00', 'MercuryC', 'Bangalore','Delhi', 5000,'2018-12-04'),

('M2','2018-12-05 17:00:00', '2018-12-05 19:00:00', 'MercuryC', 'Bangalore','Delhi', 5000,'2018-12-05'),

('M2','2018-12-06 17:00:00', '2018-12-06 19:00:00', 'MercuryC', 'Bangalore','Delhi', 4000,'2018-12-06'),

('M2','2018-12-07 17:00:00', '2018-12-07 19:00:00', 'MercuryC', 'Bangalore','Delhi', 4000,'2018-12-07'),

('V1','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'VenusC', 'Delhi','Patna', 7000,'2018-12-01'),

('V1','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'VenusC', 'Delhi','Patna', 6000,'2018-12-02'),

('V1','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'VenusC', 'Delhi','Patna', 6000,'2018-12-03'),

('V1','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'VenusC', 'Delhi','Patna', 5000,'2018-12-04'),

('V1','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'VenusC', 'Delhi','Patna', 5000,'2018-12-05'),

('V1','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'VenusC', 'Delhi','Patna', 4000,'2018-12-06'),

('V1','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'VenusC', 'Delhi','Patna', 4000,'2018-12-07'),

('V2','2018-12-01 17:00:00', '2018-12-01 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-01'),

('V2','2018-12-02 17:00:00', '2018-12-02 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-02'),

('V2','2018-12-03 17:00:00', '2018-12-03 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-03'),

('V2','2018-12-04 17:00:00', '2018-12-04 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-04'),

('V2','2018-12-05 17:00:00', '2018-12-05 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-05'),

('V2','2018-12-06 17:00:00', '2018-12-06 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-06'),

('V2','2018-12-07 17:00:00', '2018-12-07 19:00:00', 'VenusC','Patna','Delhi', 4000,'2018-12-07'),

('P1','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'PlutoC','Ahmedabad','Patna', 7000,'2018-12-01'),

('P1','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'PlutoC','Ahmedabad','Patna', 6000,'2018-12-02'),

('P1','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'PlutoC','Ahmedabad','Patna', 6000,'2018-12-03'),

('P1','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'PlutoC','Ahmedabad','Patna', 5000,'2018-12-04'),

('P1','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'PlutoC','Ahmedabad','Patna', 5000,'2018-12-05'),

('P1','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'PlutoC','Ahmedabad','Patna', 4000,'2018-12-06'),

('P1','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'PlutoC','Ahmedabad','Patna', 4000,'2018-12-07'),

('P2','2018-12-01 17:00:00', '2018-12-01 19:00:00', 'PlutoC','Patna','Ahmedabad', 7000,'2018-12-01'),

('P2','2018-12-02 17:00:00', '2018-12-02 19:00:00', 'PlutoC','Patna','Ahmedabad', 6000,'2018-12-02'),

('P2','2018-12-03 17:00:00', '2018-12-03 19:00:00', 'PlutoC','Patna','Ahmedabad', 6000,'2018-12-03'),

('P2','2018-12-04 17:00:00', '2018-12-04 19:00:00', 'PlutoC','Patna','Ahmedabad', 5000,'2018-12-04'),

('P2','2018-12-05 17:00:00', '2018-12-05 19:00:00', 'PlutoC','Patna','Ahmedabad', 5000,'2018-12-05'),

('P2','2018-12-06 17:00:00', '2018-12-06 19:00:00', 'PlutoC','Patna','Ahmedabad', 4000,'2018-12-06'),

('P2','2018-12-07 17:00:00', '2018-12-07 19:00:00', 'PlutoC','Patna','Ahmedabad', 4000,'2018-12-07'),

('S1','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'SaturnC','Delhi','Ahmedabad',7000,'2018-12-01'),

('S1','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'SaturnC','Delhi','Ahmedabad',6000,'2018-12-02'),

('S1','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'SaturnC','Delhi','Ahmedabad',6000,'2018-12-03'),

('S1','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'SaturnC','Delhi','Ahmedabad',5000,'2018-12-04'),

('S1','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'SaturnC','Delhi','Ahmedabad',5000,'2018-12-05'),

('S1','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'SaturnC','Delhi','Ahmedabad',4000,'2018-12-06'),

('S1','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'SaturnC','Delhi','Ahmedabad',4000,'2018-12-07'),

('S2','2018-12-01 16:00:00', '2018-12-01 18:00:00', 'SaturnC','Ahmedabad','Delhi',7000,'2018-12-01'),

('S2','2018-12-02 16:00:00', '2018-12-02 18:00:00', 'SaturnC','Ahmedabad','Delhi',6000,'2018-12-02'),

('S2','2018-12-03 16:00:00', '2018-12-03 18:00:00', 'SaturnC','Ahmedabad','Delhi',6000,'2018-12-03'),

('S2','2018-12-04 16:00:00', '2018-12-04 18:00:00', 'SaturnC','Ahmedabad','Delhi',5000,'2018-12-04'),

('S2','2018-12-05 16:00:00', '2018-12-05 18:00:00', 'SaturnC','Ahmedabad','Delhi',5000,'2018-12-05'),

('S2','2018-12-06 16:00:00', '2018-12-06 18:00:00', 'SaturnC','Ahmedabad','Delhi',4000,'2018-12-06'),

('S2','2018-12-07 16:00:00', '2018-12-07 18:00:00', 'SaturnC','Ahmedabad','Delhi',4000,'2018-12-07'),

('J1','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'JupiterC','Bangalore','Ahmedabad',7000,'2018-12-01'),

('J1','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'JupiterC','Bangalore','Ahmedabad',6000,'2018-12-02'),

('J1','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'JupiterC','Bangalore','Ahmedabad',6000,'2018-12-03'),

('J1','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'JupiterC','Bangalore','Ahmedabad',5000,'2018-12-04'),

('J1','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'JupiterC','Bangalore','Ahmedabad',5000,'2018-12-05'),

('J1','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'JupiterC','Bangalore','Ahmedabad',4000,'2018-12-06'),

('J1','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'JupiterC','Bangalore','Ahmedabad',4000,'2018-12-07'),

('J2','2018-12-01 16:00:00', '2018-12-01 18:00:00', 'JupiterC','Ahmedabad','Bangalore',7000,'2018-12-01'),

('J2','2018-12-02 16:00:00', '2018-12-02 18:00:00', 'JupiterC','Ahmedabad','Bangalore',6000,'2018-12-02'),

('J2','2018-12-03 16:00:00', '2018-12-03 18:00:00', 'JupiterC','Ahmedabad','Bangalore',6000,'2018-12-03'),

('J2','2018-12-04 16:00:00', '2018-12-04 18:00:00', 'JupiterC','Ahmedabad','Bangalore',5000,'2018-12-04'),

('J2','2018-12-05 16:00:00', '2018-12-05 18:00:00', 'JupiterC','Ahmedabad','Bangalore',5000,'2018-12-05'),

('J2','2018-12-06 16:00:00', '2018-12-06 18:00:00', 'JupiterC','Ahmedabad','Bangalore',4000,'2018-12-06'),

('J2','2018-12-07 16:00:00', '2018-12-07 18:00:00', 'JupiterC','Ahmedabad','Bangalore',4000,'2018-12-07'),

('N1','2018-12-01 12:00:00', '2018-12-01 14:00:00', 'NeptuneC','Bangalore','Patna',7000,'2018-12-01'),

('N1','2018-12-02 12:00:00', '2018-12-02 14:00:00', 'NeptuneC','Bangalore','Patna',6000,'2018-12-02'),

('N1','2018-12-03 12:00:00', '2018-12-03 14:00:00', 'NeptuneC','Bangalore','Patna',6000,'2018-12-03'),

('N1','2018-12-04 12:00:00', '2018-12-04 14:00:00', 'NeptuneC','Bangalore','Patna',5000,'2018-12-04'),

('N1','2018-12-05 12:00:00', '2018-12-05 14:00:00', 'NeptuneC','Bangalore','Patna',5000,'2018-12-05'),

('N1','2018-12-06 12:00:00', '2018-12-06 14:00:00', 'NeptuneC','Bangalore','Patna',4000,'2018-12-06'),

('N1','2018-12-07 12:00:00', '2018-12-07 14:00:00', 'NeptuneC','Bangalore','Patna',4000,'2018-12-07'),

('N2','2018-12-01 16:00:00', '2018-12-01 18:00:00', 'NeptuneC','Patna','Bangalore',7000,'2018-12-01'),

('N2','2018-12-02 16:00:00', '2018-12-02 18:00:00', 'NeptuneC','Patna','Bangalore',6000,'2018-12-02'),

('N2','2018-12-03 16:00:00', '2018-12-03 18:00:00', 'NeptuneC','Patna','Bangalore',6000,'2018-12-03'),

('N2','2018-12-04 16:00:00', '2018-12-04 18:00:00', 'NeptuneC','Patna','Bangalore',5000,'2018-12-04'),

('N2','2018-12-05 16:00:00', '2018-12-05 18:00:00', 'NeptuneC','Patna','Bangalore',5000,'2018-12-05'),

('N2','2018-12-06 16:00:00', '2018-12-06 18:00:00', 'NeptuneC','Patna','Bangalore',4000,'2018-12-06'),

('N2','2018-12-07 16:00:00', '2018-12-07 18:00:00', 'NeptuneC','Patna','Bangalore',4000,'2018-12-07');

Insert into AIRCRAFT(Flight_ID, Dep_Time, Arr_Time, Plane_Name, Src, Dstn, Fare, Dep_Date)

Values

('M1','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'MercuryD', 'Delhi','Bangalore', 7000,'2018-12-01'),

('M1','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'MercuryD', 'Delhi','Bangalore', 6000,'2018-12-02'),

('M1','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'MercuryD', 'Delhi','Bangalore', 6000,'2018-12-03'),

('M1','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'MercuryD', 'Delhi','Bangalore', 5000,'2018-12-04'),

('M1','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'MercuryD', 'Delhi','Bangalore', 5000,'2018-12-05'),

('M1','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'MercuryD', 'Delhi','Bangalore', 4000,'2018-12-06'),

('M1','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'MercuryD', 'Delhi','Bangalore', 4000,'2018-12-07'),

('M2','2018-12-01 19:00:00', '2018-12-01 21:00:00', 'MercuryD', 'Bangalore','Delhi', 7000,'2018-12-01'),

('M2','2018-12-02 19:00:00', '2018-12-02 21:00:00', 'MercuryD', 'Bangalore','Delhi', 6000,'2018-12-02'),

('M2','2018-12-03 19:00:00', '2018-12-03 21:00:00', 'MercuryD', 'Bangalore','Delhi', 6000,'2018-12-03'),

('M2','2018-12-04 19:00:00', '2018-12-04 21:00:00', 'MercuryD', 'Bangalore','Delhi', 5000,'2018-12-04'),

('M2','2018-12-05 19:00:00', '2018-12-05 21:00:00', 'MercuryD', 'Bangalore','Delhi', 5000,'2018-12-05'),

('M2','2018-12-06 19:00:00', '2018-12-06 21:00:00', 'MercuryD', 'Bangalore','Delhi', 4000,'2018-12-06'),

('M2','2018-12-07 19:00:00', '2018-12-07 21:00:00', 'MercuryD', 'Bangalore','Delhi', 4000,'2018-12-07'),

('V1','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'VenusD', 'Delhi','Patna', 7000,'2018-12-01'),

('V1','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'VenusD', 'Delhi','Patna', 6000,'2018-12-02'),

('V1','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'VenusD', 'Delhi','Patna', 6000,'2018-12-03'),

('V1','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'VenusD', 'Delhi','Patna', 5000,'2018-12-04'),

('V1','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'VenusD', 'Delhi','Patna', 5000,'2018-12-05'),

('V1','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'VenusD', 'Delhi','Patna', 4000,'2018-12-06'),

('V1','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'VenusD', 'Delhi','Patna', 4000,'2018-12-07'),

('V2','2018-12-01 19:00:00', '2018-12-01 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-01'),

('V2','2018-12-02 19:00:00', '2018-12-02 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-02'),

('V2','2018-12-03 19:00:00', '2018-12-03 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-03'),

('V2','2018-12-04 19:00:00', '2018-12-04 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-04'),

('V2','2018-12-05 19:00:00', '2018-12-05 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-05'),

('V2','2018-12-06 19:00:00', '2018-12-06 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-06'),

('V2','2018-12-07 19:00:00', '2018-12-07 21:00:00', 'VenusD','Patna','Delhi', 4000,'2018-12-07'),

('P1','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'PlutoD','Ahmedabad','Patna', 7000,'2018-12-01'),

('P1','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'PlutoD','Ahmedabad','Patna', 6000,'2018-12-02'),

('P1','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'PlutoD','Ahmedabad','Patna', 6000,'2018-12-03'),

('P1','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'PlutoD','Ahmedabad','Patna', 5000,'2018-12-04'),

('P1','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'PlutoD','Ahmedabad','Patna', 5000,'2018-12-05'),

('P1','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'PlutoD','Ahmedabad','Patna', 4000,'2018-12-06'),

('P1','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'PlutoD','Ahmedabad','Patna', 4000,'2018-12-07'),

('P2','2018-12-01 19:00:00', '2018-12-01 21:00:00', 'PlutoD','Patna','Ahmedabad', 7000,'2018-12-01'),

('P2','2018-12-02 19:00:00', '2018-12-02 21:00:00', 'PlutoD','Patna','Ahmedabad', 6000,'2018-12-02'),

('P2','2018-12-03 19:00:00', '2018-12-03 21:00:00', 'PlutoD','Patna','Ahmedabad', 6000,'2018-12-03'),

('P2','2018-12-04 19:00:00', '2018-12-04 21:00:00', 'PlutoD','Patna','Ahmedabad', 5000,'2018-12-04'),

('P2','2018-12-05 19:00:00', '2018-12-05 21:00:00', 'PlutoD','Patna','Ahmedabad', 5000,'2018-12-05'),

('P2','2018-12-06 19:00:00', '2018-12-06 21:00:00', 'PlutoD','Patna','Ahmedabad', 4000,'2018-12-06'),

('P2','2018-12-07 19:00:00', '2018-12-07 21:00:00', 'PlutoD','Patna','Ahmedabad', 4000,'2018-12-07'),

('S1','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'SaturnD','Delhi','Ahmedabad',7000,'2018-12-01'),

('S1','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'SaturnD','Delhi','Ahmedabad',6000,'2018-12-02'),

('S1','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'SaturnD','Delhi','Ahmedabad',6000,'2018-12-03'),

('S1','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'SaturnD','Delhi','Ahmedabad',5000,'2018-12-04'),

('S1','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'SaturnD','Delhi','Ahmedabad',5000,'2018-12-05'),

('S1','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'SaturnD','Delhi','Ahmedabad',4000,'2018-12-06'),

('S1','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'SaturnD','Delhi','Ahmedabad',4000,'2018-12-07'),

('S2','2018-12-01 18:00:00', '2018-12-01 20:00:00', 'SaturnD','Ahmedabad','Delhi',7000,'2018-12-01'),

('S2','2018-12-02 18:00:00', '2018-12-02 20:00:00', 'SaturnD','Ahmedabad','Delhi',6000,'2018-12-02'),

('S2','2018-12-03 18:00:00', '2018-12-03 20:00:00', 'SaturnD','Ahmedabad','Delhi',6000,'2018-12-03'),

('S2','2018-12-04 18:00:00', '2018-12-04 20:00:00', 'SaturnD','Ahmedabad','Delhi',5000,'2018-12-04'),

('S2','2018-12-05 18:00:00', '2018-12-05 20:00:00', 'SaturnD','Ahmedabad','Delhi',5000,'2018-12-05'),

('S2','2018-12-06 18:00:00', '2018-12-06 20:00:00', 'SaturnD','Ahmedabad','Delhi',4000,'2018-12-06'),

('S2','2018-12-07 18:00:00', '2018-12-07 20:00:00', 'SaturnD','Ahmedabad','Delhi',4000,'2018-12-07'),

('J1','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'JupiterD','Bangalore','Ahmedabad',7000,'2018-12-01'),

('J1','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'JupiterD','Bangalore','Ahmedabad',6000,'2018-12-02'),

('J1','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'JupiterD','Bangalore','Ahmedabad',6000,'2018-12-03'),

('J1','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'JupiterD','Bangalore','Ahmedabad',5000,'2018-12-04'),

('J1','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'JupiterD','Bangalore','Ahmedabad',5000,'2018-12-05'),

('J1','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'JupiterD','Bangalore','Ahmedabad',4000,'2018-12-

06'),

('J1','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'JupiterD','Bangalore','Ahmedabad',4000,'2018-12-07'),

('J2','2018-12-01 18:00:00', '2018-12-01 20:00:00', 'JupiterD','Ahmedabad','Bangalore',7000,'2018-12-01'),

('J2','2018-12-02 18:00:00', '2018-12-02 20:00:00', 'JupiterD','Ahmedabad','Bangalore',6000,'2018-12-02'),

('J2','2018-12-03 18:00:00', '2018-12-03 20:00:00', 'JupiterD','Ahmedabad','Bangalore',6000,'2018-12-03'),

('J2','2018-12-04 18:00:00', '2018-12-04 20:00:00', 'JupiterD','Ahmedabad','Bangalore',5000,'2018-12-04'),

('J2','2018-12-05 18:00:00', '2018-12-05 20:00:00', 'JupiterD','Ahmedabad','Bangalore',5000,'2018-12-05'),

('J2','2018-12-06 18:00:00', '2018-12-06 20:00:00', 'JupiterD','Ahmedabad','Bangalore',4000,'2018-12-06'),

('J2','2018-12-07 18:00:00', '2018-12-07 20:00:00', 'JupiterD','Ahmedabad','Bangalore',4000,'2018-12-07'),

('N1','2018-12-01 14:00:00', '2018-12-01 16:00:00', 'NeptuneD','Bangalore','Patna',7000,'2018-12-01'),

('N1','2018-12-02 14:00:00', '2018-12-02 16:00:00', 'NeptuneD','Bangalore','Patna',6000,'2018-12-02'),

('N1','2018-12-03 14:00:00', '2018-12-03 16:00:00', 'NeptuneD','Bangalore','Patna',6000,'2018-12-03'),

('N1','2018-12-04 14:00:00', '2018-12-04 16:00:00', 'NeptuneD','Bangalore','Patna',5000,'2018-12-04'),

('N1','2018-12-05 14:00:00', '2018-12-05 16:00:00', 'NeptuneD','Bangalore','Patna',5000,'2018-12-05'),

('N1','2018-12-06 14:00:00', '2018-12-06 16:00:00', 'NeptuneD','Bangalore','Patna',4000,'2018-12-06'),

('N1','2018-12-07 14:00:00', '2018-12-07 16:00:00', 'NeptuneD','Bangalore','Patna',4000,'2018-12-07'),

('N2','2018-12-01 18:00:00', '2018-12-01 20:00:00', 'NeptuneD','Patna','Bangalore',7000,'2018-12-01'),

('N2','2018-12-02 18:00:00', '2018-12-02 20:00:00', 'NeptuneD','Patna','Bangalore',6000,'2018-12-02'),

('N2','2018-12-03 18:00:00', '2018-12-03 20:00:00', 'NeptuneD','Patna','Bangalore',6000,'2018-12-03'),

('N2','2018-12-04 18:00:00', '2018-12-04 20:00:00', 'NeptuneD','Patna','Bangalore',5000,'2018-12-04'),

('N2','2018-12-05 18:00:00', '2018-12-05 20:00:00', 'NeptuneD','Patna','Bangalore',5000,'2018-12-05'),

('N2','2018-12-06 18:00:00', '2018-12-06 20:00:00', 'NeptuneD','Patna','Bangalore',4000,'2018-12-06'),

('N2','2018-12-07 18:00:00', '2018-12-07 20:00:00', 'NeptuneD','Patna','Bangalore',4000,'2018-12-07');

INSERT INTO Payment (Type) VALUES ('Paytm');
INSERT INTO Payment (Type) VALUES ('Debit Card');
INSERT INTO Payment (Type) VALUES ('UPI');
INSERT INTO Payment (Type) VALUES ('Wallet');