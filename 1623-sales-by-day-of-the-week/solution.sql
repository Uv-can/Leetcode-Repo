-- Write your PostgreSQL query statement below

with sales as(
select item_category, extract(DOW from order_date) day_of_week, coalesce(SUM(quantity), 0) as cnt
from orders o right join items i
on o.item_id = i.item_id
group by item_category, extract(DOW from order_date))


select item_category category, 
SUM(case when day_of_week = 1 then cnt else 0 end) as Monday,
SUM(case when day_of_week = 2 then cnt else 0 end) as Tuesday,
SUM(case when day_of_week = 3 then cnt else 0 end) as Wednesday,
SUM(case when day_of_week = 4 then cnt else 0 end) as Thursday,
SUM(case when day_of_week = 5 then cnt else 0 end) as Friday,
SUM(case when day_of_week = 6 then cnt else 0 end) as Saturday,
SUM(case when day_of_week = 0 then cnt else 0 end) as Sunday
from sales
group by item_category
order by 1
