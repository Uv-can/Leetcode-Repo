# Write your MySQL query statement below


select a.product_name, b.unit 
from 
Products a left join 
(select product_id, SUM(unit) as unit
from orders 
where order_date like '2020-02-%'
group by product_id) b
on a.product_id = b.product_id
where unit >= 100
