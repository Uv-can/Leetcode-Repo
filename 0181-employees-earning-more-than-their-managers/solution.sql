# Write your MySQL query statement below


select a.name as Employee
from Employee a join 
(select id, salary from Employee ) b
on a.managerId = b.id
where a.salary > b.salary

