-- Write your PostgreSQL query statement below

select round(SUM(item_count * order_occurrences*1.0)/SUM(order_occurrences), 2) as average_items_per_order
from orders
