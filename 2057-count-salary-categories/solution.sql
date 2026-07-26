-- Write your PostgreSQL query statement below


select 'Low Salary' as Category, count(*) as accounts_count from accounts where income < 20000
UNION
select 'Average Salary' as Category, count(*) as accounts_count from accounts where income between 20000 and 50000
UNION
select 'High Salary' as Category, count(*) as accounts_count from accounts where income > 50000
