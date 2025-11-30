-- Write your PostgreSQL query statement below


select state, string_agg(city, ', ') as cities
from (select * from cities order by 1, 2) c
group by state
order by 1, 2
