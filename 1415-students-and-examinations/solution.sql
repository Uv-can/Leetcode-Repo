# Write your MySQL query statement below



select x.student_id, x.student_name, x.subject_name, SUM(x.cnt) as attended_exams
from
(select a.student_id, a.student_name, c.subject_name,
case when b.subject_name is Null then 0 else 1 end as cnt
from Students a
cross join
Subjects c
left join
Examinations b
on a.student_id = b.student_id and c.subject_name = b.subject_name) x
group by x.student_id, x.student_name, x.subject_name
order by 1,3
