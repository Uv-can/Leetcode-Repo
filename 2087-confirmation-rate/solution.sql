# Write your MySQL query statement below


select c.user_id, coalesce(round((b.confirmed/a.total),2), 0) as confirmation_rate
from
Signups c left join 
(select user_id, coalesce(count(*),0) as total 
from Confirmations 
group by user_id) a on c.user_id = a.user_id
left join
(select user_id, coalesce(count(*),0) as confirmed
from Confirmations 
where action = 'confirmed' 
group by user_id) b
on a.user_id = b.user_id
