-- Write your PostgreSQL query statement below


select s.student_id, s.student_name, sub.subject_name, coalesce(exam.attended_exams, 0) as attended_exams
from students s cross join subjects sub
Left join (
    select student_id, subject_name, count(*) as attended_exams
    from examinations
    group by student_id, subject_name
) as exam
on s.student_id = exam.student_id and sub.subject_name = exam.subject_name
order by 1,3 




