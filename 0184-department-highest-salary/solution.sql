# Write your MySQL query statement below
select d.name as Department, a.name as Employee, a.salary as Salary
from
(select departmentId, name, salary,
dense_rank() over(partition by departmentId order by salary desc) as rnk
from Employee) a join Department d
on a.departmentId = d.id 
where a.rnk = 1 
