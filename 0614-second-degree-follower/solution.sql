-- Write your PostgreSQL query statement below




select followee as follower, cnt as num from
(select followee, count(follower) as cnt from Follow 
where followee in (select distinct follower from follow) 
group by followee having count(follower) >= 1)
order by 1
