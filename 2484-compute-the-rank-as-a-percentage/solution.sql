-- Write your PostgreSQL query statement below

select student_id, department_id, coalesce(round((rnk - 1) * 100.00/NULLIF((tot_dept -1), 0), 2), 0) as percentage
from
(select student_id, department_id,
count(student_id) over(partition by department_id) as tot_dept,
rank() over(partition by department_id order by mark desc) as rnk
from students)a

