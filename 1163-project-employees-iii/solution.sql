-- Write your PostgreSQL query statement below

select a.project_id, a.employee_id from
(select p.project_id, p.employee_Id,
dense_rank() over(partition by p.project_id order by experience_years desc) as rnk
from project p join employee e 
on p.employee_id = e.employee_id) a
where a.rnk =1

