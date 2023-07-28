# Write your MySQL query statement below


select b.contest_id, round((b.cnt_users/a.dist_id)*100, 2) as percentage
from 
(select distinct count(user_id) as dist_id
from Users) a ,
(select contest_id, count(*) as cnt_users
from Register
group by contest_id) b
order by 2 desc, 1
