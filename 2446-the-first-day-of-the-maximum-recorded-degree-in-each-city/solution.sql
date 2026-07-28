-- Write your PostgreSQL query statement below

select city_id, day,degree
from
(select city_id, day,degree,
dense_rank() over(partition by city_id order by degree desc, day) as rnk
from weather)a
where rnk = 1
