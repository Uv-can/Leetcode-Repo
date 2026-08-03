-- Write your PostgreSQL query statement below
select distinct flight_id, 
case when total_pass < capacity then total_pass else capacity end as booked_cnt,
case when total_pass > capacity then (total_pass - capacity) else 0 end as waitlist_cnt
from
(select f.flight_id, f.capacity, 
count(p.flight_id) over(partition by p.flight_id) as total_pass
from flights f left join passengers p on f.flight_id = p.flight_id) b
order by 1
 
