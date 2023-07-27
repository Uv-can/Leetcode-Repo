# Write your MySQL query statement below


select a.customer_id, count(*) as count_no_trans
from Visits a left join Transactions b
on a.visit_id = b.visit_id 
where b.visit_id is Null
group by a.customer_id
