-- Write your PostgreSQL query statement below
with dtl_cust as
(
    select distinct customer_id,
SUM(case when transaction_type = 'purchase' then 1 else 0 end) over(partition by customer_id) as pur_cnt,
SUM(case when transaction_type = 'refund' then 1 else 0 end) over(partition by customer_id) as ref_cnt,
count(transaction_id) over(partition by customer_id) as tot_cnt,
max(transaction_date) over(partition by customer_id) - min(transaction_date) over(partition by customer_id) act_days
from customer_transactions )

select customer_id 
from dtl_cust
where  pur_cnt >= 3 and act_days >= 30 and ref_cnt < tot_cnt*0.20 
order by 1
