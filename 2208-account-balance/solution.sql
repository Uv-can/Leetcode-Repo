-- Write your PostgreSQL query statement below


select account_id ,day ,
sum(case when type='Deposit' then amount else -1*amount end) over (partition by account_id order by day asc ) as balance 
from transactions 
order by account_id asc ,day asc
