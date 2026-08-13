-- Write your PostgreSQL query statement below

with all_tasks as
(select 'succeeded' as task_decision, success_date as date from succeeded WHERE success_date >= '2019-01-01' AND success_date <= '2019-12-31'
UNION ALL 
select 'failed' as task_decision, fail_date as date from failed WHERE fail_date >= '2019-01-01' AND fail_date <= '2019-12-31'),

intervals as (select task_decision, date,
ROW_NUMBER() OVER (ORDER BY date) -
ROW_NUMBER() over(partition by task_decision order by date) as rnk
from all_tasks)

select task_decision as period_state, MIN(date) as start_date, max(date) as end_date
from intervals
group by task_decision, rnk
order by start_date
