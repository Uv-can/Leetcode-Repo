-- Write your PostgreSQL query statement below
with cte as (select
        visits.user_id as visiting_user,
        visit_date,
        count(transactions.user_id) as num_transactions
    from visits
    left join transactions on visits.user_id = transactions.user_id and visits.visit_date = transactions.transaction_date
    group by 1,2),

series as(
    select * from generate_series(0, (select max(num_transactions) from cte))
)


select generate_series as transactions_count, coalesce(cnt, 0) as visits_count
from series s left join 
(select num_transactions, count(*) cnt from cte group by num_transactions) c
on s.generate_series = c.num_transactions
