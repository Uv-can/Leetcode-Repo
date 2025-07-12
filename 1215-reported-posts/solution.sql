-- Write your PostgreSQL query statement below

select extra as report_reason, count(distinct post_id) as report_count
from Actions
where action_date = '2019-07-05'::Date - INTERVAL '1 day' and action = 'report'
group by extra
