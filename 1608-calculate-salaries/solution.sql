-- Write your PostgreSQL query statement below



select s.company_id, s.employee_id, s.employee_name, round(s.salary * t.tax) as salary
from salaries s join
(select company_id, case when max(salary) < 1000 then 1 when max(salary) between 1000 and 10000 then 0.76 else 0.51 end as tax from salaries group by company_id) t
on s.company_id = t.company_id


