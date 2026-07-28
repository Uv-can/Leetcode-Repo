-- Write your PostgreSQL query statement below

select user_id, gender
from
(select user_id, gender,
dense_rank() over(partition by gender order by user_id) as rnk
from genders) a
order by rnk, length(gender) desc

