-- Write your PostgreSQL query statement below

select w.name as warehouse_name,
SUM(w.units * p.prod_vol) as volume
from
warehouse w join
(select product_id, width*length*height as prod_vol from products) p 
on w.product_id = p.product_id
group by w.name
