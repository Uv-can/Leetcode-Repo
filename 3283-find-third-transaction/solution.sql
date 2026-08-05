# Write your MySQL query statement below


with trans as (select user_id, spend, transaction_date,
lead(spend, 1) over(partition by user_id order by transaction_date desc) as last_trans,
lead(spend, 2) over(partition by user_id order by transaction_date desc) as sec_last_trans,
rank() over(partition by user_id order by transaction_date) rnk
from transactions)

select user_id, spend third_transaction_spend, transaction_date third_transaction_date
from trans
where spend > last_trans and spend > sec_last_trans and rnk = 3

