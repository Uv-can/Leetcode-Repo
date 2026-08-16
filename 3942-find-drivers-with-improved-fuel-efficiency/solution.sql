-- Write your PostgreSQL query statement below
with first_half as(
    select driver_id, AVG(distance_km/fuel_consumed) as first_half_avg
    from trips
    where extract(MONTH from trip_date) <= 6
    group by driver_id
),
sec_half as(
    select driver_id, AVG(distance_km/fuel_consumed) as second_half_avg
    from trips
    where extract(MONTH from trip_date) > 6
    group by driver_id
)


select f.driver_id, d.driver_name, ROUND(first_half_avg,2) first_half_avg, ROUND(second_half_avg, 2) second_half_avg, ROUND(second_half_avg*1.0-first_half_avg*1.0, 2) as efficiency_improvement
from first_half f full outer join sec_half s
on f.driver_id = s.driver_id 
join drivers d 
on f.driver_id =  d.driver_id
where f.driver_id is not NULL and s.driver_id is not NULL and second_half_avg > first_half_avg
order by efficiency_improvement desc, driver_name
