--Schema Design:

--1. Vehicle Table:

CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    year INT,
    dailyRate DECIMAL(10, 2),
    status VARCHAR(20) CHECK (status IN ('available', 'notAvailable')),
    passengerCapacity INT,
    engineCapacity DECIMAL(10, 2)
);


--2. Customer Table:

CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    phoneNumber VARCHAR(20)
);


--3. Lease Table:

CREATE TABLE Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT,
    customerID INT,
    startDate DATE,
    endDate DATE,
    type VARCHAR(20) CHECK (type IN ('DailyLease', 'MonthlyLease')),
    FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

--4. Payment Table:

CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
);

--Inserting values for the above tables

-- Inserting data into the Vehicle table
INSERT INTO Vehicle (vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES
    (1, 'Toyota', 'Camry', 2020, 50.00, 'available', 5, 2.5),
    (2, 'Honda', 'Accord', 2019, 55.00, 'available', 5, 2.4),
    (3, 'Ford', 'Mustang', 2021, 70.00, 'notAvailable', 4, 5.0),
    (4, 'Chevrolet', 'Cruze', 2018, 45.00, 'available', 5, 1.8),
    (5, 'Nissan', 'Altima', 2020, 52.00, 'available', 5, 2.0);

-- Inserting data into the Customer table
INSERT INTO Customer (customerID, firstName, lastName, email, phoneNumber)
VALUES
    (1, 'Rahul', 'Gupta', 'rahul@example.com', '9876543210'),
    (2, 'Priyanka', 'S', 'priyanka@example.com', '9876543211'),
    (3, 'Amritha', 'P', 'amritha@example.com', '9876543212'),
    (4, 'Anjali', 'Kumari', 'anjali@example.com', '9876543213'),
    (5, 'Sneha', 'K', 'sneha@example.com', '9876543214');


-- Inserting data into the Lease table
INSERT INTO Lease (leaseID, vehicleID, customerID, startDate, endDate, type)
VALUES
    (11, 1, 1, '2024-05-15', '2024-05-20', 'DailyLease'),
    (12, 2, 2, '2024-06-01', '2024-07-01', 'MonthlyLease'),
    (13, 3, 3, '2024-06-10', '2024-06-15', 'DailyLease'),
    (14, 4, 4, '2024-07-05', '2024-07-10', 'DailyLease'),
    (15, 5, 5, '2024-08-01', '2024-08-05', 'DailyLease');

-- Inserting data into the Payment table
INSERT INTO Payment (paymentID, leaseID, paymentDate, amount)
VALUES
    (1, 11, '2024-05-18', 200.00),
    (2, 12, '2024-06-10', 1000.00),
    (3, 13, '2024-06-12', 150.00),
    (4, 14, '2024-07-08', 180.00),
    (5, 15, '2024-08-03', 250.00);

select * from Vehicle
select * from Customer
select * from Lease
select * from Payment


