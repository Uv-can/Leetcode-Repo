-- Write your PostgreSQL query statement below

select sum(apple_count) as apple_count, sum(orange_count) as orange_count
from
(select
case when b.chest_id is NULL then b.apple_count else b.apple_count + c.apple_count end as apple_count,
case when b.chest_id is NULL then b.orange_count else b.orange_count + c.orange_count end as orange_count
from boxes b left join chests c
on b.chest_id = c.chest_id)

