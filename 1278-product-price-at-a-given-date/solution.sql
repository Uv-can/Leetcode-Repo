-- Write your PostgreSQL query statement below


select p.product_id, p.price
from
(select product_id, new_price as price,
dense_rank() over(partition by product_id order by change_date desc) as rnk
from products
where change_date <= '2019-08-16') p
where p.rnk = 1
UNION ALL
SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'
