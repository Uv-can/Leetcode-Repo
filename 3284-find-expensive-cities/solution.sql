-- Write your PostgreSQL query statement below

select
 city
from
(select distinct city,
AVG(price) over(partition by city) as avg_prc
from listings) a cross join
(select AVG(price) as nat_avg from listings) l
where a.avg_prc > l.nat_avg
order by 1
