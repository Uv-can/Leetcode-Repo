-- Write your PostgreSQL query statement below

with months as (
    select generate_series as month from generate_series(1,12)
),

drivers as (
    select driver_id, join_date, case when join_date < '01-01-2020' then 1 else extract(month from join_date) end as month
    from drivers where extract(year from join_date) <= 2020
),


ride as (
    select extract(month from requested_at) as month, a.ride_id
    from acceptedrides a join rides r 
    on a.ride_id = r.ride_id
    where extract(year from requested_at) = 2020
)


select m.month,
count(distinct d.driver_id) as active_drivers,
count(distinct r.ride_id) as accepted_rides
from months m left join drivers d
on  d.month <= m.month
left join ride r
on m.month = r.month
group by m.month
order by 1
