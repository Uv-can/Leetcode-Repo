-- Write your PostgreSQL query statement below
with lot as(
    select car_id, lot_id from
    (
        select car_id, lot_id,
    dense_rank() over(partition by car_id order by SUM(extract(epoch from (exit_time - entry_time) )::INT)desc) as rnk
    from parkingtransactions
    group by car_id, lot_id
    ) pt where rnk = 1
)
select p.car_id, p.total_fee_paid, p.avg_hourly_fee, l.lot_id as most_time_lot
from
(select car_id,SUM(fee_paid) total_fee_paid, ROUND(SUM(fee_paid)/(SUM(extract(epoch from (exit_time - entry_time))::INTEGER)/3600.00),2) as avg_hourly_fee
from parkingtransactions 
group by car_id) p join lot l
on p.car_id = l.car_id
order by p.car_id


