-- Write your PostgreSQL query statement below

select b.bike_number, b.end_time
from
(select bike_number, end_time,
dense_rank() over(partition by bike_number order by end_time desc) as rnk
from bikes) b
where b.rnk = 1
order by 2 desc
