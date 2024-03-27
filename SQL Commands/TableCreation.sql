create database bookstore;

use bookstore;

CREATE TABLE Authors (
	AuthorID INT PRIMARY KEY AUTO_INCREMENT,
	FirstName VARCHAR(255),
	LastName VARCHAR(255)
);

CREATE TABLE Genres (
	GenreID INT PRIMARY KEY AUTO_INCREMENT,
	GenreName VARCHAR(255)
);
	
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	Email VARCHAR(255),
	Address VARCHAR(255)
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
	CustomerID INT,
	OrderDate DATE,
	TotalAmount DECIMAL(10, 2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
	
CREATE TABLE Payments (
	PaymentID INT PRIMARY KEY AUTO_INCREMENT,
	OrderID INT,
	PaymentDate DATE,
	Amount DECIMAL(10, 2),
	PaymentMethod VARCHAR(50),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Publishers (
	PublisherID INT PRIMARY KEY AUTO_INCREMENT,
	PublisherName VARCHAR(255),
	Address VARCHAR(255)
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY AUTO_INCREMENT,
	ISBN VARCHAR(30),
	Title VARCHAR(255),
	AuthorID INT,
	FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
	GenreID INT,
	PublisherID INT,
	PublicationDate DATE,
	Price DECIMAL(10, 2),
	StockQuantity INT,
	FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
	FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
	OrderID INT,
	BookID INT,
	Quantity INT,
	Price DECIMAL(10, 2),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Reviews (
	ReviewID INT PRIMARY KEY AUTO_INCREMENT,
	BookID INT,
	CustomerID INT,
	Rating DECIMAL(2, 1),
	Comment TEXT,
	ReviewDate DATE,
	FOREIGN KEY (BookID) REFERENCES Books(BookID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);