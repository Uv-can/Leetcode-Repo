-- Write your PostgreSQL query statement below

with cte as(
    select '[0-5>' as bin, 0 as min_duration, 5*60 as max_duration
    union all
    select '[5-10>' as bin, 5*60 as min_duration, 10*60 as max_duration
    union all
    select '[10-15>' as bin, 10*60 as min_duration, 15*60 as max_duration
    union all
    select '15 or more' as bin, 15*60 as min_duration, 2147483647 AS max_duration
)

select cte.bin, count(s.session_id) as total
from sessions s
right join cte
    on s.duration >= min_duration
    and s.duration < max_duration
group by cte.bin
