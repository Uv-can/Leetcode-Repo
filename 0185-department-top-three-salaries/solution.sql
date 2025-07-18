-- Write your PostgreSQL query statement below


select Department, Employee, Salary
from (
select d.name as Department, e.name as Employee, e.salary,
dense_rank() over(partition by e.departmentid order by e.salary desc) as rnk
from employee e join department d
on e.departmentid = d.id) a
where rnk <= 3


