-- Write your PostgreSQL query statement below


select problem_id
from problems
where likes*1.0/(likes+dislikes)*100.0 < 60.0
order by 1
