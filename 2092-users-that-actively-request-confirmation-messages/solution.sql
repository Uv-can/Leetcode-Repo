-- Write your PostgreSQL query statement below
select distinct s.user_id
from confirmations s inner join confirmations c 
on c.user_id=s.user_id  and c.time_stamp <> s.time_stamp 
where abs(extract(EPOCH from (c.time_stamp - s.time_stamp))) <= 86400
