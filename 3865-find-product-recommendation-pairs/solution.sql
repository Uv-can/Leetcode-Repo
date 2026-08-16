-- Write your PostgreSQL query statement below

select p1.product_id product1_id, p2.product_id product2_id, p.category as product1_category, p3.category as product2_category, count(distinct p1.user_id) as customer_count
from productpurchases p1 join productpurchases p2
on p1.user_id = p2.user_id and p1.product_id <> p2.product_id and p1.product_id < p2.product_id
join productinfo p on p1.product_id = p.product_id
join productinfo p3 on p2.product_id = p3.product_id
group by p1.product_id, p2.product_id, p.category, p3.category
having count(distinct p1.user_id) >= 3
order by customer_count desc, product1_id, product2_id
