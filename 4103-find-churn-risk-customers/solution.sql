-- Write your PostgreSQL query statement below

with dtl_sub as
(select user_id, monthly_amount, event_date, plan_name,
coalesce(SUM(case when event_type = 'downgrade' then 1 else 0 end) over(partition by user_id), 0) as dg_cnt,
MAX(monthly_amount) over(partition by user_id) as max_rev,
max(event_date) over(partition by user_id) - min(event_date) over(partition by user_id) as act_days,
row_number() over(partition by user_id order by event_date desc) as rnum
from subscription_events
where user_id not in (select distinct user_id from subscription_events where event_type = 'cancel'))


select user_id, plan_name as current_plan, monthly_amount as current_monthly_amount,
max_rev as max_historical_amount, act_days as days_as_subscriber
from dtl_sub
where max_rev/2 > monthly_amount and dg_cnt >= 1 and act_days >= 60
order by days_as_subscriber desc, user_id

