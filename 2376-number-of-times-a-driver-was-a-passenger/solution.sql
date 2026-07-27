-- Write your PostgreSQL query statement below



select a.driver_id,count(distinct b.ride_id)cnt
from Rides a
left join rides b
on a.driver_id =b.passenger_id  
group by a.driver_id
