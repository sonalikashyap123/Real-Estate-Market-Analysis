create database real_estates;
use real_estates;

create table Property_Type (
Type_id int primary key auto_increment,
Type_name varchar(50) not null unique,
Description varchar(300));
desc Property_Type;

create table Location (
Location_id int primary key auto_increment,
City varchar(100) not null,
State varchar(100) not null,
Locality varchar(100) not null,
Zip_code varchar(10) not null);
desc Location;

create table Properties (
Property_id int primary key auto_increment,
Property_name varchar(100) not null,
Type_id int not null,
Location_id int not null,
Price decimal(12,2) not null check (price > 0),
Area_sqft int not null check (Area_sqft > 0),
Bedroooms int default 0,
Bathrooms int default 0,
Status enum('Available','Sold','Booked') default 'Available',
Listing_date date not null,
foreign key (Type_id) references Property_Type(Type_id),
foreign key (Location_id) references Location(Location_id));
desc Properties;

create table Customers (
Customer_id int primary key auto_increment,
Customer_name varchar(100) not null,
Phone varchar(15) not null unique,
Email varchar(50) not null unique,
Budget decimal(12,2) not null check (Budget >=0));
desc Customers;

create table Agents (
Agent_id int primary key auto_increment,
Agent_name varchar(100) not null,
Phone varchar(15) not null unique,
Email varchar(100) not null unique,
Experience int default 0 check (Experience >=0),
Commission_percent decimal(5,2) default 2.00 check (Commission_percent >= 0));
desc Agents;

CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    Property_ID INT NOT NULL UNIQUE,
    Customer_ID INT NOT NULL,
    Agent_ID INT NOT NULL,
    Transaction_Date DATE NOT NULL,
    Selling_Price DECIMAL(12,2) NOT NULL CHECK (Selling_Price > 0),
    Payment_Mode ENUM('Cash','Loan','Online','Cheque') DEFAULT 'Online',
    FOREIGN KEY (Property_ID)
        REFERENCES Properties(Property_ID),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Agent_ID)
        REFERENCES Agents(Agent_ID));
        desc Transactions;

-- inserting values
insert into Property_Type (Type_ID, Type_Name, Description) values
(1, 'Apartment', 'Multi-storey residential apartment'),
(2, 'Villa', 'Independent luxury villa'),
(3, 'Penthouse', 'Luxury penthouse apartment'),
(4, 'Studio Apartment', 'Compact single-room apartment'),
(5, 'Duplex', 'Two-floor residential property'),
(6, 'Row House', 'Connected independent residential house'),
(7, 'Independent House', 'Standalone residential house'),
(8, 'Residential Plot', 'Land for residential construction'),
(9, 'Commercial Office', 'Office space for businesses'),
(10, 'Retail Shop', 'Commercial retail shop'),
(11, 'Showroom', 'Large commercial showroom'),
(12, 'Warehouse', 'Storage and warehouse property'),
(13, 'Industrial Shed', 'Industrial manufacturing shed'),
(14, 'Farm House', 'Farmhouse with agricultural land'),
(15, 'Office Floor', 'Entire office floor for commercial use'),
(16, 'Builder Floor', 'Independent builder floor apartment'),
(17, 'Serviced Apartment', 'Fully furnished serviced apartment'),
(18, 'Co-working Space', 'Shared office workspace'),
(19, 'Business Centre', 'Commercial business center'),
(20, 'IT Park Office', 'Office space in IT park'),
(21, 'Commercial Plot', 'Land for commercial development'),
(22, 'Residential Bungalow', 'Luxury independent bungalow'),
(23, 'Vacation Home', 'Holiday residential property'),
(24, 'Mixed Use Property', 'Residential and commercial combined'),
(25, 'Hostel Building', 'Residential hostel property'),
(26, 'PG Accommodation', 'Paying guest accommodation'),
(27, 'Shopping Complex', 'Commercial shopping complex'),
(28, 'Hotel Property', 'Hotel building and premises'),
(29, 'Resort Property', 'Resort and leisure property'),
(30, 'Luxury Condo', 'Premium condominium residence');
select * from Property_Type;

insert into Location (Location_ID, City, State, Locality, Zip_Code) values
(1,'Mumbai','Maharashtra','Bandra West','400050'),
(2,'Mumbai','Maharashtra','Andheri West','400053'),
(3,'Mumbai','Maharashtra','Powai','400076'),
(4,'Mumbai','Maharashtra','Goregaon East','400063'),
(5,'Mumbai','Maharashtra','Borivali West','400092'),
(6,'Mumbai','Maharashtra','Kandivali East','400101'),
(7,'Mumbai','Maharashtra','Chembur','400071'),
(8,'Mumbai','Maharashtra','Lower Parel','400013'),
(9,'Pune','Maharashtra','Baner','411045'),
(10,'Pune','Maharashtra','Wakad','411057'),
(11,'Pune','Maharashtra','Hinjewadi','411057'),
(12,'Pune','Maharashtra','Viman Nagar','411014'),
(13,'Thane','Maharashtra','Ghodbunder Road','400607'),
(14,'Thane','Maharashtra','Majiwada','400601'),
(15,'Thane','Maharashtra','Kasarvadavali','400615'),
(16,'Thane','Maharashtra','Manpada','400610'),
(17,'Navi Mumbai','Maharashtra','Vashi','400703'),
(18,'Navi Mumbai','Maharashtra','Nerul','400706'),
(19,'Navi Mumbai','Maharashtra','CBD Belapur','400614'),
(20,'Navi Mumbai','Maharashtra','Kharghar','410210'),
(21,'Bangalore','Karnataka','Whitefield','560066'),
(22,'Bangalore','Karnataka','Koramangala','560034'),
(23,'Bangalore','Karnataka','Electronic City','560100'),
(24,'Bangalore','Karnataka','HSR Layout','560102'),
(25,'Hyderabad','Telangana','Hitech City','500081'),
(26,'Hyderabad','Telangana','Gachibowli','500032'),
(27,'Hyderabad','Telangana','Financial District','500032'),
(28,'Delhi','Delhi','Connaught Place','110001'),
(29,'Delhi','Delhi','Saket','110017'),
(30,'Delhi','Delhi','Dwarka','110075');

insert into Agents
(Agent_ID, Agent_Name, Phone, Email, Experience, Commission_Percent)
values
(1,'Rahul Sharma','9876501001','rahul.sharma@urbanhomes.in',8,2.50),
(2,'Priya Mehta','9876501002','priya.mehta@urbanhomes.in',6,2.00),
(3,'Amit Verma','9876501003','amit.verma@urbanhomes.in',10,3.00),
(4,'Sneha Patil','9876501004','sneha.patil@urbanhomes.in',5,2.25),
(5,'Rohan Desai','9876501005','rohan.desai@urbanhomes.in',7,2.50),
(6,'Neha Kapoor','9876501006','neha.kapoor@urbanhomes.in',9,2.75),
(7,'Vikram Singh','9876501007','vikram.singh@urbanhomes.in',12,3.25),
(8,'Pooja Nair','9876501008','pooja.nair@urbanhomes.in',4,2.00),
(9,'Karan Malhotra','9876501009','karan.malhotra@urbanhomes.in',6,2.25),
(10,'Anjali Joshi','9876501010','anjali.joshi@urbanhomes.in',8,2.75),
(11,'Saurabh Gupta','9876501011','saurabh.gupta@urbanhomes.in',11,3.00),
(12,'Meera Kulkarni','9876501012','meera.kulkarni@urbanhomes.in',5,2.25),
(13,'Arjun Reddy','9876501013','arjun.reddy@urbanhomes.in',9,2.75),
(14,'Nikita Shah','9876501014','nikita.shah@urbanhomes.in',3,1.75),
(15,'Deepak Yadav','9876501015','deepak.yadav@urbanhomes.in',7,2.50),
(16,'Shweta Iyer','9876501016','shweta.iyer@urbanhomes.in',6,2.25),
(17,'Manish Jain','9876501017','manish.jain@urbanhomes.in',13,3.50),
(18,'Ritika Chavan','9876501018','ritika.chavan@urbanhomes.in',4,2.00),
(19,'Abhishek Mishra','9876501019','abhishek.mishra@urbanhomes.in',8,2.75),
(20,'Komal Arora','9876501020','komal.arora@urbanhomes.in',5,2.25),
(21,'Harsh Vora','9876501021','harsh.vora@urbanhomes.in',10,3.00),
(22,'Isha Khanna','9876501022','isha.khanna@urbanhomes.in',7,2.50),
(23,'Nitin Bansal','9876501023','nitin.bansal@urbanhomes.in',9,2.75),
(24,'Tanvi More','9876501024','tanvi.more@urbanhomes.in',4,2.00),
(25,'Yash Agarwal','9876501025','yash.agarwal@urbanhomes.in',6,2.25),
(26,'Aarti Deshmukh','9876501026','aarti.deshmukh@urbanhomes.in',11,3.25),
(27,'Rakesh Kumar','9876501027','rakesh.kumar@urbanhomes.in',12,3.50),
(28,'Simran Kaur','9876501028','simran.kaur@urbanhomes.in',5,2.25),
(29,'Mohit Saxena','9876501029','mohit.saxena@urbanhomes.in',8,2.75),
(30,'Divya Rao','9876501030','divya.rao@urbanhomes.in',7,2.50);

insert into Customers (Customer_ID, Customer_Name, Phone, Email, Budget) values
(1, 'Rajesh Gupta', '9811000001', 'rajesh.gupta@gmail.com', 8500000.00),
(2, 'Ananya Sharma', '9811000002', 'ananya.sharma@gmail.com', 12500000.00),
(3, 'Sonali Kashyap', '9811000003', 'vivek.patel@gmail.com', 9500000.00),
(4, 'Pooja Nair', '9811000004', 'pooja.nair@gmail.com', 7200000.00),
(5, 'Saniya Patil', '9811000005', 'kunal.mehta@gmail.com', 18000000.00),
(6, 'Sneha Joshi', '9811000006', 'sneha.joshi@gmail.com', 6500000.00),
(7, 'Rohan Gupta', '9811000007', 'rohan.kapoor@gmail.com', 14000000.00),
(8, 'Neha Verma', '9811000008', 'neha.verma@gmail.com', 11000000.00),
(9, 'Amit Desai', '9811000009', 'amit.desai@gmail.com', 9000000.00),
(10, 'Priyanka Singh', '9811000010', 'priyanka.singh@gmail.com', 15500000.00),
(11, 'Harsh Agarwal', '9811000011', 'harsh.agarwal@gmail.com', 24000000.00),
(12, 'Meera Kulkarni', '9811000012', 'meera.kulkarni@gmail.com', 7800000.00),
(13, 'Siddharth Rao', '9811000013', 'siddharth.rao@gmail.com', 13000000.00),
(14, 'Komal Shah', '9811000014', 'komal.shah@gmail.com', 9800000.00),
(15, 'Kajal Prasad', '9811000015', 'nitin.yadav@gmail.com', 6200000.00),
(16, 'Deepika Reddy', '9811000016', 'deepika.reddy@gmail.com', 20000000.00),
(17, 'Arjun Malhotra', '9811000017', 'arjun.malhotra@gmail.com', 14500000.00),
(18, 'Ritika Bose', '9811000018', 'ritika.bose@gmail.com', 8700000.00),
(19, 'Saurabh Jain', '9811000019', 'saurabh.jain@gmail.com', 16500000.00),
(20, 'Ishita Chawla', '9811000020', 'ishita.chawla@gmail.com', 10500000.00),
(21, 'Aditya Mishra', '9811000021', 'aditya.mishra@gmail.com', 9200000.00),
(22, 'Soniya Kashyap', '9811000022', 'tanvi.patil@gmail.com', 7600000.00),
(23, 'Rahul Khanna', '9811000023', 'rahul.khanna@gmail.com', 17500000.00),
(24, 'Ayesha Khan', '9811000024', 'ayesha.khan@gmail.com', 13500000.00),
(25, 'Varun Arora', '9811000025', 'varun.arora@gmail.com', 11500000.00),
(26, 'Shweta Iyer', '9811000026', 'shweta.iyer@gmail.com', 6900000.00),
(27, 'Manoj Bansal', '9811000027', 'manoj.bansal@gmail.com', 22000000.00),
(28, 'Kavya Menon', '9811000028', 'kavya.menon@gmail.com', 8400000.00),
(29, 'Rakesh Srivastava', '9811000029', 'rakesh.srivastava@gmail.com', 27000000.00),
(30, 'Nidhi Kapoor', '9811000030', 'nidhi.kapoor@gmail.com', 12500000.00);

insert into Properties
(Property_ID, Property_Name, Type_ID, Location_ID, Price, Area_sqft, Bedroooms, Bathrooms, Status, Listing_Date)
values
(1,'Sea View Heights A-101',1,1,18500000.00,950,2,2,'Sold','2024-01-10'),
(2,'Bandra Luxury Villa',2,2,42000000.00,3200,4,4,'Sold','2024-01-15'),
(3,'Powai Skyline Penthouse',3,3,68000000.00,2800,4,4,'Sold','2024-02-01'),
(4,'Goregaon Studio',4,4,7200000.00,450,1,1,'Sold','2024-02-05'),
(5,'Borivali Duplex Residency',5,5,24000000.00,1850,3,3,'Sold','2024-02-18'),
(6,'Kandivali Row House',6,6,19500000.00,1750,3,3,'Available','2024-03-01'),
(7,'Chembur Independent House',7,7,31000000.00,2400,4,3,'Sold','2024-03-08'),
(8,'Lower Parel Elite Plot',8,8,55000000.00,4000,0,0,'Sold','2024-03-15'),
(9,'Baner Business Office',9,9,14500000.00,1600,0,2,'Sold','2024-04-01'),
(10,'Wakad Retail Hub',10,10,9800000.00,900,0,1,'Sold','2024-04-06'),
(11,'Hinjewadi Grand Showroom',11,11,28000000.00,3500,0,3,'Available','2024-04-12'),
(12,'Viman Nagar Warehouse',12,12,23500000.00,4200,0,2,'Sold','2024-04-18'),
(13,'Ghodbunder Industrial Shed',13,13,37000000.00,5200,0,2,'Sold','2024-05-01'),
(14,'Majiwada Farm House',14,14,46000000.00,6000,5,4,'Booked','2024-05-08'),
(15,'Kasarvadavali Office Floor',15,15,21000000.00,2500,0,2,'Sold','2024-05-16'),
(16,'Manpada Builder Floor',16,16,15800000.00,1450,3,2,'Available','2024-05-25'),
(17,'Vashi Serviced Apartment',17,17,13200000.00,980,2,2,'Sold','2024-06-01'),
(18,'Nerul Co-working Space',18,18,27500000.00,3000,0,4,'Sold','2024-06-10'),
(19,'CBD Belapur Business Centre',19,19,52000000.00,5500,0,6,'Booked','2024-06-18'),
(20,'Kharghar IT Park Office',20,20,48500000.00,5100,0,5,'Sold','2024-06-28'),
(21,'Whitefield Commercial Plot',21,21,39500000.00,4500,0,0,'Sold','2024-07-05'),
(22,'Koramangala Royal Bungalow',22,22,76000000.00,5000,5,5,'Sold','2024-07-12'),
(23,'Electronic City Vacation Home',23,23,17500000.00,1800,3,3,'Booked','2024-07-20'),
(24,'HSR Mixed Use Tower',24,24,33500000.00,2700,3,3,'Available','2024-07-30'),
(25,'Hitech City Hostel Building',25,25,29500000.00,4800,20,20,'Sold','2024-08-08'),
(26,'Gachibowli PG Residency',26,26,18500000.00,3500,25,25,'Booked','2024-08-15'),
(27,'Financial District Shopping Complex',27,27,89000000.00,9000,0,10,'Sold','2024-08-24'),
(28,'Connaught Luxury Hotel',28,28,125000000.00,12000,60,65,'Booked','2024-09-01'),
(29,'Saket Green Resort',29,29,98000000.00,15000,40,42,'Sold','2024-09-12'),
(30,'Dwarka Luxury Condo',30,30,32500000.00,2100,3,3,'Available','2024-09-25');

INSERT INTO Transactions
(Transaction_ID, Property_ID, Customer_ID, Agent_ID, Transaction_Date, Selling_Price, Payment_Mode)
VALUES
(1,1,1,3,'2024-02-15',18250000.00,'Loan'),
(2,2,5,11,'2024-02-28',41800000.00,'Online'),
(3,3,11,27,'2024-03-10',67500000.00,'Loan'),
(4,4,6,4,'2024-03-18',7100000.00,'Cash'),
(5,5,2,8,'2024-03-30',23800000.00,'Loan'),
(6,7,17,5,'2024-04-12',30800000.00,'Online'),
(7,8,29,21,'2024-04-28',54800000.00,'Cheque'),
(8,9,12,9,'2024-05-05',14350000.00,'Loan'),
(9,10,14,2,'2024-05-18',9650000.00,'Online'),
(10,12,27,13,'2024-06-02',23200000.00,'Cheque'),
(11,13,19,16,'2024-06-15',36500000.00,'Loan'),
(12,15,24,18,'2024-06-28',20800000.00,'Online'),
(13,17,28,6,'2024-07-08',13000000.00,'Cash'),
(14,18,23,26,'2024-07-20',27200000.00,'Loan'),
(15,20,16,1,'2024-08-01',48000000.00,'Cheque'),
(16,21,7,10,'2024-08-16',39000000.00,'Online'),
(17,22,30,17,'2024-08-30',75500000.00,'Loan'),
(18,25,10,20,'2024-09-12',29200000.00,'Online'),
(19,27,25,15,'2024-09-28',88500000.00,'Cheque'),
(20,29,13,30,'2024-10-15',97500000.00,'Loan');

-- joins
-- Which customers purchased a property, and which agent handled the transaction? inner join
select c.Customer_Name, p.Property_Name,
 a.Agent_Name, t.Selling_Price,
 t.Transaction_Date from Transactions t 
inner join Customers c 
on t.Customer_id=c.Customer_id
inner join Agents a 
on t.Agent_id=a.Agent_id
inner join Properties p 
on t.Property_id=p.Property_id;

--  Which properties are still unsold and do not have any transaction? left join
select 
p.Property_Name, p.Status, 
p.Price from Properties p 
left join Transactions t 
on p.Property_id=t.Property_id 
where t.Transaction_id is null;

-- Show every agent and the property they sold (if any). right join
select a.Agent_Name, p.Property_Name,
p.Status,t.Selling_Price 
from transactions t 
right join Agents a 
on t.Agent_id=a.Agent_id
right join Properties p 
on t.Property_id=p.Property_id
where t.Transaction_id is not null; 
 
-- Which city generated the highest revenue, and which customers purchased properties there? multiple join
select l.city, c.Customer_Name, 
p.Property_Name, t.Selling_price 
from Transactions t 
inner join Properties p 
on t.Property_id=p.Property_id
inner join Customers c 
on t.Customer_id=c.Customer_id
inner join Location l 
on p.Location_id =l.Location_id
order by t.Selling_price desc; 

-- Which property types have generated more than ₹3 crore in total sales revenue? inner+having 
select pt.Type_Name,
COUNT(t.Transaction_ID) as Total_Sales,
SUM(t.Selling_Price) as Total_Revenue
from Property_Type pt
inner join Properties p
on pt.Type_ID = p.Type_ID
inner join Transactions t
on p.Property_ID = t.Property_ID
group by pt.Type_ID, pt.Type_Name
having SUM(t.Selling_Price) > 30000000
order by Total_Revenue desc;




-- sub queries
-- Which properties are priced higher than the average property price? choosed.......
select Property_Name,Price 
from Properties where Price>(
select avg(Price) from Properties) 
order by Price desc;

-- Which customers bought properties above the average selling price? options.../////
select Customer_Name,Budget from Customers 
where Customer_id in 
(select Customer_id from Transactions 
where Selling_Price> 
(select avg(Selling_price) from Transactions ));
  
-- Which locations have properties priced above the company's average property price? options.../////
SELECT
    City,
    Locality
FROM Location
WHERE Location_ID IN
(
    SELECT Location_ID
    FROM Properties
    WHERE Price >
    (
        SELECT AVG(Price)
        FROM Properties
    )
);

-- Which properties are located in Mumbai? choosed........
select Property_Name, Price
from Properties
where Location_ID in
(select Location_ID from Location 
where City = 'Mumbai');

-- Which agents have not closed a single deal? choosed....
select Agent_Name, Experience
from Agents
where Agent_ID not in
(select distinct Agent_ID 
from Transactions);


-- Which property types have at least one successful sale? choosed........
select Type_Name,Description
from Property_Type where Type_ID in
(select distinct Type_ID
from Properties where Property_ID in
(select Property_ID from Transactions));


-- views
-- create one reusable view containing complete property information, including city, locality, property type, price, and status?
create view vw_property_listing as
select p.Property_ID, p.Property_Name,
pt.Type_Name as Property_Type,
l.City, l.Locality,
l.State, l.Zip_Code,
p.Price, p.Area_sqft,
p.Bedroooms, p.Bathrooms,
p.Status, p.Listing_Date
from Properties p
inner join Property_Type pt
on p.Type_ID = pt.Type_ID
inner join Location l
on p.Location_ID = l.Location_ID;
-- To show the view
select *
from vw_property_listing;

-- How much revenue has each agent generated and how many properties have they sold?
create view vw_agent_sales_performance as
select a.Agent_ID,
a.Agent_Name, a.Experience,
a.Commission_Percent,
count(t.Transaction_ID) as Total_Deals,
sum(t.Selling_Price) as Total_Revenue,
avg(t.Selling_Price) as Average_Sale_Value
from Agents a
inner join Transactions t
on a.Agent_ID = t.Agent_ID
group by a.Agent_ID,
a.Agent_Name, a.Experience,
a.Commission_Percent;
-- To show the view
select *
from vw_agent_sales_performance
order by Total_Revenue desc;


-- Which cities are generating the highest revenue and how many properties have been sold there?
create view vw_city_market_performance as
select l.City,
count(distinct p.Property_ID) as Total_Properties,
count(t.Transaction_ID) as Total_Sales,
coalesce(sum(t.Selling_Price), 0) as Total_Revenue,
coalesce(avg(t.Selling_Price), 0) as Average_Selling_Price
from Location l
left join Properties p
on l.Location_ID = p.Location_ID
left join Transactions t
on p.Property_ID = t.Property_ID
group by l.City;
-- To show the view
select *
from vw_city_market_performance
order by Total_Revenue desc;









