-- Write your PostgreSQL query statement below

--get the pages not like by user
--get count of friends liked those posts
-- reccomend page if one friedn liked it
with friends as
(select user1_id, user2_id from friendship 
UNION ALL
select user2_id as user1_id, user1_id as user2_id from friendship)

select f.user1_id as user_id, l.page_id, count(distinct f.user2_id) as friends_likes
from friends f join likes l
on f.user2_id = l.user_id  
where (f.user1_id,l.page_id) not in (select * from likes)
group by f.user1_id , l.page_id
