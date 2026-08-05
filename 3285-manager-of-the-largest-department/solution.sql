# Write your MySQL query statement below



with dept as(select dep_id, 
dense_rank() over( order by count(emp_id) desc) as rnk
from employees 
group by dep_id)

select e.emp_name as manager_name,d.dep_id
from dept d join (select distinct dep_id, emp_name from employees where position = 'Manager') e
on d.dep_id = e.dep_id
where d.rnk = 1
order by 2
