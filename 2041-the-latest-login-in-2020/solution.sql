-- Write your PostgreSQL query statement below

select a.user_id, a.time_stamp as last_stamp
from
(select user_id, time_stamp,
row_number() over(partition by user_id order by time_stamp desc) as rnk
from logins 
where to_char(time_stamp, 'yyyy') = '2020') a
where a.rnk = 1
