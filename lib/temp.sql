-- Create Database
DROP DATABASE IF EXISTS RestaurantManagement
CREATE DATABASE RestaurantManagement
USE RestaurantManagement;
--Deoping  Tables if these already exists
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS LoyaltyProgram;
DROP TABLE IF EXISTS OrderTracking;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Restaurant;
-- Table to store individual details about each of the three restaurants, such as the address.
CREATE TABLE Restaurants (
    RestaurantId INT PRIMARY KEY NOT NULL,
    Name_ VARCHAR(250) NOT NULL,
    Address_ VARCHAR(250) NOT NULL,
    Email VARCHAR(250)  DEFAULT 'not provided' NOT NULL,
    Telephone VARCHAR(20) NOT NULL
);

-- Table to Store details about the menu items
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY NOT NULL,
    Description_ VARCHAR(250) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Vegetarian BIT NOT NULL,
    Vegan BIT NOT NULL,
    ContainsNuts BIT NOT NULL,
    GlutenFree BIT NOT NULL
);

--3.Customer details Address, Email, mobile phone number, etc.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY NOT NULL,
    Name_ VARCHAR(250) NOT NULL,
    Address_ VARCHAR(250) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Mobile VARCHAR(20) NOT NULL
);

--4.	Customer orders
--All food items purchased must be assigned to an order
--Any food adjustments, e.g., no gherkins on pizza
--Which restaurant the order has been made to
--Who has ordered the food with a linked delivery 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
	FoodAdjustments VARCHAR(255) DEFAULT 'No Adjustment Added' NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

--OrderItems table to store order item in a order
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY NOT NULL,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
	Quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);				  

-- EXTRA FETURES 
--Create OrderTracking to keep track of order weather it is recieved or concelled and 
--store delivery status and  eistimated delivery time
CREATE TABLE OrderTracking (			  
    OrderTrackinID INT PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,
    DeliveryStatus VARCHAR(50) NOT NULL,
    EstimatedDeliveryTime DATETIME NOT NULL,
    DeliveryAddress VARCHAR(250) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
--LoyaltyProgram table to store weather custoomer orderd in spcifc time period 
--if yes then add him to loyality program and set start and end of loyality program 
CREATE TABLE LoyaltyProgram (
    LoyalProgID INT PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Feedback table to store feedback from customer
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    FeedbackMessage VARCHAR(MAX) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--inserting data into Restaurants table
INSERT INTO Restaurants (RestaurantID, Name_, Address_, Email, Telephone)
VALUES
    (1, 'Tropical Island Desserts', '10 Fruit Street, Durian, Cheshire, UK', 'Tropical.Islands@DragonFruit.com', '01244 354 2234'),
    (2, 'Cheesy Cheeseria', '45 Brie Avenue, Stilton, Merseyside, UK', 'Cheesy.Cheese@Rockfort.co.uk', '0151 339 0232'),
    (3, 'Carrot Top', '626 Legume Road, Brussels, Belgium', 'andreww@info.uk', '0151 339 3221');
-- inserting data into MenuItems table
INSERT INTO MenuItems (MenuItemID, Description_, Category, Price, Vegetarian, Vegan, ContainsNuts, GlutenFree)
VALUES (1, 'Banana Special', 'Dessert', 2.99, 1, 1, 0, 0),
    (2, 'Three Fruit Salad', 'Salad', 4.99, 1, 1, 0, 0),
    (3, 'Fruit and Cheese Skewer', 'Starter', 1.99, 1, 0, 0, 0),
    (4, 'Cheesy Margherita Pizza', 'Main', 5.99, 1, 0, 0, 0),
    (5, 'Mozzarella Lasagne', 'Main', 6.99, 0, 0, 0, 0),
    (6, 'Cheese Board', 'Dessert', 3.99, 0, 0, 0, 0),
    (7, 'Rabbit Food Special', 'Main', 4.99, 1, 1, 0, 0),
    (8, 'Herbivorous Burger', 'Main', 5.99, 1, 0, 0, 0),
    (9, 'Courgette Frittata', 'Main', 4.5, 1, 0, 0, 0);

-- inserting data into Customers table
INSERT INTO Customers (CustomerID, Name_, Address_, Email, Mobile)
VALUES (1, 'Eric Wimp', '29 Acacia Road, Nutty town', 'BananaMad@Dandy.com', '07845 263 374'),
    (2, 'William Benn', '52 Festive Road, London', 'MrBenn@fancydress.com', '07326 629551'),
    (3, 'Dougal Dog', '36 Magic Garden, Magic Roundabout', 'Dougal@Magic.com', '05638 384 938');

-- inserting data into Orders table
INSERT INTO Orders (OrderID, CustomerID, RestaurantID, OrderDate, FoodAdjustments)
VALUES (1, 1, 1, GETDATE(), 'No gherkins on pizza'),
    (2, 2, 2, GETDATE(), 'No adjustment added'),
    (3, 3, 3, GETDATE(), 'No adjustment added');

-- inserting data into OrderItems table
INSERT INTO OrderItems (OrderItemID, OrderID, MenuItemID,Quantity)
VALUES
    (1, 1, 1,1),
    (2, 2, 4,1),
    (3, 2, 6,1),
    (4, 3, 7,1),
    (5, 3, 9,1);
-- inserting data into OrderTracking table
INSERT INTO OrderTracking ( OrderTrackinID ,OrderID, OrderStatus, DeliveryStatus, EstimatedDeliveryTime, DeliveryAddress)
VALUES (1,1, 'Order Received', 'Out for Delivery', DATEADD(HOUR, 1, GETDATE()), '29 Acacia Road, Nutty town'),
     (2,2, 'Order Received', 'Out for Delivery', DATEADD(HOUR, 2, GETDATE()), '52 Festive Road, London'),
     (3,3, 'Order Received', 'Out for Delivery', DATEADD(HOUR, 3, GETDATE()), '36 Magic Garden, Magic Roundabout');

-- inserting  data into LoyaltyProgram table
INSERT INTO LoyaltyProgram (LoyalProgID,CustomerID, StartDate, EndDate)
VALUES
    (1,1, GETDATE(), DATEADD(WEEK, 2, GETDATE()));

-- inserting data into Feedback table
INSERT INTO Feedback (FeedbackID, CustomerID, FeedbackMessage)
VALUES (1, 1, 'Great food and fast delivery!'),
    (2, 2, 'Loved the cheesy margherita pizza!'),
    (3, 3, 'Healthy and delicious vegetarian options.');

-- Checking inserted Data
SELECT * FROM Restaurants;
SELECT * FROM MenuItems;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderItems
SELECT * FROM OrderTracking;
SELECT * FROM LoyaltyProgram;
SELECT * FROM Feedback;
