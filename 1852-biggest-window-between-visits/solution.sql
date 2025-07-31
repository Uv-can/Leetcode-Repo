-- Write your PostgreSQL query statement below
select user_id, max(wind) as biggest_window
from
(select user_id, 
abs( coalesce(lead(visit_date, 1) over(partition by user_id order by visit_date), '2021-1-1') - visit_date) as wind
from uservisits) a
group by user_id
order by 1

