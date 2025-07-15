-- Write your PostgreSQL query statement below

select a.student_id, a.course_id, a.grade
from
(select student_id, course_id, 
MAX(grade) over(partition by student_id) as grade,
dense_rank() over(partition by student_id order by grade desc, course_id) as rnk
from enrollments )a
where a.rnk = 1
order by 1
