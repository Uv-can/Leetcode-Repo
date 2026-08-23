-- Write your PostgreSQL query statement below
with week_mon as(
    select generate_series as week_of_month, membership from generate_series(1, 4) cross join (select 'Premium' membership UNION select 'VIP' membership)
),

purc as(
select cast(extract(WEEK from p.purchase_date) as integer)-43 as week, u.membership, SUM(p.amount_spend) total_amount
from purchases p join users u
on p.user_id = u.user_id 
where  EXTRACT(isodow FROM p.purchase_date) = 5
group by  cast(extract(WEEK from p.purchase_date) as integer)-43, u.membership
)



select w.week_of_month, w.membership, coalesce(p.total_amount, 0) as total_amount
from week_mon w 
left join purc p
on w.week_of_month = p.week and w.membership = p.membership
order by w.week_of_month, w.membership
