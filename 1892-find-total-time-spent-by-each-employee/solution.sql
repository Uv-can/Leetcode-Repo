-- Write your PostgreSQL query statement below

select event_day as day, emp_id, SUM(time_diff) as total_time
from
(select emp_id, event_day, out_time - in_time as time_diff
from employees)
group by day, emp_id
