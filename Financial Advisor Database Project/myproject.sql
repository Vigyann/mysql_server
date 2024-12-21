create table Financial_Data (
    Client_ID varchar(10),
    First_Name varchar(50),
    Last_Name varchar(50),
    Email varchar(100),
    Phone bigint,
    Date_of_Birth date,
    Risk_Tolerance varchar(20),
    Addresss varchar(200),
    Goal_ID varchar(10),
    Goal_Type varchar(50),
    Target_Amount decimal(18,2),
    Target_Date date,
    Investment_ID varchar(10),
    Investment_Type varchar(50),
    Investment_Value decimal(18,2),
    Purchase_Date date,
    Asset_ID varchar(10),
    Asset_Type varchar(50),
    Asset_Value decimal(18,2),
    Liability_ID varchar(10),
    Liability_Type varchar(50),
    Liability_Amount decimal(18,2),
    Advisor_ID varchar(10),
    Advisor_First_Name varchar(50),
    Advisor_Last_Name varchar(50),
    Advisor_Phone bigint,
    Advisor_Email varchar(100),
    Specialization varchar(100),
    Assigned_Date date
);

select * from Financial_Data;


insert into Financial_Data (
    Client_ID, First_Name, Last_Name, Email, Phone, Date_of_Birth, Risk_Tolerance, Addresss,
    Goal_ID, Goal_Type, Target_Amount, Target_Date,
    Investment_ID, Investment_Type, Investment_Value, Purchase_Date,
    Asset_ID, Asset_Type, Asset_Value,
    Liability_ID, Liability_Type, Liability_Amount,
    Advisor_ID, Advisor_First_Name, Advisor_Last_Name, Advisor_Phone, Advisor_Email, Specialization, Assigned_Date
)
values
    ('C01', 'Aditya', 'Doe', 'Aditya@mail.com', 9862567890, '1980-05-12', 'Moderate', '123 Main St, Jalandhar',
	'G01', 'Retirement', 500000.00, '2040-01-01',
	'I01', 'Stocks', 10000.00, '2020-01-10',
	'A01', 'Real Estate', 250000.00, 
	'L01', 'Mortgage', 150000.00, 
	'FA01', 'Sartaj', 'Singh', 9876543210, 'sartaj@gmail.com', 'Retirement Planning', '2019-02-10'),

    ('C02', 'Arpita', 'Smith', 'arpita@gmail.com', 8787567891, '1990-03-22', 'High', '456 Oak St, Ludiana', 
	'G02', 'Education', 200000.00, '2030-09-01', 
	'I02', 'Bonds', 15000.00, '2018-07-12',
	'A02', 'Vehicle', 30000.00, 
	'L02', 'Car Loan', 10000.00, 
	'FA02', 'Ravi', 'Verma', 9876543211, 'ravi@gmail.com', 'Investment Management', '2021-05-20'),


    ('C03', 'Ashutosh', 'Sarkar', 'sarkar@gmail.com', 9874567892, '1985-11-25', 'Low', '789 Pine St, Jalandhar', 
	'G03', 'Vacation', 50000.00, '2025-06-15', 
	'I03', 'Mutual Funds', 20000.00, '2019-09-11', 
	'A03', 'Jewelry', 10000.00,
	'L03', 'Credit Card', 5000.00,
	'FA01', 'Sartaj', 'Singh', 9876543210, 'sartaj@gmail.com', 'Retirement Planning', '2019-02-10'),

    ('C04', 'Jackson', 'Shaji', 'jackson@gmail.com', 70009567893, '1978-02-10', 'Moderate', '234 Maple St, Chandigarh',
	'G04', 'House Purchase', 300000.00, '2027-12-01',
	'I04', 'Real Estate', 150000.00, '2021-02-14',
	'A04', 'Antiques', 20000.00, 
	'L04', 'business Loan', 8000.00, 
	'FA03', 'Ms', 'Komal', 9876543210, 'alice.smith@example.com', 'Retirement Planning', '2019-02-10'),

    ('C05', 'Khamkhar', 'Abhay', 'abhay@gmail.com', 8787567894, '1992-07-18', 'Moderate', '567 Cedar St, Ludiana', 
	'G02', 'Education', 250000.00, '2032-08-10',
	'I01', 'Stocks', 35000.00, '2020-05-05',
	'A03', 'Jewelry', 5000.00,
	'L05', 'Education Loan', 20000.00, 
	'FA02', 'Ravi', 'Verma', 9876543211, 'ravi@gmail.com', 'Investment Management', '2021-05-20'),


    ('C06', 'Laltha', 'zuali', 'zuali@gmail.com', 9864567895, '1988-08-15', 'Low', '789 Birch St, Jalandhar', 
	'G05', 'Emergency Fund', 100000.00, '2024-01-01', 
	'I01', 'Stocks', 10000.00, '2017-11-01', 
	'A04', 'Antiques', 7000.00, 
	'L03', 'Credit Card', 3000.00, 
	'FA04', 'Satwinder', 'Kaur', 9876543212, 'satwinder@gmail.com', 'Tax Planning', '2020-11-11'),

    ('C07', 'Hd', 'Lalawmpuia', 'hd@gmail.com', 9834567896, '1982-12-30', 'High', '910 Elm St, Amritsar', 
	'G03', 'Vacation', 400000.00, '2035-03-25', 
	'I03', 'Mutual Funds', 25000.00, '2018-08-22', 
	'A02', 'Vehicle', 300000.00,
	'L01', 'Mortgage', 200000.00, 
    'FA01', 'Sartaj', 'Singh', 9876543210, 'sartaj@gmail.com', 'Retirement Planning', '2019-02-10'),

    ('C08', 'Oak', 'Pang', 'oak@gmail.com', 9783456789, '1976-04-15', 'High', '123 Willow St, Chandigarh',
	'G02', 'Education', 500000.00, '2040-01-01', 
	'I01', 'Stocks', 50000.00, '2020-01-10', 
	'A04', 'Antiques', 450000.00, 
	'L01', 'Mortgage', 300000.00, 
	'FA02', 'Ravi', 'Verma', 9876543211, 'ravi@gmail.com', 'Investment Management', '2021-05-20'),

	('C09', 'Pentakota', 'Harshvardhan', 'harsh@gmail.com', 8734567898, '1995-05-25', 'Low', '456 Walnut St, Amritsar', 
	'G04','House Purchase', 70000.00, '2023-04-10', 
	'I02', 'Bonds', 25000.00, '2019-10-12', 
	'A09', 'Jewelry', 12000.00,
	'L03', 'Credit Card', 2000.00, 
	'FA04', 'Satwinder', 'Kaur', 9876543212, 'satwinder@gmail.com', 'Tax Planning', '2020-11-11'),

    ('C10', 'Punna', 'Bhanu', 'bhanu@gmail.com', 9874567899, '1984-06-20', 'Moderate', '789 Cherry St, Chandiarh', 
	'G03', 'Vacation', 600000.00, '2028-09-15',
	'I04', 'Real Estate', 250000.00, '2022-04-20',
	'A01', 'Real Estate', 15000.00,
	'L04', 'business Loan', 25000.00, 
	'FA01', 'Sartaj', 'Singh', 9876543210, 'sartaj@gmail.com', 'Retirement Planning', '2019-02-10'),

    ('C11', 'Rakshit', 'Sharma', 'rakshit@gmail.com', 87384567800, '1993-09-10', 'Low', '345 Fir St, Amritsar', 
	'G04', 'House Purchase', 350000.00, '2033-11-20', 
	'I03', 'Mutual Funds', 50000.00, '2021-03-15',
	'A02', 'Vehicle', 20000.00,
	'L11', 'Car Loan', 120000.00, 
	'FA02', 'Ravi', 'Verma', 9876543211, 'ravi@gmail.com', 'Investment Management', '2021-05-20'),

	('C12', 'Satya', 'Brata', 'brata@gmail.com', 9234567801, '1987-11-28', 'High', '789 Dogwood St, jalandhar', 
	'G02', 'Education', 150000.00, '2030-06-10',
	'I02', 'Bonds', 20000.00, '2019-01-05',
	'A02', 'Vehicle', 200000.00,
	'L01', 'Mortgage', 50000.00,
	'FA04', 'Satwinder', 'Kaur', 9876543212, 'satwinder@gmail.com', 'Tax Planning', '2020-11-11'),

    ('C13', 'Sayanth', 'Tom', 'tom@gmail.com', 9834567802, '1979-12-01', 'Low', '567 Cedar St, Ludiana',
	'G05', 'Emergency Fund', 100000.00, '2025-08-15', 
	'I03', 'Mutual Funds', 30000.00, '2018-06-22', 
	'A04', 'Antiques', 15000.00, 
	'L03', 'Credit Card', 5000.00,
	'FA01', 'Sartaj', 'Singh', 9876543210, 'sartaj@gmail.com', 'Retirement Planning', '2019-02-10'),

    ('C14', 'lalrem', 'Sangi', 'sangi@gmail.com', 9834567803, '1981-03-05', 'Low', '910 Oak St, Amritsar', 
	'G04', 'House Purchase', 60000.00, '2026-04-05',
	'I03', 'Mutual Funds', 20000.00, '2017-10-20', 
	'A03', 'Jewelry', 5000.00,
	'L03', 'Credit Card', 3000.00, 
	'FA02', 'Ravi', 'Verma', 9876543211, 'ravi@gmail.com', 'Investment Management', '2021-05-20'),

    ('C15', 'Muskan', 'Kaur', 'muskan@gmail.com', 9864567804, '1996-07-22', 'High', '234 Birch St, Chandigarh', 
	'G01', 'Retirement', 700000.00, '2050-10-10', 
	'I04', 'Real Estate', 55000.00, '2020-05-15', 
	'A01', 'Real Estate', 500000.00, 
	'L01', 'Mortgage', 250000.00, 
	'FA04', 'Satwinder', 'Kaur', 9876543212, 'satwinder@gmail.com', 'Tax Planning', '2020-11-11');

	update Financial_data set Advisor_Email='komal@yahoo.com' where Client_ID='C04';


-- First Table: Clients
create table Clients (
    Client_ID  varchar(10) primary key,
    First_Name  varchar(50),
    Last_Name  varchar(50),
    Email  varchar(100) unique not null,
    Phone  varchar(15) not null,
    Date_of_Birth date,
    Risk_Tolerance  varchar(20),
    Addresss  varchar(200)
);

select * from Clients;

 insert into Clients (Client_ID, First_Name, Last_Name, Email, Phone, Date_of_Birth, Risk_Tolerance, Addresss)
select distinct Client_ID, First_Name, Last_Name, Email, Phone, Date_of_Birth, Risk_Tolerance, Addresss
from Financial_Data;



-- Second Table: Financial_Goals
CREATE TABLE Financial_Goals (
    Goal_ID varchar(10),
    Client_ID varchar(10),
    Goal_Type varchar(50),
    Target_Amount decimal(18,2),
    Target_Date date,
    PRIMARY KEY (Goal_ID, Client_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);


INSERT INTO Financial_Goals (Goal_ID, Client_ID, Goal_Type, Target_Amount, Target_Date)
SELECT DISTINCT Goal_ID, Client_ID, Goal_Type, Target_Amount, Target_Date
FROM Financial_Data
WHERE Goal_ID NOT IN (SELECT Goal_ID FROM Financial_Goals);

select * from Financial_Goals




-- Third Table: Investments
CREATE TABLE Investments (
    Investment_ID varchar(10),
    Client_ID varchar(10),
    Investment_Type varchar(50),
    Investment_Value decimal(18,2),
    Purchase_Date date,
    PRIMARY KEY (Investment_ID, Client_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);
insert into Investments (Investment_ID, Client_ID, Investment_Type, Investment_Value, Purchase_Date)
select distinct Investment_ID, Client_ID, Investment_Type, Investment_Value, Purchase_Date
from Financial_Data;

select *from Investments;


-- Fourth Table: Assets
CREATE TABLE Assets (
    Asset_ID varchar(10),
    Client_ID varchar(10),
    Asset_Type varchar(50),
    Asset_Value decimal(18,2),
    PRIMARY KEY (Asset_ID, Client_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);


insert into Assets (Asset_ID, Client_ID, Asset_Type, Asset_Value)
select distinct Asset_ID, Client_ID, Asset_Type, Asset_Value
from Financial_Data;

select *from assets;


-- Fifth Table: Liabilities
CREATE TABLE Liabilities (
    Liability_ID varchar(10),
    Client_ID varchar(10),
    Liability_Type varchar(50),
    Liability_Amount decimal(18,2),
    PRIMARY KEY (Liability_ID, Client_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

insert into Liabilities (Liability_ID, Client_ID, Liability_Type, Liability_Amount)
select distinct Liability_ID, Client_ID, Liability_Type, Liability_Amount
from Financial_Data;

select * from Liabilities;



-- Sixth Table: Financial_Advisors
create table Financial_Advisors (
    Advisor_ID varchar(10) primary key,
    First_Name varchar(50),
    Last_Name varchar(50),
    Phone bigint,
    Email varchar(100) ,
    Specialization varchar(100)
);

insert into Financial_Advisors (Advisor_ID, First_Name, Last_Name, Phone, Email, Specialization)
select distinct Advisor_ID, Advisor_First_Name, Advisor_Last_Name, Advisor_Phone, Advisor_Email, Specialization
from Financial_Data;

select * from Financial_Advisors;


-- Seventh Table: Advisor_Client_Relationship
create table Advisor_Client_Relationship (
    Advisor_ID varchar(10),
    Client_ID varchar(10),
    Assigned_Date date,
    primary key (Advisor_ID, Client_ID),
    foreign key (Advisor_ID) references Financial_Advisors(Advisor_ID),
    foreign key (Client_ID) references Clients(Client_ID)
);

insert into Advisor_Client_Relationship (Advisor_ID, Client_ID, Assigned_Date)
select distinct Advisor_ID, Client_ID, Assigned_Date
from Financial_Data;

select *from Advisor_Client_Relationship;





select * from Clients;
select * from Financial_Goals;
select *from Investments;
select *from assets;
select * from Liabilities;
select * from Financial_Advisors;
select *from Advisor_Client_Relationship;
select * from Financial_Data;



--join
select  a.advisor_id,a.First_Name,a.Last_Name,a.phone,a.email,c.Client_ID from Financial_Advisors a join Advisor_Client_Relationship c  on c.Advisor_ID=a.Advisor_ID;

--deleting a row data
delete FROM Financial_Data where Client_ID = 'C01';

--add back the data
insert into Financial_Data (
    Client_ID, First_Name, Last_Name, Email, Phone, Date_of_Birth, Risk_Tolerance, Addresss,
    Goal_ID, Goal_Type, Target_Amount, Target_Date,
    Investment_ID, Investment_Type, Investment_Value, Purchase_Date,
    Asset_ID, Asset_Type, Asset_Value,
    Liability_ID, Liability_Type, Liability_Amount,
    Advisor_ID, Advisor_First_Name, Advisor_Last_Name, Advisor_Phone, Advisor_Email, Specialization, Assigned_Date
)
values
    ('C01', 'Aditya', 'roy', 'Aditya@mail.com', 9862567890, '1980-05-12', 'Moderate', '123 Main St, Jalandhar',
	'G01', 'Retirement', 500000.00, '2040-01-01',
	'I01', 'Stocks', 10000.00, '2020-01-10',
	'A01', 'Real Estate', 250000.00, 
	'L01', 'Mortgage', 150000.00, 
	'FA01', 'Sartaj', 'Singh', 9876543210, 'sartaj@gmail.com', 'Retirement Planning', '2019-02-10');

--add column
alter table  financial_data add  new_col int;

select * from Financial_Data;

--deleting newly added column
alter table financial_data drop column new_col;

select * from Financial_Data;

--updating row data
update Financial_Data
SET Investment_Value = 50000.00
where Client_ID = 'C02';

select * from Financial_Data;

--add constraint
alter table Financial_Data
add constraint unique_client_id unique (client_id);

--drop constraint
alter table Financial_Data
DROP CONSTRAINT unique_client_id;

--renaming column
select * from Clients;
exec sp_rename 'clients.last_name','sur_name','column';
select * from clients;

--renaming table
exec sp_rename 'clients','client';
select * from client;


-- aggregate and analytical queries
--Total asset under management
select sum(investment_value) as AUM from Financial_Data

--count of risk tolerance of investors  along with their risk levels
select count(Risk_Tolerance),Risk_Tolerance from financial_data  group by Risk_Tolerance;

-- list of assets on which financial advisor invests
select distinct(investment_type) from financial_data ;

--max investment
select max(investment_value) from Investments ;

select * from Investments;
--min investments
select min (investment_value) as minimum_investment from Investments;
select * from clients;

--min 2 investment with client name
select  top 2 c.first_name, i.investment_value AS minimum_investment from Investments i JOIN Client c on c.Client_ID = i.Client_ID 
order by i.investment_value ;

--use of group by and aggregate
SELECT Investment_Type, SUM(Investment_Value) AS Total_investment
FROM Investments
GROUP BY Investment_type;

----max top 4 highest investment with client name
select  top 4 c.first_name, i.investment_value AS max_investment from Investments i JOIN Client c on c.Client_ID = i.Client_ID 
order by i.investment_value desc;

--upper and lower
SELECT  upper(Specialization) as spescialisation, lower(First_name) as name FROM Financial_Advisors;

--subquery or nested subquery
-- clients with investment value greater than avg
select c.first_name, c.sur_name from Client c where c.client_id IN (select i.client_id from Investments i 
where i.investment_value > (select avg(investment_value) from Investments));


--clients who have invested in stocks
select c.first_name, c.sur_name from Client c where  c.client_id IN (select i.client_id  from Investments i where i.investment_type = 'Stocks');





--cursors
--1st client above age of 30
declare @Clientname Nvarchar(100), @age int;

Declare clientcursor cursor for 
select concat(first_name,' ',sur_name) as client_name , datediff(year,date_of_birth,GETDATE()) as age
from Client where datediff(year,date_of_birth,GETDATE())>30;

open clientcursor;
fetch next from clientcursor into @clientname, @age;

while @@FETCH_STATUS=0
begin
print 'client: '+ @clientname + ',Age : '+ cast(@age as nvarchar);
fetch next from  clientcursor into @clientname, @age;
end;

close clientcursor;
deallocate clientcursor;


--cursors
--2nd financial goals by client
declare @clientid varchar(10), @goaltype nvarchar(50) , @targetamount decimal(18,2);

declare goalcursor cursor for
select client_id,Goal_Type,Target_Amount from Financial_Goals;

open goalcursor;

fetch next from goalcursor into @clientid ,@goaltype , @targetamount;

while @@FETCH_STATUS=0
begin
print 'client id :' + @clientid + ',goal : '+@goaltype+ ', Target Amount : '+cast( @targetamount as nvarchar);
fetch next from goalcursor into @clientid,@goaltype,@targetamount;
end;

close goalcursor;
deallocate goalcursor;



--cursors
--3rd total investment by client

declare @clientid varchar(10), @totalinvestment decimal(18,2);

declare investorcursor cursor for
select client_id, sum(investment_value) as totalinvestment  from Investments group by client_id;

open investorcursor;

fetch next from investorcursor into @clientid , @totalinvestment;

while @@FETCH_STATUS=0
begin 
print 'client id  : '+@clientid +', total investment : '+cast(@totalinvestment as nvarchar);
fetch next from investorcursor into @clientid , @totalinvestment;
end;

close investorcursor;
deallocate investorcursor;

--cursors
--4th having liability more than assets

declare @clientid varchar(10),  @totalliabilities decimal(18,2), @totalassets decimal(18,2);
declare liabilitycursor cursor for
select L.Client_ID, SUM(L.Liability_Amount) AS TotalLiabilities, SUM(A.Asset_Value) AS TotalAssets from Liabilities L
JOIN Assets A ON L.Client_ID = A.Client_ID group by  L.Client_ID having SUM(L.Liability_Amount) > SUM(A.Asset_Value);

open liabilitycursor;
fetch next from liabilitycursor into @clientid, @totalliabilities,@totalassets;

while @@fetch_status=0
begin
print 'Client ID: ' + @ClientID + ', Liabilities: ' + CAST(@TotalLiabilities AS NVARCHAR) + ', Assets: ' + CAST(@TotalAssets AS NVARCHAR);
fetch next from LiabilityCursor INTO @ClientID, @TotalLiabilities, @TotalAssets;
end;

close liabilitycursor;
deallocate liabilitycursor;


--cursors
--5th to assign new advisor to unassigned clients
declare @ClientID varchar(10), @AdvisorID varchar(10);

declare UnassignedClients cursor for
select Client_ID
from Client
where Client_ID NOT IN (select distinct Client_ID from Advisor_Client_Relationship);

open UnassignedClients;

fetch next from UnassignedClients INTO @ClientID;

while @@FETCH_STATUS = 0
begin
set @AdvisorID = 'FA01'; 
insert into Advisor_Client_Relationship (Advisor_ID, Client_ID, Assigned_Date)
values (@AdvisorID, @ClientID, getdate());
print 'Assigned Client ID: ' + @ClientID + ' to Advisor ID: ' + @AdvisorID;
fetch next from UnassignedClients INTO @ClientID;
end;

close UnassignedClients;
deallocate UnassignedClients;


--triggers
--1st to prevent duplicacy in emails

create trigger dup_emailssss
on client after insert as 
begin
if exists (select 1 from Client C join inserted I on C.Email = I.Email)
begin
print 'Error: Duplicate email detected!';
rollback transaction;
end

else
begin
insert into Client
select * from inserted;
end
end;



----triggers
--2nd risk tol based on age

create trigger risk_tolers
ON Client after insert, update as
begin
update client
set Risk_Tolerance = case 
 when datediff(year, Date_of_Birth, getdate()) > 50 then 'Low'
 when datediff(year, Date_of_Birth, getdate()) between 30 and 50 then 'Medium'
 else 'High'
 end
 where Client_ID in (select Client_ID from inserted);
END;


----triggers
--3rd liability limit
create trigger liabilitys
on Liabilities after insert as
begin
if exists (select 1 from inserted where Liability_Amount > 100000)
begin
print 'Error: Liability amount exceeds th limit';
rollback transaction;
end
end;


insert into Liabilities (Liability_ID, Client_ID, Liability_Type, Liability_Amount)
values('L01','C16','Mortgage',1500000.00);

insert into Client (Client_ID, First_Name, sur_name, Email, Phone, Date_of_Birth, Risk_Tolerance, Addresss)
values('C16','adity','raj','abc@gmail.com',908700099,'2019-02-10','Moderate','st jalandhar');


--triggers
--4th assign advisor
create trigger advisor_assign
on Client after insert as
begin
 insert into Advisor_Client_Relationship (Advisor_ID, Client_ID, Assigned_Date)
 select 'FA01', Client_ID, getdate()
 from inserted;
 print 'new client is assigned with a def advisor';
end;

--triggers
--5th checking no negative or zero asset value

select * from assets;

create trigger asset_vals
on Assets after update as
begin
 if exists (select 1 from inserted where Asset_Value <= 0)
 begin
 print 'Asset value cannot be zero or negative ';
 rollback transaction;
 end
end;

update Assets set Asset_Value = -100 where  Asset_ID = 'A01' and Client_ID='C01';
