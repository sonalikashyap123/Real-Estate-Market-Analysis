
CREATE DATABASE IF NOT EXISTS real_estate;
USE real_estate;
CREATE TABLE builders(builder_id INT PRIMARY KEY,builder_name VARCHAR(100),experience_years INT,total_projects INT,rating DECIMAL(2,1));
CREATE TABLE locations(location_id INT PRIMARY KEY,city VARCHAR(50),locality VARCHAR(100),crime_rate VARCHAR(20),schools_nearby INT,hospitals_nearby INT,metro_distance_km DECIMAL(3,1));
CREATE TABLE properties(property_id INT PRIMARY KEY,property_name VARCHAR(100),city VARCHAR(50),locality VARCHAR(100),property_type VARCHAR(30),builder_id INT,bedrooms INT,bathrooms INT,area_sqft INT,price DECIMAL(12,2),furnishing VARCHAR(20),age_of_property INT,listing_date DATE,FOREIGN KEY(builder_id) REFERENCES builders(builder_id));
CREATE TABLE buyers(buyer_id INT PRIMARY KEY,buyer_name VARCHAR(100),gender VARCHAR(10),age INT,city VARCHAR(50),occupation VARCHAR(50),annual_income DECIMAL(12,2));
CREATE TABLE sales(sale_id INT PRIMARY KEY,property_id INT,buyer_id INT,sale_date DATE,selling_price DECIMAL(12,2),payment_method VARCHAR(20),FOREIGN KEY(property_id) REFERENCES properties(property_id),FOREIGN KEY(buyer_id) REFERENCES buyers(buyer_id));
INSERT INTO builders VALUES
(1,'Lodha',25,120,4.8),(2,'Godrej Properties',18,90,4.6),(3,'Prestige Group',30,150,4.9),(4,'DLF',35,200,4.7),(5,'Sobha',28,110,4.8);
INSERT INTO locations VALUES
(1,'Mumbai','Andheri','Low',12,8,0.8),(2,'Mumbai','Powai','Low',10,6,1.2),(3,'Pune','Hinjewadi','Medium',8,5,2.0),(4,'Bangalore','Whitefield','Medium',11,7,1.5),(5,'Hyderabad','Gachibowli','Low',9,6,1.8);
INSERT INTO properties VALUES
(1,'Sky Heights','Mumbai','Andheri','Apartment',1,2,2,950,18500000,'Furnished',2,'2025-01-10'),
(2,'Lake View','Mumbai','Powai','Apartment',2,3,3,1450,32500000,'Semi-Furnished',1,'2025-02-15'),
(3,'Tech Residency','Pune','Hinjewadi','Apartment',5,2,2,980,9200000,'Unfurnished',3,'2024-12-01'),
(4,'Green Villas','Bangalore','Whitefield','Villa',3,4,4,2800,42000000,'Furnished',1,'2025-03-05'),
(5,'Elite Towers','Hyderabad','Gachibowli','Penthouse',4,4,4,3100,55000000,'Furnished',0,'2025-04-20');
INSERT INTO buyers VALUES
(1,'Rahul Sharma','Male',32,'Mumbai','Software Engineer',1800000),
(2,'Priya Patel','Female',29,'Pune','Doctor',2400000),
(3,'Amit Verma','Male',41,'Bangalore','Business',4500000),
(4,'Neha Singh','Female',35,'Hyderabad','Manager',2200000),
(5,'Karan Mehta','Male',38,'Mumbai','CA',3000000);
INSERT INTO sales VALUES
(1,1,1,'2025-02-01',18250000,'Loan'),
(2,2,5,'2025-03-10',32000000,'Loan'),
(3,3,2,'2025-01-15',9100000,'Cash'),
(4,4,3,'2025-04-01',41500000,'Loan'),
(5,5,4,'2025-05-02',54500000,'Loan');
