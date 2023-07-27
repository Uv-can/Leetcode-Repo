# Write your MySQL query statement below


select x.Department, x.Employee, x.Salary
from
(select b.name as Department, a.name as Employee, a.Salary, 
dense_rank() over(partition by a.departmentID order by a.salary desc) as r_no
from Employee a join Department b
on a.departmentID = b.id) x
where x.r_no <= 3

