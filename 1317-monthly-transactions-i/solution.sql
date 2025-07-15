-- Write your PostgreSQL query statement below


select trans_date as month, country, count(id) as trans_count, 
SUM(case when state = 'approved' then 1 else 0 end) as approved_count,
SUM(amount) as trans_total_amount,
SUM(case when state = 'approved' then amount else 0 end) as approved_total_amount
from
(select id, country, state, amount, to_char(trans_date, 'yyyy-MM') as trans_date
from transactions)
group by trans_date, country
