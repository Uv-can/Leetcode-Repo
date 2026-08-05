# Write your MySQL query statement below

select seller_id, num_items
from
(
    select u.seller_id, Count(distinct o.item_id) num_items,
dense_rank() over( order by Count(distinct o.item_id) desc) as rnk
from users u left join orders o 
on u.seller_id = o.seller_id
left join items i
on o.item_id = i.item_id
where i.item_brand <> u.favorite_brand
group by u.seller_id
) a 
where a.rnk = 1
