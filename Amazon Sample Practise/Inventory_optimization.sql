

--Inventory Optimization

CREATE TABLE Inventory (ProductID INT,WarehouseID INT,StockLevel INT,LastRestockDate DATE,PRIMARY KEY (ProductID, WarehouseID));

INSERT INTO Inventory (ProductID, WarehouseID, StockLevel, LastRestockDate) VALUES
(1, 101, 500, '2024-01-10'),
(2, 101, 300, '2024-01-15'),
(3, 102, 150, '2024-01-20'),
(4, 103, 200, '2024-01-05'),
(5, 104, 350, '2024-01-12'),
(6, 105, 600, '2024-01-18'),
(7, 101, 250, '2024-01-22'),
(8, 102, 400, '2024-01-08'),
(9, 103, 500, '2024-01-25'),
(10, 104, 450, '2024-01-14'),
(11, 105, 100, '2024-01-19'),
(12, 101, 550, '2024-01-23'),
(13, 102, 600, '2024-01-09'),
(14, 103, 120, '2024-01-11'),
(15, 104, 200, '2024-01-17'),
(16, 105, 300, '2024-01-20'),
(17, 101, 150, '2024-01-06'),
(18, 102, 280, '2024-01-13'),
(19, 103, 320, '2024-01-16'),
(20, 104, 400, '2024-01-21'),
(21, 105, 500, '2024-01-26'),
(22, 101, 380, '2024-01-07'),
(23, 102, 450, '2024-01-10'),
(24, 103, 220, '2024-01-14'),
(25, 104, 330, '2024-01-18'),
(26, 105, 490, '2024-01-24'),
(27, 101, 260, '2024-01-09'),
(28, 102, 370, '2024-01-12'),
(29, 103, 310, '2024-01-15'),
(30, 104, 550, '2024-01-19');

SELECT * FROM Inventory;


--Question 1
-- 1. Find the warehouse that has the highest total stock level.
select top 1 warehouseid,sum(stocklevel) from Inventory group by WarehouseID order by sum(stocklevel)


-- Question 2. 
--Retrieve products that were last restocked more than 30 days ago.
select productid,DATEDIFF(day,lastrestockdate,getdate()) as last_stocked from inventory where DATEDIFF(day,lastrestockdate,getdate())>=30

--Question 3
-- Identify warehouses that have at least 3 different products in stock.
select warehouseid,count(distinct(productid)) as No_of_products from Inventory group by WarehouseID having count(distinct(productid))>3


--Question 4
-- Find the product with the lowest stock level.
select productid,stocklevel from inventory order by StockLevel

--Question 6.
--Find products that have been restocked in the last 7 days.
select productid,datediff(day,lastrestockdate,getdate()) as last_restocked from inventory where datediff(day,lastrestockdate,getdate())<=7

--Question 7
--Identify warehouses where total stock is below 2000 units.
select warehouseid,sum(stocklevel) from inventory group by WarehouseID having sum(stocklevel)<2000


--Question 8
--Find the top 3 warehouses with the highest average stock level.

select top 3 warehouseid, avg(stocklevel) as avg_stocklevel from inventory group by WarehouseID order by avg(stocklevel) desc

--Question 9
--Identify the warehouse that had the longest gap between restocks.
WITH RestockGaps AS (SELECT WarehouseID, DATEDIFF(DAY, LAG(LastRestockDate) OVER (PARTITION BY WarehouseID ORDER BY LastRestockDate), LastRestockDate)
AS RestockGap FROM Inventory)
SELECT top 1 WarehouseID, MAX(RestockGap) AS MaxRestockGap FROM RestockGaps GROUP BY WarehouseID ORDER BY MaxRestockGap DESC;

--Question 10
--Calculate the cumulative stock level for each warehouse over time.
select warehouseid,lastrestockdate,sum(stocklevel) over(partition by warehouseid order by lastrestockdate) as
cumulative_stock from inventory 


--Question 11
--Identify warehouses where the standard deviation of stock levels is the highest (indicating fluctuations in inventory levels).
select warehouseid,round(STDEV(stocklevel),3) as std_deviation_stockLevel from inventory group by WarehouseID order by stdev(stocklevel) desc

--Question 12
--Find the warehouses that have stocked at least 5 different products in the past 30 days.
SELECT WarehouseID  FROM Inventory WHERE LastRestockDate >= DATEADD(DAY, -30, GETDATE()) GROUP BY WarehouseID HAVING COUNT(DISTINCT ProductID) >= 5;

--Question 13
-- Determine the warehouse-product pairs where the stock level has never dropped below 200.
select warehouseid,productid from inventory group by WarehouseID,productid having  min(stocklevel)>=200

--Question 14
--Write a query to identify products that haven’t been restocked in over 90 days and still have stock levels below 20 units.
select productid,LastRestockDate,StockLevel from inventory where dateadd(day,-90,getdate())>=LastRestockDate and StockLevel<20