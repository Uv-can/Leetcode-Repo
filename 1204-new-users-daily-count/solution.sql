# Write your MySQL query statement below

select login_date, count(distinct user_id) as user_count from
(select user_id, min(activity_date) as login_date from Traffic where activity = 'login' group by user_id) t2
where login_date between '2019-04-01' and '2019-06-30'
group by login_date

