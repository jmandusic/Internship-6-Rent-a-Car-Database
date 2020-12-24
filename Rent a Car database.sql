create database Rent_a_Car

use Rent_a_Car

create table Employees(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	WeeklyWorkingHours int NOT NULL CHECK(WeeklyWorkingHours BETWEEN 18 AND 60)
)

create table Customers(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	CustomerID nvarchar(100) NOT NULL,
	DateOfBirth datetime2 NOT NULL,
	DriverLicenseNumber nvarchar(100) NOT NULL
)

create table Vehicles(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Type nvarchar(100) NOT NULL,
	Model nvarchar(100) NOT NULL,
	Brand nvarchar(100) NOT NULL,
	Color nvarchar(100) NOT NULL,
	Kilometers int,
	Registration nvarchar(100) NOT NULL,
	ManufactureYear nvarchar(100) NOT NULL,
	RegisteredOn datetime2 NOT NULL,
	ExpiresOn datetime2 NOT NULL
)

create table Rents(
	CustomerId int FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	CONSTRAINT RentsPrimaryKey PRIMARY KEY(CustomerId, VehicleId, EmployeeId),
	CardNumber nvarchar(100) NOT NULL,
	RentedOn datetime2 NOT NULL,
	StartOfRent datetime2 NOT NULL,
	RentedDays decimal NOT NULL
)

insert into Employees(FirstName, LastName, WeeklyWorkingHours) VALUES
('Mate' , 'Matic', 25),
('Jure', 'Juric', 30),
('Stipe', 'Stipic', 45),
('Klara', 'Klaric', 50),
('Petar', 'Petric', 40)

insert into Customers(FirstName, LastName, CustomerID, DateOfBirth, DriverLicenseNumber) VALUES
('Marko', 'Markic', '98234718920', '1992-07-19', '13475692'),
('Kate', 'Katic', '20391345021', '1995-09-25', '10873947'),
('Mirko', 'Mirkic', '06391821731', '2001-11-18', '90278301'),
('Sara', 'Saric', '09189027407', '1985-03-13', '29865743'),
('Ivo', 'Ivic', '21845029491', '1978-10-01', '20390485'),
('Luka', 'Lukic', '09827465390', '2002-01-11', '78017390'),
('Marija', 'Maric', '00276491837', '1991-04-01', '78017834'),
('Lovre', 'Lovric', '18736491230', '1993-11-27', '40039872'),
('Ana', 'Anic', '08719376517', '1968-09-12', '18346702'),
('Toma', 'Tomic', '78926501901', '1999-02-23', '12345678')

insert into Vehicles(Type, Model, Brand, Color, Kilometers, ManufactureYear, Registration, RegisteredOn, ExpiresOn) VALUES
('small car', 'A1', 'Audi', 'black', 25000, '2015', 'DA-123-AC', '2020-05-17', '2021-05-17'),
('small car', 'Yaris', 'Toyota', 'red', 15000, '2008', 'DA-285-LM', '2019-09-10', '2020-09-10'),
('small car', 'Punto', 'Fiat', 'blue', NULL, '2020', 'DA-437-LC', '2020-11-25', '2021-11-25'),
('small car', 'Miata', 'Mazda', 'green', 130000, '2004', 'DA-563-PN', '2019-12-31', '2020-12-31'),
('small car', 'Smart', 'Mercedes', 'yellow', 14500, '2017', 'DA-011-HD', '2020-01-17', '2021-01-17'),
('small car', 'Polo', 'Volkswagen', 'black', 65000, '2015', 'DA-111-AA', '2020-01-01', '2021-01-01'),
('small car', 'Swift', 'Suzuki', 'red', 125000, '2019', 'DA-158-HO', '2020-08-03', '2021-08-03'),
('car', 'A3', 'Audi', 'blue', 5000, '2011', 'DA-068-IB', '2020-04-21', '2021-04-21'),
('car', 'Q3', 'Audi', 'green', 35000, '2002', 'DA-769-SV', '2020-10-15', '2021-10-15'),
('car', 'C class', 'Mercedes', 'yellow', 18000, '2003', 'DA-432-RS', '2020-12-11', '2021-12-11'),
('car', 'Giulia', 'Alfa romeo', 'black', 160000, '2006', 'DA-700-MS', '2019-02-13', '2020-02-13'),
('car', 'Octavia', 'Skoda', 'red', 25000, '2013', 'DA-000-LL', '2019-01-05', '2020-01-05'),
('car', '3008', 'Peugeot', 'blue', 43000, '2008', 'DA-628-EZ', '2020-01-11', '2021-01-11'),
('car', 'Sorento', 'KIA', 'green', 1200, '2014', 'DA-858-OP', '2020-07-19', '2021-07-19'),
('sport', 'AMG-GT', 'Mercedes', 'yellow', 70000, '2015', 'DA-729-LA', '2020-12-05', '2021-12-05'),
('sport', 'MX-5 RF', 'Mazda', 'black', 30000, '2016', 'DA-054-TA', '2020-01-25', '2021-01-25'),
('sport', 'Stinger GT', 'KIA', 'red', 12000, '2011', 'DA-195-KA', '2020-11-15', '2021-11-15'),
('scooter', 'TMAX', 'Yamaha', 'blue', 2000, '2010', 'DA-007-JF', '2019-06-03', '2020-06-03'),
('scooter', 'XMAX', 'Yamaha', 'green', NULL, '2020', 'DA-555-KK', '2020-09-18', '2021-09-18'),
('van', 'Vivaro', 'Opel', 'yellow', 150000, '2000', 'DA-829-ZU', '2020-01-03', '2021-01-03')

--VehicleId for some reason made jumps of 40

insert into Rents(CustomerId, VehicleId, EmployeeId, CardNumber, RentedOn, StartOfRent, RentedDays) VALUES
(1, 40 + 2, 3, '4704-3789-8623-3864', '2020-06-07', '2020-06-11', 12.5),
(4, 40 + 13, 3, '3801-5284-2910-7491', '2020-11-27', '2020-11-30', 7),
(9, 40 + 12, 3, '2017-7294-6394-9164', '2020-03-17', '2020-03-21', 3),
(10, 40 + 14, 3, '1749-9104-6185-0175', '2020-09-18', '2020-09-28', 14),
(7, 40 + 19, 3, '0374-6385-2947-2003', '2020-10-12', '2020-10-18', 1.5),
(8, 40 + 1, 3, '7294-0385-4902-1034', '2020-09-13', '2020-10-03', 24),
(3, 40 + 8, 1, '1234-8294-9026-0175', '2020-07-02', '2020-07-14', 13.5),
(4, 40 + 10, 1, '3801-5284-2910-7491', '2020-10-07', '2020-10-11', 11),
(6, 40 + 4, 1, '9035-0927-6285-9175', '2020-03-05', '2020-03-18', 6),
(10, 40 + 17, 1, '1749-9104-6185-0175', '2020-11-29', '2020-12-13', 15),
(2, 40 + 7, 2, '9274-0184-1675-1920', '2020-08-07', '2020-08-15', 4),
(5, 40 + 3, 2, '4570-9205-7295-1046', '2020-12-03', '2020-12-16', 7),
(9, 40 + 12, 2, '2017-7294-6394-9164', '2019-08-14', '2019-08-20', 7),
(4, 40 + 15, 2, '3801-5284-2910-7491', '2020-12-25', '2020-12-25', 0.5),
(6, 40 + 20, 4, '9035-0927-6285-9175', '2020-02-11', '2020-02-28', 11.5),
(3, 40 + 18, 4, '1234-8294-9026-0175', '2019-07-05', '2019-07-11', 3),
(5, 40 + 9, 4, '4570-9205-7295-1046', '2020-10-18', '2020-10-21', 12),
(4, 40 + 16, 4, '3801-5284-2910-7491', '2020-01-30', '2020-02-05', 8),
(7, 40 + 5, 5, '0374-6385-2947-2003', '2020-05-13', '2020-05-13', 3.5),
(2, 40 + 11, 5, '9274-0184-1675-1920', '2019-11-06', '2019-11-08', 1),
(1, 40 + 6, 5, '4704-3789-8623-3864', '2020-03-20', '2020-03-20', 10),
(3, 40 + 17, 5, '1234-8294-9026-0175', '2020-11-17', '2020-11-17', 7)

