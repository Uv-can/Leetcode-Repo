-- Write your PostgreSQL query statement below



select employee_id, name, salary, 
dense_rank() over(order by salary) as team_id
from
(
    select employee_id, name, salary,
count(*) over(partition by salary) as tot_emp
from employees
) e
where e.tot_emp > 1
order by team_id, employee_id

