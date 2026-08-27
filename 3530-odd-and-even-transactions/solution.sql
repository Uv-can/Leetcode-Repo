-- Write your PostgreSQL query statement below


select transaction_date,
coalesce(SUM(case when amount%2 != 0 then amount else 0 end),0) as odd_sum,
coalesce(SUM(case when amount%2 = 0 then amount else 0 end), 0) as even_sum
from transactions
group by transaction_date
order by 1
