-- Write your PostgreSQL query statement below

select airport_id
from(
select a.airport_id, 
dense_rank() over( order by SUM(tot) desc ) rnk
from
(select departure_airport as airport_id, SUM(flights_count) as tot from flights group by departure_airport
UNION ALL
select arrival_airport as airport_id, SUM(flights_count) as tot from flights group by arrival_airport) a
group by airport_id
)b where rnk = 1

