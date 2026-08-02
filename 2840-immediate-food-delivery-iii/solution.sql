-- Write your PostgreSQL query statement below


select order_date, 
round(SUM(case when order_date = customer_pref_delivery_date then 1.0 else 0 end)/ count(*) * 100.00, 2) as immediate_percentage
from delivery
group by order_date
order by order_date
