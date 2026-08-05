-- Write your PostgreSQL query statement below

select cast(to_char(purchase_date, 'W') as int) week_of_month, purchase_date, SUM(amount_spend) total_amount
from Purchases
where EXTRACT(ISODOW FROM purchase_date) = '5' and to_char(purchase_date, 'MM-YYYY') = '11-2023'
group by to_char(purchase_date, 'W'), purchase_date
