-- Write your PostgreSQL query statement below
with next_item as (
select order_date, item_id, seller_id,
lag(item_id, 1) over(partition by seller_id order by order_date) as next_sold,
row_number() over(partition by seller_id order by order_date) as rnum
from orders
)



select u.user_id as seller_id,
CASE 
  WHEN n.seller_id IS NULL THEN 'no'
  WHEN i.item_brand = u.favorite_brand THEN 'yes'
  ELSE 'no'
END as "2nd_item_fav_brand"
from users u left join
(select * from next_item where rnum = 2) n 
on n.seller_id = u.user_id
left join 
items i 
on n.item_id = i.item_id









--from orders o left join users u
--on o.seller_id = u.user_id
