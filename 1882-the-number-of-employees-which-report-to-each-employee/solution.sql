-- Write your PostgreSQL query statement below


select e1.reports_to as employee_id, e2.name, count(distinct e1.employee_id) as reports_count, AVG(e1.age)::INTEGER as average_age
from Employees e1 left join employees e2 
on e1.reports_to = e2.employee_id
where e1.reports_to is not null
group by e1.reports_to, e2.name
