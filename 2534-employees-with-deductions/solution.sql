-- Write your PostgreSQL query statement below
with emp_wrk_min as(
select employee_id, SUM(extract(hour from (out_time - in_time))*60 + extract(minute from (out_time - in_time)) +
ceil(extract(second from (out_time - in_time))/60.0)) as total_min
from logs  group by employee_id)

select distinct e.employee_id
from employees e left join emp_wrk_min ew on e.employee_id = ew.employee_id
where ew.employee_id is NULL or ew.total_min < (e.needed_hours * 60) 

