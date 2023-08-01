# Write your MySQL query statement below

select 
(select 
distinct a.salary 
from
(select *, 
dense_rank() over (order by salary desc) as rnk
from Employee ) a
where a.rnk = 2) as SecondHighestSalary
