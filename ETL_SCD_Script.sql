---- In this project I'm building a data warehouse with slowly changing dimension (SCD) using SSIS
----! Note: The source database and the target database in the real-world situation should be seperated into different places. For simplication, I'll build both of them under 'BISM' in this project
---In this part I'm creating a table as a source database ( to mimic the source database in the real world)

CREATE TABLE Source_Customers
(
custid INT NOT NULL,
companyname NVARCHAR(40) NULL,
contactname NVARCHAR(30) NULL,
contacttitle NVARCHAR(30) NULL,
address NVARCHAR(60) NULL,
city NVARCHAR(15) NULL,
region NVARCHAR(15) NULL,
postalcode NVARCHAR(10) NULL,
country NVARCHAR(15) NULL,
phone NVARCHAR(24) NULL,
fax NVARCHAR(24) NULL,
CONSTRAINT PK_Customers PRIMARY KEY(custid)
);

INSERT INTO Source_Customers(custid, companyname, contactname, contacttitle,
address, city, region, postalcode, country, phone, fax)
VALUES
(1, N'Customer NRZBB', N'Allen, Michael', N'Sales Representative', N'Obere Str.
0123', N'Berlin', NULL, N'10092', N'Germany', N'030-3456789', N'030-0123456'),
(10, N'Customer EEALV', N'Bassols, Pilar Colome', N'Accounting Manager', N'8901
Tsawassen Blvd.', N'Tsawassen', N'BC', N'10111', N'Canada', N'(604) 901-2345',
N'(604) 678-9012'),
(11, N'Customer UBHAU', N'Jaffe, David', N'Sales Representative', N'Fauntleroy
Circus 4567', N'London', NULL, N'10064', N'UK', N'(171) 789-0123', NULL),
(12, N'Customer PSNMQ', N'Ray, Mike', N'Sales Agent', N'Cerrito 3456', N'Buenos
Aires', NULL, N'10057', N'Argentina', N'(1) 890-1234', N'(1) 567-8901'),
(13, N'Customer VMLOG', N'Benito, Almudena', N'Marketing Manager', N'Sierras de
Granada 7890', N'M?xico D.F.', NULL, N'10056', N'Mexico', N'(5) 456-7890', N'(5)
123-4567'),
(14, N'Customer WNMAF', N'Jelitto, Jacek', N'Owner', N'Hauptstr. 0123', N'Bern',
NULL, N'10065', N'Switzerland', N'0452-678901', NULL),
(15, N'Customer JUWXK', N'Richardson, Shawn', N'Sales Associate', N'Av. dos
Lus?adas, 6789', N'Sao Paulo', N'SP', N'10087', N'Brazil', N'(11) 012-3456', NULL);
SELECT * 
FROM Source_Customers;


-----Now I'm creating another table as the target database ( to mimic the target database in the real-world)

CREATE TABLE Dim_Customer
(
Cust_Key INT IDENTITY NOT NULL,
custid INT NULL,
companyname NVARCHAR(40) NULL,
contactname NVARCHAR(30) NULL,
contacttitle NVARCHAR(30) NULL,
address NVARCHAR(60) NULL,
city NVARCHAR(15) NULL,
version INT Default 1,
date_from DATETIME NULL,
date_to DATETIME NULL,
region NVARCHAR(15) NULL,
postalcode NVARCHAR(10) NULL,
country NVARCHAR(15) NULL,
phone NVARCHAR(24) NULL,
fax NVARCHAR(24) NULL,
CONSTRAINT PK_dim_Customers PRIMARY KEY(cust_key)
);SELECT * FROM Dim_Customer;