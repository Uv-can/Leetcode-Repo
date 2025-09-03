-- Write your PostgreSQL query statement b

select seller_name 
from seller 
where seller_id not in (
    select distinct seller_id 
    from orders 
    where to_char(sale_date,'yyyy') = '2020'
)
order by 1
