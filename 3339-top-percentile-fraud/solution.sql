-- Write your PostgreSQL query statement below
with state_cte as
(select state, count(distinct fraud_score) as tot_cnt
from Fraud group by state),

fraud_rnk as
(select policy_id, state, fraud_score,
dense_rank() over(partition by state order by fraud_score) as rnk
from Fraud) 

select policy_id, f.state, fraud_score
from fraud_rnk f join state_cte s on f.state = s.state
where rnk * 1.0 >= (0.95 * (tot_cnt -1) + 1)
order by f.state, fraud_score desc, policy_id

