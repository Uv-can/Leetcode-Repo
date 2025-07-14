-- Write your PostgreSQL query statement below


select t.Department, t.Employee, t.Salary from
(select d.name as Department, e.name as Employee, e.salary,
dense_rank() over(partition by e.departmentid order by e.salary desc) as rnk
from Employee e join department d
on e.departmentid = d.id) t
where t.rnk = 1
