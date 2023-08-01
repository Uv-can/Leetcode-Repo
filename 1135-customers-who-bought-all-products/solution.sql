# Write your MySQL query statement below
select a.customer_id
from
(select customer_id, count(distinct product_key) as pro_cnt
from Customer group by customer_id) a cross join
(select count(distinct product_key) as pro_cnt from Product ) b
where a.pro_cnt = b.pro_cnt
