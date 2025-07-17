-- Write your PostgreSQL query statement below


select distinct l.page_id as recommended_page
from friendship f join likes l
on (f.user1_id = l.user_id or f.user2_id = l.user_id) and (f.user1_id = 1 or f.user2_id = 1) and
l.page_id not in (select distinct page_id from likes where user_id = 1)
