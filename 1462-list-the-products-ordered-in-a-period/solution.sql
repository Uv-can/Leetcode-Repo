# Write your MySQL query statement below
select a.product_name, b.unit
from Products a left join
(select distinct product_id, 
sum(unit) over(partition by product_id) as unit 
from Orders where month(order_date) = 2 and year(order_date) = 2020) b
on a.product_id = b.product_id 
Where b.unit >= 100
