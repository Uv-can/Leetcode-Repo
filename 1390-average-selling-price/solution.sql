# Write your MySQL query statement below



select a.product_id, round(SUM(a.price * b.units)/SUM(b.units),2) as average_price 
from
Prices a left join 
UnitsSold b
on a.product_id = b.product_id and 
(b.purchase_date between a.start_date and a.end_date)
group by a.product_id
