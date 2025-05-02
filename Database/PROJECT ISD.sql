create Database ExImp
use ExImp


 create table Customer(
 CustomerID int NOT NULL IDENTITY(3001,1) PRIMARY KEY,
 CustomerName varchar(120) NOT NULL,
 CustomerEmail varchar(50) NULL,
 CustomerPhone varchar(20) NULL UNIQUE,
 CustomerInstantMessengerType varchar(20) NULL,
 CustomerInstantMessengerValue varchar(50) NULL,
 CustomerAddress varchar(250) NOT NULL
 );

  select * from Customer

 alter table Customer
 Add Country varchar(50) NOT NULL

 alter table Customer
 Add Zip int NOT NULL


CREATE TABLE Product
(ProductID int NOT NULL IDENTITY(1001,1) PRIMARY KEY,
ProductName varchar(100) NOT NULL,
ProductSize varchar(50) NULL,
Thickness varchar(50) NULL,
Tanning varchar(100) NULL,
Grade varchar(30) NULL,
Color varchar(30) NULL,
CuttingType varchar(50) NULL,
ProductPrice Money NOT NULL,
ProductHSCode varchar(50) NOT NULL
);

create table Supplier(
 SupplierID int NOT NULL IDENTITY(2001,1) PRIMARY KEY,
 SupplierName varchar(120) NOT NULL,
 SupplierEmail varchar(50) NULL,
 SupplierPhone varchar(20) NULL UNIQUE,
 SupplierInstantMessengerType varchar(30) NULL,
 SupplierInstantMessengerValue varchar(50) NULL,
 SupplierAddress varchar(250) NOT NULL,
 Country varchar(100) NOT NULL,
 Zip int NOT NULL
 );
 select * from Supplier

drop table Supplier

 create table PurchaseOrder(
PurchaseOrderID int NOT NULL IDENTITY(4001,1) PRIMARY KEY,
SupplierID int NOT NULL FOREIGN KEY REFERENCES Supplier(SupplierID),
ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
PurchaseQuantity int NOT NULL,
PurchaseOrderDate Date NOT NULL,
PurchaseTotalPrice Money NOT NULL,
PurchasePaymentTerm varchar(100) NOT NULL,
PurchasePaymentStatus varchar(20) NOT NULL,
PurchaseDeliveryDate Date
);

ALTER TABLE PurchaseOrder
ADD PaidAmount money NOT NULL

ALTER TABLE PurchaseOrder
ADD DueAmount money NULL


Create table SalesOrder(
SalesOrderID int NOT NULL IDENTITY(5001,1) PRIMARY KEY,
CustomerID int NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
SaleQuantity int NOT NULL,
SaleOrderDate Date NOT NULL,
SaleTotalPrice Money NOT NULL,
SalePaymentTerm varchar(100) NOT NULL,
SalePaymentStatus varchar(20) NOT NULL,
SaleDeliveryDate Date NOT NULL
);

ALTER TABLE SalesOrder
ADD PaidAmount money NOT NULL

ALTER TABLE SalesOrder
ADD DueAmount money NULL

Create table Shipment(
ShipmentID int NOT NULL IDENTITY(6001,1) PRIMARY KEY,
SalesOrderID int NULL FOREIGN KEY REFERENCES SalesOrder(SalesOrderID),
PurchaseOrderID int NULL FOREIGN KEY REFERENCES PurchaseOrder(PurchaseOrderID),
Origin varchar(60) NOT NULL,
DestinationPort varchar(100) NOT NULL,
TransportationMode varchar(20) NOT NULL,
EstimatedArrivalDate Date NOT NULL
);


CREATE TABLE Documentation
(DocumentID int NOT NULL IDENTITY(7001,1) PRIMARY KEY,
ShipmentID int NOT NULL FOREIGN KEY REFERENCES Shipment(ShipmentID),
DocumentType varchar(20) NOT NULL,
BillOfLading varchar(30) NULL UNIQUE,
CertificateOfOrigin varchar(30) NULL,
PackingList varchar(30) NULL,
CommercialInvoice varchar(30) NULL,
HealthCertificate varchar(30) NULL,
TestCertificate varchar(50) NULL,
);

CREATE TABLE [User]
(ID int NOT NULL IDENTITY(8001,1) PRIMARY KEY,
UserID varchar(50) NOT NULL UNIQUE,
Name varchar(50) NOT NULL,
Password varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
SecurityQuestion varchar(200) NOT NULL,
Answer varchar(150) NOT NULL,
Phone varchar(50) NOT NULL
);

select * from [User];
