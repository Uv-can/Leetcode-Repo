-- Write your PostgreSQL query statement below

select id, name
from students
where department_id not in (select id from Departments)
