# Write your MySQL query statement below

select a.employee_id, a.name, b.reports_count, b.average_age
from Employees a join
(select reports_to, count(*) as reports_count, round(avg(age)) as average_age from Employees group by reports_to) b
on a.employee_id = b.reports_to
order by a.employee_id

