-- Write your PostgreSQL query statement below

with dtl_rest as(
select distinct customer_id,
count(order_id) over(partition by customer_id) as total_orders,
SUM(case when (TO_CHAR(order_timestamp, 'HH24:MI') between '11:00' and '14:00')
    or (TO_CHAR(order_timestamp, 'HH24:MI') between '18:00' and '21:00') then 1 else 0 end) over(partition by customer_id)as peak_orders,
SUM(order_rating) over(partition by customer_id) tot_rt,
SUM(case when order_rating is not NULL then 1 else 0 end) over(partition by customer_id)as cnt_rt
from restaurant_orders)

select customer_id, total_orders, CEIL((peak_orders*1.0/total_orders)*100) as peak_hour_percentage,
ROUND(tot_rt*1.0/cnt_rt, 2) as average_rating
from dtl_rest
where 
total_orders >= 3 and ((peak_orders*1.0/total_orders)*100.00) >= 60.00
and tot_rt/cnt_rt*1.0 >= 4.0
and cnt_rt >= total_orders*1.0/2
order by average_rating desc, customer_id desc
