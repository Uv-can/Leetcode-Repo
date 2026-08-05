# Write your MySQL query statement below

select city, peak_calling_hour, number_of_calls
from
(select city, extract(hour from call_time) as peak_calling_hour, count(*) as number_of_calls,
dense_rank() over( partition by city order by count(*) desc) as rnk
from calls
group by city,  extract(hour from call_time))a
where rnk = 1
order by 2 desc, 1 desc
