# Write your MySQL query statement below

select CEIL(minute/6.0) interval_no, SUM(order_count) total_orders
from orders
group by CEIL(minute/6.0)
order by 1

