-- Write your PostgreSQL query statement below

select d.dept_name, coalesce(count(distinct s.student_id), 0) as student_number
from student s right join department d
on s.dept_id = d.dept_id
group by  d.dept_name
order by student_number desc, dept_name
