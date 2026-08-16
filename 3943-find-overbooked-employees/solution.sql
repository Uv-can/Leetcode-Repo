-- Write your PostgreSQL query statement below

with meet_sum as
(select distinct employee_id, DATE_TRUNC('week', meeting_date) as week, 
SUM(duration_hours) over(partition by employee_id, DATE_TRUNC('week', meeting_date)) as week_sum
from meetings)


select m.employee_id, employee_name, department, count(week) as meeting_heavy_weeks
from meet_sum m join employees e
on m.employee_id = e.employee_id
where week_sum > 20
group by m.employee_id, employee_name, department
having count(*) >= 2
order by meeting_heavy_weeks desc, employee_name 


