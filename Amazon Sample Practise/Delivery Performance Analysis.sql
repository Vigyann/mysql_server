


--1st
--Delivery Performance Analysis

CREATE TABLE DeliveryPerformance (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    DeliveryDate DATE,
    Region NVARCHAR(50)
);

INSERT INTO DeliveryPerformance (OrderID, OrderDate, DeliveryDate, Region)
VALUES 
(1, '2025-01-01', '2025-01-05', 'North'),
(2, '2025-01-02', '2025-01-06', 'East'),
(3, '2025-01-03', '2025-01-07', 'South'),
(4, '2025-01-04', '2025-01-09', 'West'),
(5, '2025-01-05', '2025-01-10', 'North'),
(6, '2025-01-06', '2025-01-11', 'East'),
(7, '2025-01-07', '2025-01-12', 'South'),
(8, '2025-01-08', '2025-01-13', 'West'),
(9, '2025-01-09', '2025-01-15', 'North'),
(10, '2025-01-10', '2025-01-16', 'East'),
(11, '2025-01-11', '2025-01-18', 'South'),
(12, '2025-01-12', '2025-01-20', 'West'),
(13, '2025-01-13', '2025-01-22', 'North'),
(14, '2025-01-14', '2025-01-25', 'East'),
(15, '2025-01-15', '2025-01-27', 'South'),
(16, '2025-01-16', '2025-01-28', 'West'),
(17, '2025-01-17', '2025-01-29', 'North'),
(18, '2025-01-18', '2025-01-31', 'East'),
(19, '2025-01-19', '2025-02-01', 'South'),
(20, '2025-01-20', '2025-02-03', 'West'),
(21, '2025-01-21', '2025-02-05', 'North'),
(22, '2025-01-22', '2025-02-06', 'East'),
(23, '2025-01-23', '2025-02-07', 'South'),
(24, '2025-01-24', '2025-02-08', 'West'),
(25, '2025-01-25', '2025-02-10', 'North'),
(26, '2025-01-26', '2025-02-11', 'East'),
(27, '2025-01-27', '2025-02-12', 'South'),
(28, '2025-01-28', '2025-02-14', 'West');

select * from DeliveryPerformance


-- question 1
--calculating the delivery time (in days) for each order

select orderid,DATEDIFF(DAY,orderdate,deliverydate) as deliverytime from DeliveryPerformance
-- you can also use hour/minute/second/month etc in place of day in datediff as required

--question 2
--To get the average delivery time per region:

select region,avg(DATEDIFF(day,orderdate,deliverydate)) as avgDeliveryTime,count(*) as totalOrders from DeliveryPerformance group by region

--question3
--Calculate the maximum and minimum delivery times for each region.
select region,max(datediff(day,orderdate,deliverydate)) as maxdeliveryTime,min(datediff(day,orderdate,deliverydate)) as mindeliveryTime from DeliveryPerformance group by region

--question 4
--Find orders that were delivered in less than 5 days.
select orderid,datediff(day,orderdate,deliverydate) as deliveryTime,region from DeliveryPerformance where datediff(day,orderdate,deliverydate)<5;

--question 5
--Find the total number of orders delivered monthwise.
SELECT 
    DATEPART(YEAR, DeliveryDate) AS Year,
    DATEPART(MONTH, DeliveryDate) AS Month,
    COUNT(OrderID) AS TotalOrders
FROM DeliveryPerformance
GROUP BY DATEPART(YEAR, DeliveryDate), DATEPART(MONTH, DeliveryDate)
ORDER BY Year, Month;

--question 6
--Find orders where the delivery time exceeded the average delivery time for their region.
WITH RegionAvg AS (SELECT Region,AVG(DATEDIFF(DAY, OrderDate, DeliveryDate)) AS AvgDeliveryTime FROM DeliveryPerformance GROUP BY Region)
select dp.orderid,dp.Region,DATEDIFF(DAY, dp.OrderDate, dp.DeliveryDate) AS DeliveryTime,ra.AvgDeliveryTime from DeliveryPerformance dp join
RegionAvg ra on ra.Region=dp.Region WHERE DATEDIFF(DAY, dp.OrderDate, dp.DeliveryDate) > ra.AvgDeliveryTime;

--question 7
-- Find orders with the same delivery date but different order dates.
SELECt a.OrderID AS OrderID1,b.OrderID AS OrderID2,a.DeliveryDate,a.OrderDate AS OrderDate1,b.OrderDate AS OrderDate2
FROM DeliveryPerformance a
JOIN DeliveryPerformance b ON a.DeliveryDate = b.DeliveryDate AND a.OrderID != b.OrderID AND a.OrderDate != b.OrderDate;

--question 8
--Calculate the percentage of orders delivered in each region.
select region,count(*) as totalOrders ,round(cast(count(*)*100.0/ (select count(*) from deliveryperformance) as decimal(5,2)),2) as PercentageOrders
from deliveryperformance group by region


--question 9
--Identify regions with no of  orders delivered on weekends.
--asssumption of 1 as sunday and 7 as saturday
select count(*) as orders , region  from DeliveryPerformance where datepart(WEEKDAY,deliverydate) in (1,7) group by region

--question 10
--Write a query to calculate the on-time delivery rate (percentage of orders delivered within 5 days) for each region over the last 6 months.
WITH TotalOrders AS (SELECT Region,COUNT(*) AS TotalOrders FROM DeliveryPerformance WHERE DeliveryDate >= DATEADD(MONTH, -6, GETDATE()) GROUP BY Region),
OnTimeDelivery AS (SELECT Region,COUNT(*) AS OnTimeOrders FROM DeliveryPerformance WHERE DATEDIFF(DAY, OrderDate, DeliveryDate) <= 5 -- Delivered within 5 days
AND DeliveryDate >= DATEADD(MONTH, -6, GETDATE()) GROUP BY Region)
SELECT t.Region,ROUND(CAST(o.OnTimeOrders * 100.0 / t.TotalOrders AS DECIMAL(5, 2)), 2) AS OnTimeDeliveryRate FROM TotalOrders t LEFT JOIN OnTimeDelivery o
ON t.Region = o.Region;
