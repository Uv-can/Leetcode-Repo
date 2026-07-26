-- Write your PostgreSQL query statement below

select distinct user_id
from
(
    select user_id, purchase_date,
lead(purchase_date) over(partition by user_id order by purchase_date ) as next_pur
from purchases
) p
where next_pur - purchase_date between 0 and 7

