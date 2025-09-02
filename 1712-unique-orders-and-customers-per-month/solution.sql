-- Write your PostgreSQL query statement below


select to_char(order_date, 'yyyy-MM') as month, count(distinct order_id) as order_count,
 count(distinct customer_id) as customer_count
from orders
where invoice > 20
group by to_char(order_date, 'yyyy-MM')

