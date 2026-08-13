-- Write your PostgreSQL query statement below

with rev_spend as(
    select user_id, spend_date,
    case when count(platform) over(partition by user_id, spend_date)=2 then 'both'
    else platform end as platform, amount
    from spending
),
agg_spend as(
    -- FIX: Aggregate per user/date/platform to eliminate duplicate 'both' rows
    select user_id, spend_date, platform, sum(amount) as amount
    from rev_spend
    group by user_id, spend_date, platform
),
plat_spend as(
    -- FIX: Use hardcoded platform list to ensure 'both' always appears
    select * from (values ('desktop'), ('mobile'), ('both')) as t(platform)
    cross join (select distinct spend_date from spending) p
)


select  p.spend_date, p.platform, coalesce(sum(a.amount), 0) as total_amount,
coalesce(count(distinct a.user_id), 0) as total_users
from plat_spend p left join agg_spend a
on p.platform = a.platform and p.spend_date = a.spend_date
group by p.spend_date, p.platform
