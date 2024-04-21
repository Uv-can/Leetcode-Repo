# Write your MySQL query statement below


select distinct a.project_id,
round(avg(b.experience_years) over(partition by a.project_id), 2) as average_years
from Project a inner join Employee b
on a.employee_id = b.employee_id 

