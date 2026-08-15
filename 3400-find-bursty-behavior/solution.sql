-- Write your PostgreSQL query statement below

with post_count as
(select user_id, post_date,
count(*) over(partition by user_id order by post_date range between current row and interval '6 days' following) as post_cnt 
from posts where post_date between '2024-02-01' and '2024-02-28'),

week_avg as
(
   select user_id, count(*)/4.0 as avg_weekly_posts
   from posts where post_date between '2024-02-01' and '2024-02-28'
   group by user_id 
)


select pc.user_id, max(post_cnt) as max_7day_posts, avg_weekly_posts
from post_count pc join week_avg wa
on pc.user_id = wa.user_id
where post_cnt >= 2*avg_weekly_posts
group by pc.user_id, avg_weekly_posts
