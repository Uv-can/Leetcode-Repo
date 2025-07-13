# Write your MySQL query statement below

select distinct activity from
(select activity, 
dense_rank() over(order by count(*)) as min_cnt,
dense_rank() over(order by count(*) desc) as max_cnt
from friends
group by activity
) a
where min_cnt > 1 and max_cnt > 1

