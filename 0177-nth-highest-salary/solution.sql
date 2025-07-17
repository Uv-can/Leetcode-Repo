CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    select distinct e.salary from
    (select employee.salary, dense_rank() over(order by employee.salary desc) as rno
    from employee) e
    where e.rno = N
  );
END;
$$ LANGUAGE plpgsql;
