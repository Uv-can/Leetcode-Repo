# Write your MySQL query statement below

select distinct a.product_id, case when b.product_id is null then 10 else b.prc end as price
from Products a left join 
(select product_id, change_date as dt, 
 first_value(new_price) over( partition by product_id order by change_date desc) as prc,
 row_number() over(partition by product_id order by change_date desc) as rnk
from Products where change_date <= date('2019-08-16')) b on a.product_id = b.product_id and b.rnk = 1 

