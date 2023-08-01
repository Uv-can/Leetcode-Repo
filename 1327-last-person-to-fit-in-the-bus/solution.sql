# Write your MySQL query statement below

select a.person_name
from 
(select person_name,
SUM(weight) over(order by turn rows between unbounded preceding and current row ) as cum_sum
from Queue ) a
where a.cum_sum <= 1000 
order by a.cum_sum desc limit 1

