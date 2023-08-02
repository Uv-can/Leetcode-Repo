CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select distinct a.salary
      from
      (select salary,
      dense_rank() over(order by salary desc) as rnk
      from Employee) a where a.rnk = n
  );
END
