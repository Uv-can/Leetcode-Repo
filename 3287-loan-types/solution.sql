-- Write your PostgreSQL query statement below

select distinct l1.user_id
from loans l1, loans l2
where l1.user_id = l2.user_id and l1.loan_type = 'Refinance' and l2.loan_type = 'Mortgage' 
order by 1
