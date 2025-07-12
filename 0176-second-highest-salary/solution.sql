-- Write your PostgreSQL query statement below

select max(salary) as SecondHighestSalary
from employee
where salary <> (Select max(salary) from employee)
