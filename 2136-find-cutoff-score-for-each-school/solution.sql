-- Write your PostgreSQL query statement below


select s.school_id, coalesce(MIN(e.score), -1) as score
from schools s left join exam e
on e.student_count <= s.capacity 
group by s.school_id
