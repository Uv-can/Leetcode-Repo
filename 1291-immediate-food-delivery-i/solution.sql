# Write your MySQL query statement below


select round((a.fast_cnt/a.total)*100, 2) as immediate_percentage
from
(select count(*) as total ,
SUM(case when order_date = customer_pref_delivery_date then 1 else 0 end) as fast_cnt
from Delivery) a

