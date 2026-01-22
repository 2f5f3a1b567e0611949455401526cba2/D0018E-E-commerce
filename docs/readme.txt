@ Project Design Decitions:
	- Avoid ALL Javascript
	- Don't require Customers to Login

@ Problem Statement:
	Goals: (Features for MVP)
	- User Roles (Customer & Admin)
	- Have a webpage
	- Use Relational DB
	- Shopping basket
	- Comments and Ratings 

@ Scope: (Wished Features)
	- Purchase History
	- Admin Power (Add product, Add stock, Remove Stock, Stock Status, Remove Comments)

@ Stack:
	- XAMPP to install LAMP:Linux,Apache,MarinaDB,PHP

@ Cookies:
 To avoid needing customers to login we keep client state in cookies
 The following Cookies are used:
	
	$Shopping_History = [Array(OrderID)]
	Lifetime = 3 months (since last visit)
 To Keep track of the purchase history 
 
	$Shopping_Cart = [Array(ProductID)]
	Lifetime = 1 week (Since last visit)
 To Keep track of products the customer intended to buy but didn't

	$User_Info = [Array(String -> String)] 
		"Name" => ""
		"Address" => ""
	Lifetime <same as $Shopping_History> (since last visit)
 To make purchases convinient.

	$Session = [String] 
	Lifetime = 24 Hours
 To allow Admins to manage the site in a convinent way.


@ Schema

CREATE SCHEMA db;
CREATE TABLE db.Products (
	pID   INT     PRIMARY KEY   // Product ID
	price INT                   // 
	desc  VARCHAR(100) NON NULL // Description
	imgs  VARCHAR(100) NON NULL // Imagepath 
	stock INT                   // 
	stock_Status ENUM('InStock', 'OutofStock')
);
CREATE TABLE db.Transactions (
	oID   INT     PRIMARY KEY   // Order ID
	pID   INT                   // 
	tID   INT                   // Transaction ID 
	                            // (For monotoring purchase status)
	trans_Status ENUM('Unpaid', 'InProgress', 'Paid')
	utime BIGINT								// Unix Time & date
	price BIGINT                //
	count INT                   // 
	name  VARCHAR(100) NON NULL // Customer Full Name 
	addr  VARCHAR(100) NON NULL // Customer Address
);
CREATE TABLE db.Admins (
	uID   INT     PRIMARY KEY   // UserID
	name  VARCHAR(100) NON NULL //
	pass  VARCHAR(256) NOT NULL // Hashed Name SHA256
);
CREATE TABLE db.Reviews (
	cID   INT     PRIMARY KEY   // Comment ID 
	pID   INT                   // 
	score INT                   // Score / Review
	msg   VARCHAR(100)          // Comment message
);


