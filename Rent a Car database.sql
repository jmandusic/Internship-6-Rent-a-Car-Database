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