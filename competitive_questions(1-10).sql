
--1st question

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    submit_date DATETIME NOT NULL,
    product_id INT NOT NULL,
    stars INT CHECK (stars >= 1 AND stars <= 5) -- Restrict stars between 1 and 5
);

INSERT INTO Reviews (review_id, user_id, submit_date, product_id, stars)
VALUES
    (6171, 123, '2022-06-08 00:00:00', 50001, 4),
    (7802, 265, '2022-06-10 00:00:00', 69852, 4),
    (5293, 362, '2022-06-18 00:00:00', 50001, 3),
    (6352, 192, '2022-07-26 00:00:00', 69852, 3),
    (4517, 981, '2022-07-05 00:00:00', 69852, 2);

--  Add more values
INSERT INTO Reviews (review_id, user_id, submit_date, product_id, stars)
VALUES
    (8231, 456, '2022-08-01 00:00:00', 50001, 5),
    (9123, 789, '2022-08-15 00:00:00', 69852, 1),
    (7342, 321, '2022-09-10 00:00:00', 50001, 4),
    (8456, 654, '2022-09-20 00:00:00', 69852, 3),
    (9765, 987, '2022-10-01 00:00:00', 50001, 5);

	select * from reviews

-- Write a SQL query to get the average review ratings for every product every month.
select month(submit_date) as month,product_id,ROUND(AVG(CAST(stars AS FLOAT)), 2) AS avg_stars  from reviews group by month(submit_date),product_id;


--2nd question

CREATE TABLE Transactionss (
    category VARCHAR(50) NOT NULL,
    product VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    spend DECIMAL(10, 2) NOT NULL,
    transaction_date DATETIME NOT NULL
);

INSERT INTO Transactionss (category, product, user_id, spend, transaction_date)
VALUES
    ('appliance', 'refrigerator', 165, 246.00, '2021-12-26 12:00:00'),
    ('appliance', 'refrigerator', 123, 299.99, '2022-03-02 12:00:00'),
    ('appliance', 'washing machine', 123, 219.80, '2022-03-02 12:00:00'),
    ('electronics', 'vacuum', 178, 152.00, '2022-04-05 12:00:00'),
    ('electronics', 'wireless headset', 156, 249.90, '2022-07-08 12:00:00'),
    ('electronics', 'vacuum', 145, 189.00, '2022-07-15 12:00:00');

select * from Transactionss

--. Write a SQL query to find the highest-grossing items
select category,product,sum(spend) from Transactionss group by category,product order by sum(spend)


--3rd question

--goldman sachs
CREATE TABLE sf_exchange_rates ( date DATETIME, exchange_rate FLOAT, source_currency VARCHAR(10), target_currency VARCHAR(10));

INSERT INTO sf_exchange_rates (date, exchange_rate, source_currency, target_currency) VALUES
('2020-01-01', 1.12, 'EUR', 'USD'),
('2020-01-01', 1.31, 'GBP', 'USD'),
('2020-01-01', 109.56, 'JPY', 'USD'),
('2020-07-01', 1.17, 'EUR', 'USD'), 
('2020-07-01', 1.29, 'GBP', 'USD'), ('2020-07-01', 109.66, 'JPY', 'USD'), 
('2020-01-01', 0.75, 'AUD', 'USD'), ('2020-07-01', 0.73, 'AUD', 'USD'), 
('2020-01-01', 6.98, 'CNY', 'USD'), ('2020-07-01', 7.05, 'CNY', 'USD');

select * from sf_exchange_rates

--You are given a list of exchange rates from various currencies to US Dollars (USD) in different months. 
--Show how the exchange rate of all the currencies changed in the first half of 2020. Output the currency code and the difference between
--values of the exchange rate between July 1, 2020 and January 1, 2020.

select source_currency as currency_code,
max(case when date='2020-07-01' then exchange_rate end)-max(case when date='2020-01-01' then exchange_rate  end) as rate_difference
from sf_exchange_rates
where date in('2020-01-01','2020-07-01')
group by
source_currency


--4th question
--uber

CREATE TABLE cust_signups (location VARCHAR(100), plan_id BIGINT, signup_id BIGINT PRIMARY KEY, signup_start_date DATETIME, signup_stop_date DATETIME);

INSERT INTO cust_signups (location, plan_id, signup_id, signup_start_date, signup_stop_date) VALUES  
('New York', 101, 1, '2025-01-01', '2025-01-31'), 
('San Francisco', 102, 2, '2025-01-05', '2025-02-05'),
('Los Angeles', 103, 3, '2025-01-10', '2025-01-20'), 
('New York', 104, 4, '2025-02-01', '2025-02-28'), 
('Los Angeles', 105, 5, '2025-01-15', '2025-01-25');

select * from cust_signups

CREATE TABLE cust_transactions (amt FLOAT, signup_id BIGINT, transaction_id BIGINT PRIMARY KEY, transaction_start_date DATETIME);

INSERT INTO cust_transactions (amt, signup_id, transaction_id, transaction_start_date) VALUES 
(100.50, 1, 1001, '2025-01-10'), (200.75, 1, 1002, '2025-01-20'),
(150.00, 2, 1003, '2025-01-15'), (300.00, 3, 1004, '2025-01-12'), 
(400.00, 4, 1005, '2025-02-15'), (250.00, 5, 1006, '2025-01-20');

select * from cust_transactions

-- Find the most profitable location. Write a query that calculates the average signup duration and average transaction amount for each location,
-- and then compare these two measures together by taking the ratio of the average transaction amount and average duration for each location.
-- Your output should include the location, average duration, average transaction amount, and ratio. Sort your results from highest ratio to lowest.

select si.location,avg(datediff(day,si.signup_start_date,si.signup_stop_date)) as avg_duration,avg(t.amt) as avg_transaction_amount,
case 
when  avg(datediff(day,si.signup_start_date,si.signup_stop_date)) >0
then  avg(t.amt)/avg(datediff(day,si.signup_start_date,si.signup_stop_date))
else 0
end as ratio
from cust_signups si
join cust_transactions t on si.signup_id=t.signup_id
group by si.location
order by ratio desc



--5th question

--microsoft

CREATE TABLE meetup_events (client_id VARCHAR(255), customer_id VARCHAR(255), event_id BIGINT, event_type VARCHAR(255),
id BIGINT PRIMARY KEY, time_id DATETIME, user_id VARCHAR(255));

INSERT INTO meetup_events (client_id, customer_id, event_id, event_type, id, time_id, user_id) VALUES 
('C001', 'CU001', 101, 'click', 1, '2025-01-01 10:00:00', 'U001'), ('C001', 'CU002', 102, 'view', 2, '2025-01-01 11:00:00', 'U002'), 
('C002', 'CU003', 103, 'click', 3, '2025-01-02 10:00:00', 'U003'), ('C002', 'CU003', 104, 'view', 4, '2025-01-02 11:00:00', 'U003'),
('C003', 'CU004', 105, 'click', 5, '2025-01-03 10:00:00', 'U004'), ('C001', 'CU001', 106, 'view', 6, '2025-01-04 10:00:00', 'U001'),
('C003', 'CU005', 107, 'click', 7, '2025-01-05 10:00:00', 'U005'), ('C004', 'CU006', 108, 'view', 8, '2025-01-06 10:00:00', 'U006'), 
('C004', 'CU006', 109, 'click', 9, '2025-01-07 10:00:00', 'U006'), ('C001', 'CU007', 110, 'click', 10, '2025-01-08 10:00:00', 'U007');

select * from meetup_events

--Considering a dataset that tracks user interactions with different clients, identify which clients have users who are exclusively loyal to them 
--(i.e., they don't interact with any other clients).
--For each of these clients, calculate the number of such exclusive users. The output should include the client_id and the corresponding count of exclusive users.

select client_id ,count(distinct(user_id)) from meetup_events  WHERE 
    user_id NOT IN (
        SELECT user_id
        FROM meetup_events
        GROUP BY user_id
        HAVING COUNT(DISTINCT client_id) > 1
    )
group by client_id


--6th question

--google

CREATE TABLE claims (policy_number VARCHAR(50), state VARCHAR(50), claim_cost FLOAT, fraud_score FLOAT);

INSERT INTO claims (policy_number, state, claim_cost, fraud_score) VALUES 
('POL123', 'CA', 10000.00, 85.5), ('POL124', 'CA', 5000.00, 70.2), ('POL125', 'CA', 20000.00, 92.8),
('POL126', 'NY', 15000.00, 88.1), ('POL127', 'NY', 8000.00, 65.4), ('POL128', 'NY', 25000.00, 93.7),
('POL129', 'TX', 12000.00, 75.3), ('POL130', 'TX', 18000.00, 95.2), ('POL131', 'TX', 9000.00, 60.0), 
('POL132', 'FL', 11000.00, 82.0), ('POL133', 'FL', 14000.00, 87.5), ('POL134', 'FL', 30000.00, 99.0);

select * from claims;

--We want to identify the most suspicious claims in each state. We'll consider the top 5 percentile of claims with the highest fraud scores in each state
--as potentially fraudulent.

--Your output should include the policy number, state, claim cost, and fraud score.

WITH PercentileCalculation AS (
    SELECT 
        policy_number,
        state,
        claim_cost,
        fraud_score,
        PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY fraud_score) 
            OVER (PARTITION BY state) AS score_95th
    FROM claims
),
TopClaims AS (
    SELECT 
        policy_number,
        state,
        claim_cost,
        fraud_score
    FROM PercentileCalculation
    WHERE fraud_score >= score_95th
)
SELECT 
    policy_number, 
    state, 
    claim_cost, 
    fraud_score
FROM TopClaims
ORDER BY state, fraud_score DESC;



--7th question
--meta/facebook

CREATE TABLE famous (user_id INT, follower_id INT);

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);

select * from famous

--A table named “famous” has two columns called user id and follower id. It represents each user ID has a particular follower ID.
--These follower IDs are also users of #Facebook /#Meta. Then, find the famous percentage of each user. 
--Famous Percentage = number of followers a user has / total number of users on the platform.

with distinct_users as (select user_id as users from famous union select follower_id as users from famous),
follower_count as(select user_id,count(follower_id) as followers from famous group by user_id)
select f.user_id,(f.followers*100)/(select count(*) from distinct_users) as famous_percentage from follower_count f;


--8th question
CREATE TABLE in_app_purchases ( created_at DATETIME, price BIGINT, product_id BIGINT, quantity BIGINT, user_id BIGINT);

INSERT INTO in_app_purchases (created_at, price, product_id, quantity, user_id) VALUES
('2024-12-01 10:00:00', 500, 101, 1, 1),
('2024-12-02 11:00:00', 700, 102, 1, 1),('2024-12-01 12:00:00', 300, 103, 1, 2), ('2024-12-03 14:00:00', 400, 103, 1, 2),
('2024-12-02 09:30:00', 200, 104, 1, 3), ('2024-12-04 15:30:00', 600, 105, 2, 3),('2024-12-01 08:00:00', 800, 106, 1, 4),
('2024-12-05 18:00:00', 500, 107, 1, 4),('2024-12-06 16:00:00', 700, 108, 1, 5); 

select * from in_app_purchases

--You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign 
--where they see call-to-actions for more in-app purchases. Find the number of users that made
--additional in-app purchases due to the success of the marketing campaign.

--The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one or multiple purchases 
--on the first day do not count, nor do we count users that over time purchase only the products they purchased on the first day

WITH first_purchase AS (
    SELECT 
        user_id, 
        MIN(created_at) AS first_purchase_date
    FROM 
        in_app_purchases
    GROUP BY 
        user_id
)
SELECT 
    COUNT(DISTINCT p.user_id) AS successful_users
FROM 
    in_app_purchases p
JOIN 
    first_purchase fp 
ON 
    p.user_id = fp.user_id
WHERE 
    p.created_at > DATEADD(day, 1, fp.first_purchase_date)
    AND NOT EXISTS (
        SELECT 1 
        FROM in_app_purchases p2 
        WHERE 
            p2.user_id = p.user_id 
            AND p2.created_at > DATEADD(day, 1, fp.first_purchase_date) 
            AND p2.product_id = (
                SELECT DISTINCT fp_p.product_id 
                FROM in_app_purchases fp_p 
                WHERE 
                    fp_p.user_id = p.user_id 
                    AND fp_p.created_at = fp.first_purchase_date
            )
    );



--9th question(KPMG)

CREATE TABLE employee_data (department VARCHAR(100), employee_id BIGINT, hire_date DATETIME, rank FLOAT, salary BIGINT);

INSERT INTO employee_data (department, employee_id, hire_date, rank, salary) VALUES
('HR', 101, '2022-01-15', 5.0, 60000), ('HR', 102, '2021-03-10', 4.5, 75000), ('HR', 103, '2020-05-20', 4.2, 75000),
('HR', 104, '2023-06-01', 4.0, 50000), ('Finance', 201, '2020-07-15', 3.8, 85000), ('Finance', 202, '2021-09-25', 4.1, 95000),
('Finance', 203, '2023-03-30', 4.3, 95000), ('Finance', 204, '2022-11-12', 4.0, 70000), ('IT', 301, '2021-12-11', 5.0, 120000),
('IT', 302, '2023-01-15', 4.5, 110000), ('IT', 303, '2020-08-19', 4.8, 105000), ('IT', 304, '2021-06-30', 4.1, 100000),
('Sales', 401, '2019-11-20', 4.7, 65000), ('Sales', 402, '2022-02-10', 4.5, 55000), ('Sales', 403, '2020-01-25', 4.3, 75000),
('Sales', 404, '2023-07-18', 4.0, 72000);

select * from employee_data

--Identify the second-highest salary in each department.

--Your output should include the department, the second highest salary, and the employee ID. 
--Do not remove duplicate salaries when ordering salaries, and apply the rankings without a gap in the rank. 
--For example, if multiple employees share the same highest salary, the second-highest salary will be the next salary that is lower than the highest salaries.

with ranked_salaries as( select  employee_id,salary,department,  dense_rank() over (partition by department order by salary desc) as rank from employee_data)

select department,salary as second_highest_salaries,employee_id from ranked_salaries where rank=2;


--10th question(walmart)

CREATE TABLE employee_detail (id BIGINT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), 
address VARCHAR(255), age BIGINT, bonus BIGINT, city VARCHAR(100), department VARCHAR(100),
email VARCHAR(100), employee_title VARCHAR(100), manager_id BIGINT, salary BIGINT, sex VARCHAR(10), target BIGINT);

INSERT INTO employee_detail (id, first_name, last_name, address, age, bonus, city, department, email, employee_title, manager_id, salary, sex, target) VALUES
(1, 'John', 'Doe', '123 Main St', 45, 5000, 'New York', 'IT', 'john.doe@example.com', 'Manager', NULL, 90000, 'M', 50000),
(2, 'Jane', 'Smith', '456 Elm St', 38, 3000, 'Los Angeles', 'IT', 'jane.smith@example.com', 'Senior Developer', 1, 95000, 'F', 60000), 
(3, 'Alice', 'Johnson', '789 Oak St', 30, 2000, 'Chicago', 'HR', 'alice.johnson@example.com', 'HR Specialist', 1, 80000, 'F', 40000), 
(4, 'Bob', 'Brown', '321 Pine St', 40, 4000, 'Miami', 'Finance', 'bob.brown@example.com', 'Finance Manager', NULL, 85000, 'M', 45000),
(5, 'Charlie', 'Davis', '654 Cedar St', 28, 1500, 'Seattle', 'Finance', 'charlie.davis@example.com', 'Analyst', 4, 88000, 'M', 55000),
(6, 'Eve', 'Wilson', '987 Maple St', 35, 2500, 'Boston', 'Marketing', 'eve.wilson@example.com', 'Marketing Specialist', 4, 84000, 'F', 50000);

select * from employee_detail

--Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

select e.first_name,e.salary from employee_detail e join employee_detail m on e.manager_id=m.id where e.salary>m.salary


--11th question (walmart)

CREATE TABLE sessions(session_id INT, user_id INT, session_date DATETIME);

INSERT INTO sessions (session_id, user_id, session_date) VALUES 
(1, 1, '2024-01-01'), (2, 2, '2024-01-02'), (3, 3, '2024-01-05'),
(4, 3, '2024-01-05'), (5, 4, '2024-01-03'), (6, 4, '2024-01-03'),
(7, 5, '2024-01-04'), (8, 5, '2024-01-04'), (9, 3, '2024-01-05'), (10, 5, '2024-01-04');

CREATE TABLE order_summary (order_id INT, user_id INT, order_value INT, order_date DATETIME);

INSERT INTO order_summary (order_id, user_id, order_value, order_date) VALUES 
(1, 1, 152, '2024-01-01'), (2, 2, 485, '2024-01-02'), (3, 3, 398, '2024-01-05'),
(4, 3, 320, '2024-01-05'), (5, 4, 156, '2024-01-03'), (6, 4, 121, '2024-01-03'),
(7, 5, 238, '2024-01-04'), (8, 5, 70, '2024-01-04'), (9, 3, 152, '2024-01-05'), (10, 5, 171, '2024-01-04');

--Identify users who started a session and placed an order on the same day. For these users, 
--calculate the total number of orders and the total order value for that day. 
--Your output should include the user, the session date, the total number of orders, and the total order value for that day.

select s.user_id,cast(s.session_date as date),count(o.order_id),sum(o.order_value) from sessions s join order_summary o on o.user_id=s.user_id  
where o.order_date=s.session_date group by s.user_id,s.session_date