-- Write your PostgreSQL query statement below
with temp_cte as
(
    select v.fuel_type, v.driver_id, 
ROUND(AVG(rating),2) as  rating, SUM(t.distance) as distance,
dense_rank() over(partition by v.fuel_type order by  AVG(rating) desc,SUM(distance)desc) as rnum
from vehicles v
join trips t on
v.vehicle_id = t.vehicle_id
group by v.fuel_type, v.driver_id)

select fuel_type, driver_id, rating, distance from
(select fuel_type, t.driver_id, rating, distance,
row_number() over(partition by fuel_type order by rating desc, distance desc, d.accidents) as rnk
from temp_cte t left join drivers d
on t.driver_id = d.driver_id) a
where rnk = 1
order by fuel_type 

