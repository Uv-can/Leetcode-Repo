-- Write your PostgreSQL query statement below
select id,month,sum(salary) over(partition by id order by month range between 2 preceding and current row) Salary 
from Employee 
where (id,month) not in
(select id, max(month) from Employee  group by 1 )
order by id,month desc
