-- Write your PostgreSQL query statement below
with exam_score as
(
    select exam_id, student_id,
    case when score > 
MIN(score) over(partition by exam_id) and
score < MAX(score) over(partition by exam_id) then 1 else 0 end as quite_std,
count(exam_id) over(partition by student_id) as tot_exams
from exam
),

quite_std as (
    select student_id 
    from exam_score
    group by student_id, tot_exams
    having SUM(quite_std) = tot_exams
)

select student_id, student_name 
from student
where student_id in (select distinct student_id from quite_std)
order by student_id




