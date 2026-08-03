-- Write your PostgreSQL query statement below


select distinct user_id
from
(select user_id, created_at,
lead(created_at) over(partition by user_id order by created_at) as next_pur
from users) u
where next_pur is not NULL and next_pur - created_at <= 7

