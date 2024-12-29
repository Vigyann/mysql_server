

--finding 2nd highest salary

SELECT CASE 
   WHEN (SELECT COUNT(DISTINCT Salary) FROM Employee) >= 2 THEN 
   (SELECT DISTINCT Salary FROM Employee 
    ORDER BY Salary DESC 
    OFFSET 1 ROW FETCH NEXT 1 ROW ONLY)
    ELSE NULL
    END AS SecondHighestSalary;


--finding nth highest salary
create function getNthHighestSalary(@N INT) 
RETURNS INT 
AS
BEGIN
RETURN (
        /* Write your T-SQL query statement below. */
   select CASE
   WHEN (SELECT COUNT(DISTINCT salary) FROM employee) >= @N THEN
   (SELECT salary FROM (SELECT salary, RANK() OVER (ORDER BY salary DESC) AS rank
     FROM employee) rankedSalaries 
     WHERE rank = @N)
     ELSE NULL
     END
    );
END

--or 2nd method  for finding nth highest salary
CREATE FUNCTION getNthHighestSalary(@N INT) 
RETURNS INT 
AS
BEGIN
 IF @N <= 0
   BEGIN
   RETURN NULL
  END
RETURN (
  SELECT CASE 
   WHEN EXISTS (SELECT 1 
    FROM (SELECT DISTINCT Salary FROM Employee) AS DistinctSalaries
     ORDER BY Salary DESC 
     OFFSET @N-1 ROWS FETCH NEXT 1 ROWS ONLY) 
    THEN (SELECT DISTINCT Salary 
     FROM Employee 
     ORDER BY Salary DESC 
    OFFSET @N-1 ROWS FETCH NEXT 1 ROWS ONLY)
    ELSE NULL 
    END
    );
END
