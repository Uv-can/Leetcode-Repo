-- Write your PostgreSQL query statement below

select a.person_name from
(select person_name,
SUM(weight) over(order by Turn rows between unbounded preceding and current row) as total_weight
from Queue) a
where a.total_weight <= 1000
order by total_weight desc
limit 1
