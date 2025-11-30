-- Write your PostgreSQL query statement below


select user_id
from emails e join texts t
on e.email_id = t.email_id and t.action_date::date = e.signup_date::date + interval '1 Day'
where t.signup_action = 'Verified'
order by 1
