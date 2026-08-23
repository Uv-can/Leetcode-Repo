-- Write your PostgreSQL query statement below

with trans as(
    select account_id,  to_char(day, 'MM-yyyy') as mon, SUM(amount) as monthly_sum
    from transactions
    where type = 'Creditor'
    group by account_id, to_char(day, 'MM-yyyy')
)

select distinct t1.account_id
from trans t1 join trans t2 on t1.account_id=t2.account_id and to_date(t2.mon, 'MM-yyyy') - interval '1 month' = to_date(t1.mon, 'MM-yyyy')
left join accounts a
on t1.account_id = a.account_id
where t1.monthly_sum > a.max_income and t2.monthly_sum > a.max_income



