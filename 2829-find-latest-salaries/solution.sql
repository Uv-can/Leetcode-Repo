-- Write your PostgreSQL query statement below

select s.emp_id, s.firstname, s.lastname, s.salary, s.department_id
from
(select *,
dense_rank() over(partition by emp_id order by salary desc) as rnk
from salary) s
where s.rnk = 1
