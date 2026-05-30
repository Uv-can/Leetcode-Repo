-- Write your PostgreSQL query statement below
select month, country,
SUM(approved_count) as approved_count,
SUM(approved_amount) as approved_amount,
SUM(chargeback_count) as chargeback_count,
SUM(chargeback_amount) as chargeback_amount
from
(select to_char(trans_date, 'yyyy-MM') as month, country, 
SUM(case when state = 'approved' then 1 else 0 end) as approved_count,
SUM(case when state = 'approved' then amount else 0 end) as approved_amount,
0 as chargeback_count, 0 as chargeback_amount
from transactions t 
group by to_char(trans_date, 'yyyy-MM'), country
UNION
select to_char(c.trans_date, 'yyyy-MM') as month, t.country, 
0 as approved_count , 0 as approved_amount,
count(distinct c.trans_id) as chargeback_countt,
SUM(amount) as chargeback_amount
from transactions t  join chargebacks c on t.id = c.trans_id
group by to_char(c.trans_date, 'yyyy-MM'), t.country) a
where not (a.approved_count = 0 and a.approved_amount = 0 and a.chargeback_count = 0 and a.chargeback_amount = 0)
group by month, country
