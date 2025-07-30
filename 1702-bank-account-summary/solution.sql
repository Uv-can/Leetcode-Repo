-- Write your PostgreSQL query statement below

select u.user_id, u.user_name,
coalesce(pt.paid_am, 0) - coalesce(pb.paid_am, 0) + u.credit as credit,
case when (coalesce(pt.paid_am, 0) - coalesce(pb.paid_am, 0) + u.credit) > 0 then 'No' else 'Yes' end as credit_limit_breached
from users u left join
(select paid_by, SUM(amount) as paid_am from Transactions group by paid_by) pb on u.user_id = pb.paid_by
left join (select paid_to, SUM(amount) as paid_am from Transactions group by paid_to) pt on u.user_id = pt.paid_to

