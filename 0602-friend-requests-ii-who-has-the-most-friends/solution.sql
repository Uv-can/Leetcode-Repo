-- Write your PostgreSQL query statement below

with req_cnt as (select requester_id, count(requester_id) as req_cnt from requestaccepted group by 
requester_id),
acp_cnt as (select accepter_id, count(accepter_id) as acp_cnt from requestaccepted group by 
accepter_id)
select coalesce(r.requester_id, a.accepter_id) as id, MAX(coalesce(r.req_cnt, 0) + coalesce(a.acp_cnt,0)) as num
from req_cnt r full outer join acp_cnt a
on r.requester_id = a.accepter_id
group by r.requester_id, a.accepter_id
order by num desc
limit 1

