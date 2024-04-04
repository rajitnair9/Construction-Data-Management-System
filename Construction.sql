
-- Create database
CREATE DATABASE constructions;
USE constructions;

-- Contractor table
CREATE TABLE Contractor (
    cid INT AUTO_INCREMENT PRIMARY KEY,
    cname VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone BIGINT UNIQUE
);

-- Project table
CREATE TABLE Project (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    pname VARCHAR(100),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    cid INT,
    FOREIGN KEY (cid) REFERENCES Contractor(cid)
);

-- Project Phase table
CREATE TABLE ProjectPhase (
    phase_id INT AUTO_INCREMENT PRIMARY KEY,
    phase_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    pid INT,
    FOREIGN KEY (pid) REFERENCES Project(pid)
);

-- Client table
CREATE TABLE Client (
    clid INT AUTO_INCREMENT PRIMARY KEY,
    clname VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone BIGINT UNIQUE,
    location_availability VARCHAR(100)
);

-- Products table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    clid INT,
    FOREIGN KEY (clid) REFERENCES Client(clid)
);

-- Counselor table
CREATE TABLE Counselor (
    coid INT AUTO_INCREMENT PRIMARY KEY,
    coname VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone BIGINT UNIQUE
);

-- Subscription table

-- Create Subscription table with foreign keys
CREATE TABLE Subscription (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    subscription_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    amount DECIMAL(10, 2),
    clid INT,
    cid INT,
    coid INT,
    FOREIGN KEY (clid) REFERENCES Client(clid),
    FOREIGN KEY (cid) REFERENCES Contractor(cid),
    FOREIGN KEY (coid) REFERENCES Counselor(coid),
    CONSTRAINT exclusive_subscription_arc 
        CHECK (
            (clid IS NOT NULL AND cid IS NULL) OR
            (clid IS NULL AND cid IS NOT NULL)
        )
);



ALTER TABLE Contractor AUTO_INCREMENT = 1;

ALTER TABLE Project AUTO_INCREMENT = 101;

ALTER TABLE ProjectPhase AUTO_INCREMENT = 1001;

ALTER TABLE Client AUTO_INCREMENT = 501;

ALTER TABLE Products AUTO_INCREMENT = 601;

ALTER TABLE Counselor AUTO_INCREMENT = 301;

ALTER TABLE Subscription AUTO_INCREMENT = 801;



-- Inserting sample data into Contractor table
-- Step 3: Insert data into the modified Contractor table without specifying the cid column
INSERT INTO Contractor (cname, contact_person, email, phone)
VALUES 
    ('Shivam Constructions', 'Amit Sharma', 'amit.sharma@gmail.com', 9123456789),
    ('Rajendra Infrastructures', 'Rajendra Singh', 'rajendra.singh@gmail.com', 9234567890),
    ('Ganpati Builders', 'Vikas Patil', 'vikas.patil@gmail.com', 9345678901),
    ('Mumbai Metro Builders', 'Suresh Shah', 'suresh.shah@gmail.com', 9456789012),
    ('Delhi Developers', 'Preeti Gupta', 'preeti.gupta@gmail.com', 9567890123);
select * from contractor;

-- Inserting sample data into Project table
INSERT INTO Project (pname, location, start_date, end_date, cid)
VALUES 
    ('Skyline Apartments', 'Mumbai', '2024-01-01', '2025-01-01', 1),
    ('Grand Mall Renovation', 'Delhi', '2024-02-15', '2024-12-31', 2),
    ('Tech Park Construction', 'Bengaluru', '2023-10-01', '2025-06-30', 3),
    ('Fitness Center Construction', 'Hyderabad', '2024-05-05', '2025-09-30', 4),
    ('Highway Expansion Project', 'Chennai', '2024-04-20', '2025-10-31', 5),
    ('Gowardhan Apartments', 'Mumbai', '2023-01-01', '2024-01-01', 1),
    ('IT Park Construction', 'Pune', '2024-07-15', '2025-12-31', 2),
    ('Shopping Complex Renovation', 'Kolkata', '2024-08-01', '2025-06-30', 3),
    ('Airport Terminal Expansion', 'Hyderabad', '2023-12-01', '2025-09-30', 4),
    ('Residential Township', 'Bengaluru', '2024-03-15', '2026-05-31', 5),
    ('Hospital Construction', 'Chennai', '2024-05-20', '2025-08-31', 1),
    ('Educational Institution Building', 'Lucknow', '2024-09-01', '2026-03-31', 2);
select * from project;

-- Inserting sample data into ProjectPhase table
-- Inserting sample data into ProjectPhase table
INSERT INTO ProjectPhase (phase_name, start_date, end_date, pid)
VALUES 
    ('Planning', '2024-01-01', '2024-03-31', 101),
    ('Construction', '2024-04-01', '2024-06-30', 101),
    ('Finishing', '2024-07-01', '2024-09-30', 101),
    ('Planning', '2024-02-15', '2024-03-31', 102),
    ('Construction', '2024-04-01', '2024-06-30', 102),
    ('Finishing', '2024-07-01', '2024-09-30', 102),
    ('Planning', '2023-10-01', '2023-12-31', 103),
    ('Construction', '2024-01-01', '2024-06-30', 103),
    ('Finishing', '2024-07-01', '2024-09-30', 103),
    ('Planning', '2024-05-05', '2024-07-31', 104),
    ('Construction', '2024-08-01', '2024-12-31', 104),
    ('Finishing', '2025-01-01', '2025-04-30', 104),
    ('Planning', '2024-04-20', '2024-06-30', 105),
    ('Construction', '2024-07-01', '2024-12-31', 105),
    ('Finishing', '2025-01-01', '2025-03-31', 105);

    
-- Inserting sample data into Client table
-- Inserting sample data into Client table without clid
INSERT INTO Client (clname, contact_person, email, phone, location_availability)
VALUES 
    ('IKEA', 'Rahul Sharma', 'rahul.sharma@gmail.com', 9988776655, 'Mumbai'),
    ('Asian Paints', 'Priya Patel', 'priya.patel@gmail.com', 9876543210, 'Delhi'),
    ('Ambuja Cement', 'Sandeep Singh', 'sandeep.singh@gmail.com', 9765432109, 'Jaipur'),
    ('TMT Bars Ltd.', 'Amit Gupta', 'amit.gupta@gmail.com', 9654321098, 'Kolkata'),
    ('L&T Construction', 'Rakesh Verma', 'rakesh.verma@gmail.com', 9543210987, 'Chennai');
    
-- Inserting sample data into Products table without product_id
INSERT INTO Products (product_name, clid)
VALUES 
    ('Wooden Furniture', 501),
    ('Paint Brushes', 502),
    ('Cement Bags', 503),
    ('Steel Bars', 504),
    ('Construction Machinery', 505),
    ('Lighting Fixtures', 501),
    ('Interior Paints', 502),
    ('Concrete Blocks', 503),
    ('Steel Rods', 504),
    ('Excavators', 505),
    ('Carpets', 501),
    ('Exterior Paints', 502),
    ('Bricks', 503),
    ('Rebar Cutters', 504),
    ('Concrete Mixers', 505);

    
-- Inserting sample data into Counselor table without coid
INSERT INTO Counselor (coname, email, phone)
VALUES 
    ('Arun Sharma', 'arun.sharma@gmail.com', 9876543210),
    ('Priya Gupta', 'priya.gupta@gmail.com', 8765432109),
    ('Rakesh Patel', 'rakesh.patel@gmail.com', 7654321098),
    ('Snehal Shah', 'snehal.shah@gmail.com', 6543210987),
    ('Neha Verma', 'neha.verma@gmail.com', 5432109876);



-- Create a new Subscription table for clients

-- Inserting sample data into Subscription table
INSERT INTO Subscription (subscription_type, start_date, end_date, amount, clid, cid, coid)
VALUES 
    ('Basic', '2024-01-01', '2024-12-31', 6000.00, 501, NULL, NULL),
    ('Basic', '2024-02-15', '2024-12-31', 6000.00, NULL, 1, NULL), 
    ('Premium', '2023-10-01', '2025-06-30', 12000.00, 502, NULL, 301), 
    ('Basic', '2024-05-05', '2025-09-30', 6000.00, NULL, 2, NULL), 
    ('Premium', '2024-04-20', '2025-10-31', 12000.00, 503, NULL, 302), 
    ('Basic', '2024-07-01', '2024-12-31', 6000.00, 504, NULL, NULL), 
    ('Premium', '2024-03-15', '2025-03-14', 12000.00, NULL, 3, 303), 
    ('Basic', '2023-12-01', '2024-11-30', 6000.00, 505, NULL, NULL), 
    ('Premium', '2024-08-01', '2025-07-31', 12000.00, 504, NULL, 304), 
    ('Basic', '2024-09-15', '2025-09-14', 6000.00, NULL, 4, NULL), 
    ('Premium', '2023-11-01', '2024-10-31', 12000.00, 505, NULL, 305), 
    ('Basic', '2024-06-15', '2025-06-14', 6000.00, NULL, 5, NULL); 
    
    
select * FROM subscription;
select * from contractor;
select * from project;
select * from projectphase;
select * from client;
select * from products;
select * from counselor;
select * from subscription;


SELECT location, COUNT(*) AS project_count
FROM Project
GROUP BY location;




-- using joins for data analysis
#TOP 5 clients by revenue:
select c.clname as client_name,sum(s.amount) as total_revenue from client c 
join subscription s on s.clid=c.clid group by c.clname order by total_revenue desc limit 5 ;

-- list of contractors with their total subscription amount
SELECT c.*, SUM(s.amount) AS total_amount
FROM Contractor c
LEFT JOIN Subscription s ON c.cid = s.cid
GROUP BY c.cid;

-- number of premimum subscribers as per location
SELECT c.location_availability, COUNT(*) AS premium_subscriptions
FROM Subscription s
JOIN Client c ON s.clid = c.clid
WHERE s.subscription_type = 'Premium'
GROUP BY c.location_availability;

-- Displaying phase information with project_name
SELECT p.pname AS project_name,concat(pp.phase_name,' ','phase') as phase_name , 
pp.start_date,pp.end_date
FROM Project p
JOIN ProjectPhase pp ON p.pid = pp.pid;

-- displaying counselor along with their subscribers and subscriber_type
SELECT co.coname AS counselor_name, 
       CASE WHEN c.clid IS NOT NULL THEN c.clname WHEN cc.cid IS NOT NULL THEN cc.cname ELSE NULL
       END AS subscriber_name, CASE WHEN c.clid IS NOT NULL THEN 'Clients' WHEN cc.cid IS NOT NULL THEN 'Contractor' ELSE NULL END AS subscriber_type
FROM Counselor co JOIN Subscription s ON co.coid = s.coid
LEFT JOIN Client c ON s.clid = c.clid 
LEFT JOIN Contractor cc ON s.cid = cc.cid
WHERE s.subscription_type = 'Premium';

select * from subscription;
select * from client;
select * from contractor;

-- diplaying product_names and product count by client
SELECT c.clname AS client_name, COUNT(p.product_id) AS no_of_products, 
GROUP_CONCAT(p.product_name separator ', ') AS product_names
FROM Products p 
JOIN Client c ON c.clid = p.clid 
GROUP BY c.clname;

-- displaying avg duration taken by contractors to complete their project
SELECT c.cname AS contractor_name,
	   truncate((AVG(DATEDIFF(p.end_date, p.start_date) /30) ),0) AS avg_project_duration_months
FROM Project p
JOIN Contractor c ON p.cid = c.cid
GROUP BY c.cname;

SELECT clname AS client_name, 
       (SELECT SUM(amount) FROM Subscription WHERE clid = Client.clid) AS total_revenue
FROM Client;


SELECT round(AVG(DATEDIFF(end_date, start_date) / 30),2)AS avg_duration_months
FROM Project;

SELECT c.cname AS contractor_name, 
       COUNT(p.pid) AS project_count
FROM Contractor c
LEFT JOIN Project p ON c.cid = p.cid
GROUP BY c.cname;

select date_format('2000-01-27','%d-%c-%Y');


use constructions;
select * from subscription;
#single row
select max(amount) from subscription;
select * from subscription where amount =(select max(amount) from subscription);

select sub_id from subscription where subscription_type like 'Premium';
select * from subscription where sub_id in (select sub_id from subscription where subscription_type like 'Premium');








