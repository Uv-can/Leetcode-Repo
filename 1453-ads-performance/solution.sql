-- Write your PostgreSQL query statement below

select ad_id,
case when ctr_divisor = 0 then 0.00 else round((ctr_num/ctr_divisor) * 100, 2) end as ctr
from
(select ad_id,
(SUM(case when action in ('Clicked') then 1 else 0 end)*1.0) as ctr_num,
(SUM(case when action in ('Clicked','Viewed') then 1 else 0 end)*1.0) as ctr_divisor
from Ads
group by ad_id)
order by ctr desc, ad_id
