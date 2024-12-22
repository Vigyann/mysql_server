

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,                      
    DepartmentName VARCHAR(50) NOT NULL,               
    ManagerID INT UNIQUE,                                     
    PhoneNumber VARCHAR(20)
);
insert into Department values(101,'Finance',178,6501123450),(102,'IT',122,7008970900),(103,'HR',199,8009078003),(104,'Analytics',160,7009804321),
(105,'Marketing',156,8007421095),(106,'Sales',197,6543095210);

select * from Department;

create table Employee(EmpId int primary key,
EmpName varchar(30),
DateOfBirth Date ,
Gender Varchar(20) CHECK (Gender IN ('Male', 'Female', 'Other')),
Location VARCHAR(100) NOT NULL DEFAULT 'Unknown',
PhoneNumber int unique,Email varchar(60) not null unique,
Salary decimal(10,2) check(salary>0),
DeptID int,
FOREIGN KEY (DeptID) REFERENCES Department(DepartmentID));

ALTER TABLE Employee
DROP CONSTRAINT UQ__Employee__85FB4E3802A74CA7;

ALTER TABLE Employee
ALTER COLUMN PhoneNumber BIGINT  ;


ALTER TABLE Employee
ADD CONSTRAINT UQ_Employee_PhoneNumber UNIQUE (PhoneNumber);

;

insert into Employee values(1, 'Raj Kaur', '2000-05-05', 'Male', 'AX Apartments', 7123456789, 'raj.kaur@example.com', 50000.00, 101),
(2, 'Meera Sharma', '1995-12-12', 'Female', 'BX Residences', 6034567891, 'meera.sharma@example.com', 60000.00, 102),
(3, 'Anil Singh', '1998-07-10', 'Male', 'cd Heights', 9004567892, 'anil.singh@example.com', 55000.00, 105),
(4, 'John Doe', '1989-03-15', 'Male', 'ak Towers', 9345078930, 'john.doe@example.com', 70000.00, 104),
(5, 'Sarah Lee', '1999-06-25', 'Female', 'EX Apartments', 6201567894, 'sarah.lee@example.com', 75000.00, 101),
(6, 'Vijay Kumar', '1989-09-08', 'Male', 'zz Villas', 9234067895, 'vijay.kumar@example.com', 62000.00, 103),
(7, 'Priya Iyer', '1996-11-11', 'other', 'GX Residences', 6214567896, 'priya.iyer@example.com', 58000.00, 103),
(8, 'Carlos Gomez', '1987-04-19', 'Male', 'Ham Towers', 8234007897, 'carlos.gomez@example.com', 90000.00, 104),
(9, 'Lina Patel', '1992-01-02', 'Female', 'IX Heights', 6234511898, 'lina.patel@example.com', 67000.00, 106),
(10, 'David Chen', '1997-03-21', 'Male', 'pi Apartments', 6230547899, 'david.chen@example.com', 80000.00, 102),
(11, 'Emily Davis', '1991-08-29', 'Female', 'KX Residences', 9014527880, 'emily.davis@example.com', 60000.00, 104),
(12, 'Amit Roy', '1999-07-04', 'Male', 'Lz Heights', 6534417879, 'amit.roy@example.com', 75000.00, 105),
(13, 'Neha Verma', '1997-09-16', 'Female', 'MX Towers', 8304567868, 'neha.verma@example.com', 65000.00, 102),
(14, 'Rahul Mehta', '2001-05-30', 'Male', 'Nr Apartments', 9014567056, 'rahul.mehta@example.com', 77000.00, 106),
(15, 'Anna Black', '2002-10-18', 'Female', 'Op Villas', 8303467815, 'anna.black@example.com', 72000.00, 102);
insert into employee (empid,empname,email) values(17,'ramus','abc@gmail.com');

select * from Employee;

SELECT DepartmentName,DepartmentID
FROM Department
GROUP BY DepartmentID, DepartmentName;

SELECT Gender, COUNT(*) AS Count
FROM Employee
GROUP BY Gender;


SELECT AVG(Salary) AS avgsalary
FROM Employee;

SELECT MAX(Salary) AS Maxsalary
FROM Employee;


SELECT MIN(Salary) AS Maxsalary
FROM Employee;

SELECT Gender, COUNT(*) AS TotalGender
FROM Employee
GROUP BY Gender
HAVING COUNT(*)>0;


Update Employee set Location='raj villas' where EmpID=15;
select * from Employee;




insert into Employee(EmpId,EmpName,Gender,PhoneNumber,Email) values(16,'Satyavrata','Other',9087906790,'xyz@ok.com');--representing default column as unknown

SELECT * FROM Employee WHERE Salary  BETWEEN 50000.00 AND 70000.00 --finding salary between 50000 and 70000

select top 30 percent * from Employee  --to find top 30% of data

select top 3 * from Employee  order by EmpId desc -- to find bottom 3

--select top 30 percent * from students
--select top 3 from students

select * from Employee where DeptID in(102,104)


SELECT Salary, COUNT(*) AS HigherSalaryPersons FROM Employee WHERE Salary > 70000.00 GROUP BY Salary;



--if you want to find surname having 5 character , you need to use like with 5 underscores
--distict function

select * from Employee where EmpName  like 'P%'; --gives the emp name to starts with p

select * from Employee Where EmpName like '%r';-- gives the emp name ending with r

select * from Employee where  Email like '%@%'; -- gives the email ids which contains @ sign

select * from Employee where EmpName like '_a%'; --gives the name of all the employees  whichever second letter is a

select * from Employee where EmpName like 'P%r'; --gives the name of employees whose name  starts  with p and ends with r

select * from Employee  where Gender like '____'; -- it will give all 4 word  values from gender column whicch is Male (using 4 underscores)


SELECT * FROM Employee WHERE PHONENUMBER LIKE '%678%';-- it will give all the phone numbers  containing 678 in betweeen


SELECT * FROM Employee WHERE Salary LIKE '_5%'; -- it will give the salary of all the employees having 5 at seciond place in digits

select * from Employee where Location like '%Towers';-- it will give all the employee living in towers



--subquery(nested queries)queriwes within  query 
--in nested queries inner queries will get ececuted first
--correlated/non-corelated
--alias




select *from Department
select * from Employee

select * from Department full outer join employee on Department.DepartmentID =Employee.DeptID


select * from Employee left join  department on Department.DepartmentID =Employee.DeptID


select * from Employee right join  department on Department.DepartmentID =Employee.DeptID

select * from Employee

--Display employee names along with their department names
select employee.EmpName,Department.DepartmentName from employee join department on Employee.DeptID=Department.DepartmentID;

--Find the total number of employees in each department.
select Department.DepartmentName ,Count(Employee.EmpId) as TotalEmployee from Department  join Employee on 
Department.DepartmentID=Employee.DeptID group by Department.DepartmentName, Department.DepartmentID; 

SELECT d.DepartmentName, COUNT(e.EmpID) AS TotalEmployees 
FROM Department d 
 left JOIN Employee e ON d.DepartmentID = e.DeptID 
GROUP BY d.DepartmentName;



--Find the name and department of employees who are not working in the 'IT' department.
select d.departmentname,e.empname from Department d join Employee e on e.DeptID=d.DepartmentID where d.DepartmentName != 'IT';


--List all departments and their managers' names (ManagerID from Employee).
select d.DepartmentName,d.managerID from Department d left join Employee e on e.DeptID=d.DepartmentID;


--Display employee names and their department names using table aliases.
select e.empname,d.departmentname from Department d join employee e on e.DeptID=d.DepartmentID;

--List the employee names along with the department name where the salary is above 60,000. Use aliases for both tables.
select e.empname,d.departmentname , e.salary from Department d  join employee e on e.DeptID=d.DepartmentID where e.salary>60000;

--List all employees who were born between 1990 and 2000.
select  empname,dateofbirth from employee  where DateOfBirth  between '01-01-1990' and '12-31-2000';

--Find employees who do not live in 'AX Apartments' or 'BX Residences'.

select empname,location from employee where location not in('AX Apartments' , 'BX Residences') ;

--Display the total salary for each department.
select  sum(e.salary),d.departmentname from employee e join department d on d.DepartmentID=e.DeptID  group by d.DepartmentName;

--Count the number of male and female employees in each department.
SELECT DeptID, Gender, COUNT(EmpID) AS NumEmployees FROM Employee GROUP BY DeptID, Gender;

--Find the department that has the highest number of employees.
select deptid,count(empid) as NumEmployees  from Employee group by deptid order by NumEmployees desc;


--Get the average salary of employees grouped by gender.
select gender,avg(salary) as avgsalary from employee group by gender;

--List departments that have more than 3 employees.
select deptid,count(Empid) as empcount from employee  group by deptid  having count(Empid)>3;  

--Find departments where the average salary is greater than 65,000.
select deptid,avg(salary) as avgsalary from employee group by deptid having avg(salary)>65000;

--Find all employees whose email contains 'gmail'.
select empname from employee where email like '%example%';

--List employees whose names start with 'A' and live in a location ending with 'Towers'.
select empname from employee where EmpName like 'a%' and location like '%Heights'; 

--Get all employees with a salary between 60,000 and 80,000
select empname from employee where salary  between 60000 and 90000;

--Find employees who work in the 'Finance' and 'IT' departments.
select e.empname from employee e join department d on d.DepartmentID=e.DeptID where d.DepartmentName in ('finance','it');

--List employees who do not belong to 'Sales' or 'Marketing'.
select e.empname ,d.departmentname from employee e join  department d on d.DepartmentID=e.DeptID  where d.DepartmentName not in ('Sales','Marketing');

--Find employees whose salary is not greater than 70,000.
select empname ,salary from employee where Salary<=70000;

-- Count the number of employees who work in each department.
select count(deptid) as employeecount,deptid from employee group by DeptID;

--Find the employee with the lowest salary.
select empname,salary from Employee where salary=(select min(salary) from employee);

--Find the highest-paid female employee.
select empname,salary from employee where salary=(select max(salary) from employee  where gender='female');


--Calculate the average salary of employees working in 'IT' and 'HR' departments.
SELECT AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.DeptID = d.DepartmentID
WHERE d.DepartmentName IN ('IT', 'HR');

--Find the employees whose salary is higher than the highest salary of any employee in the 'HR' department.
SELECT EmpName,salary 
FROM Employee 
WHERE Salary > (SELECT MAX(Salary) 
                FROM Employee 
                WHERE DeptID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'HR'));

--Find employees who have the same salary as any employee in the 'Finance' department.
select empname ,salary,deptid from employee where salary in(select salary from employee where deptid=
(select departmentid from Department where departmentname='Finance'));

--Find the names of employees who earn less than the minimum salary of employees in the 'Sales' department.
select empname,salary from employee where salary<(select min(salary) as minsalary  from employee where deptid=
(select departmentid from Department where Departmentname='Sales'));

--Join: Retrieve the names of employees along with their department’s phone number.
select e.empname ,d.phonenumber from employee e join department d on d.DepartmentID=e.DeptID;


--Join: List all employees who work in departments where the manager's ID is not assigned.
select e.empname ,e.deptid from Employee e join Department d on d.DepartmentID=e.DeptID where d.ManagerID is NULL;

--Find the names of employees who were born after 1990 but before 2000.
select empname,DateOfBirth from employee  where DateOfBirth between '01-01-1991' and '12-31-1999';

SELECT EmpName 
FROM Employee 
WHERE DateOfBirth BETWEEN '1990-01-01' AND '2000-12-31';

--Write a query to display employees' email addresses, but use aliases to rename the Employee table as E and Email column as ContactInfo.
select e.empname,e.email as Contactinfo from employee e;

--Find the names of employees who earn less than the minimum salary of employees in the 'Sales' department.
SELECT EmpName FROM Employee WHERE Salary < (SELECT MIN(Salary) FROM Employee WHERE DeptID = (SELECT DepartmentID FROM Department 
WHERE DepartmentName = 'Sales'));

--Retrieve the names of employees along with their department’s phone number.
select e.empname,d.phonenumber from employee e join Department d on d.DepartmentID=e.DeptID ;

--List the department name and the highest salary paid in each department
 select d.departmentname ,max(e.salary) as max_salary from Department d join employee e on d.DepartmentID=e.DeptID group by Departmentname;

 --Find the employees who have the same salary as someone in a different department.
 SELECT e1.EmpName AS Employee1, e2.EmpName AS Employee2, e1.Salary 
FROM Employee e1 
JOIN Employee e2 ON e1.Salary = e2.Salary 
WHERE e1.DeptID != e2.DeptID;

--Find departments where the average salary of employees is less than 60,000.
SELECT DepartmentName 
FROM Department 
WHERE DepartmentID IN (SELECT DeptID  FROM Employee  GROUP BY DeptID  HAVING AVG(Salary) < 60000); 


--Count the number of employees with a salary greater than 70,000.
 select count(empid) as count_of_employee from employee where salary>70000;

 --Find the youngest employee in each department
 select min(dateofbirth) as youngest,deptid from employee group by       deptid;

 --Calculate the average salary of employees who work in the 'HR' and 'Finance' departments.
 SELECT AVG(Salary) 
FROM Employee 
WHERE DeptID IN (SELECT DepartmentID 
                 FROM Department 
                 WHERE DepartmentName IN ('HR', 'Finance'));

--Find employees who are not working in the 'Marketing' and 'Sales' departments.
select empname  from employee where deptid not in(select Departmentid from  department where DepartmentName in('Marketing','Sales'));

--Get all employees whose salaries are between 55,000 and 75,000.
select empname ,salary from employee where salary between 55000 and 75000;

--Find employees whose email domain is 'example.com'
select empname,email from employee where email like '%example.com';

--List employees whose department phone number ends with '789'.
select e.empname,d.phonenumber from employee e join department d on d.DepartmentID=e.DeptID  where d.PhoneNumber like '%789';


--List departments with more than 2 employees earning a salary greater than 60,000.
select deptid,from employee where 

select empname from employee where empname like '_____';