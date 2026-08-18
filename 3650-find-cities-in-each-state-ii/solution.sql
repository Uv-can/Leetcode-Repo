-- Write your PostgreSQL query statement below


select state, 
string_agg(trim(city), ', ' order by city) as cities,
SUM(case when lower(left(state, 1)) = lower(left(city, 1)) then 1 else 0 end) as matching_letter_count
from cities
group by state
having count(*) >= 3 and SUM(case when lower(left(state, 1)) = lower(left(city, 1)) then 1 else 0 end) >= 1
order by 3 desc, 1
