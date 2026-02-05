CREATE SCHEMA Foxdb;
CREATE TABLE Foxdb.Products(
	ProductID INT PRIMARY KEY, 
	Name VARCHAR(32) NOT NULL,
	Description TINYTEXT,
	Price decimal(9,2) NOT NULL,
	Stock INT UNSIGNED DEFAULT 0
);
CREATE TABLE Foxdb.Customers(
	CustomerID INT PRIMARY KEY,
	Name TINYTEXT NOT NULL,
	Address TINYTEXT NOT NULL
);
CREATE TABLE Foxdb.Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
	Status ENUM('Unpaid','Paid','Packaged','Delivered'),
	Time DATETIME,
	CustomerID INT,
	CONSTRAINT FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE RESTRICT
);
CREATE TABLE Foxdb.OrderItems(
	OrderItemID INT PRIMARY KEY,
	ORDERID INT,
	Idx int,
    ProductID Int,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderId) ON DELETE CASCADE, 
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
CREATE TABLE Foxdb.Images(
	--Indexing should be worked on
	ImageID INT PRIMARY KEY,
	Productid Index, 
	Idx int UNSIGNED REFERENCES OrderItems(Idx),
	ImagePath TINYTEXT
);
CREATE TABLE Foxdb.Admins(
	AdminID INT PRIMARY KEY,
	Username VARCHAR(20) NOT NULL,
	Password TINYTEXT NOT NULL
);