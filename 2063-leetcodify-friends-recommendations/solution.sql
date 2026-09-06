-- Write your PostgreSQL query statement below
/*with friends as (
    select user1_id, user2_id from friendship
union select user2_id user1_id, user1_id user2_id from friendship
)

select distinct l1.user_id, l2.user_id recommended_id
from listens l1 join listens l2
on l1.song_id = l2.song_id and l1.user_id <> l2.user_id and l1.day = l2.day
--join friends f
--on l1.user_id <> f.user1_id and l2.user_id <> f.user2_id
where (l1.user_id, l2.user_id) not in (select user1_id , user2_id  from friends)
and (l2.user_id, l1.user_id) not in (select user1_id , user2_id  from friends)
group by l1.user_id, l2.user_id
having count(distinct l1.song_id) >= 3*/

-- JOIN listens column to itself ON song_id + date + user1 != user2
-- GROUP this table by user1, user2, date and get the count of rows
-- SELECT FROM this table where count is > 2

WITH DistinctListens AS (
    SELECT DISTINCT * FROM Listens
),
Users_Liked_Same_Song AS (
    SELECT l1.user_id AS user1, l2.user_id AS user2, l1.song_id, l1.day
    FROM DistinctListens l1
    JOIN DistinctListens l2 ON l1.user_id != l2.user_id AND l1.song_id = l2.song_id AND l1.day = l2.day
    WHERE (l1.user_id, l2.user_id) NOT IN (SELECT * FROM Friendship) AND (l2.user_id, l1.user_id) NOT IN (SELECT * FROM Friendship)
),
Number_of_Same_Songs AS (
    SELECT user1, user2, day, COUNT(*) num_songs
    FROM Users_Liked_Same_Song
    GROUP BY user1, user2, day
)



SELECT DISTINCT user1 user_id, user2 recommended_id FROM Number_of_Same_Songs
WHERE num_songs > 2
