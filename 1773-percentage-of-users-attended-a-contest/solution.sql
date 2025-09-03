-- Write your PostgreSQL query statement below


select contest_id, round(count(distinct user_id)*100.00/(select count( user_id) from users), 2) as percentage
from register 
group by contest_id
order by 2 desc, 1
