-- Write your PostgreSQL query statement below


select gender, day, 
SUM(score_points) over(partition by gender order by day rows between unbounded preceding and current row) as total
from scores
order by 1,2
