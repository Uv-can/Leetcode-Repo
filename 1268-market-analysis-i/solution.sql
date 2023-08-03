# Write your MySQL query statement below


select a.user_id as buyer_id, a.join_date,
case when b.buyer_id is NULL then 0 else b.cnt end as orders_in_2019
from Users a left join
(select buyer_id , count(*) as cnt from Orders 
where order_date like '2019%' group by buyer_id)b on a.user_id = b.buyer_id

