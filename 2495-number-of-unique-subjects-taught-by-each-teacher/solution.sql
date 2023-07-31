# Write your MySQL query statement below

select a.teacher_id,
max(a.rnk) as cnt
from
(select teacher_id,
dense_rank() over (partition by teacher_id order by subject_id) as rnk
from Teacher order by teacher_id, rnk desc) a
group by a.teacher_id
