-- Write your PostgreSQL query statement below

select emp_id, dept
from
(select emp_id, dept,
dense_rank() over(partition by dept order by salary desc) as rnk
from employees) e
where rnk = 2
order by emp_id
