-- Write your PostgreSQL query statement below


select u.username, u.activity, u.startDate, u.endDate
from
(select username, activity, startDate, endDate,
dense_rank() over(partition by username order by endDate desc) as rnk,
count(username) over(partition by username) as cnt
from useractivity) u
where u.rnk = 2 or u.cnt = 1 

