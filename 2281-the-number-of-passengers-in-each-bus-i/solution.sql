-- Write your PostgreSQL query statement below


with bus as(
    select bus_id, arrival_time,
    coalesce(lag(arrival_time, 1) over(order by arrival_time), 0) as lag_arr
    from Buses
)
select b.bus_id, count(p.passenger_id) as passengers_cnt
from bus b left join passengers p
on p.arrival_time > b.lag_arr and p.arrival_time <= b.arrival_time
group by b.bus_id
order by 1
