-- Write your PostgreSQL query statement below


with day_sales as (select * from sales s cross join LATERAL 
    generate_series(s.period_start, s.period_end, '1 day'::interval) AS d(generated_date))

select p.product_id, p.product_name, to_char(s.generated_date, 'YYYY') as report_year, SUM(average_daily_sales) as total_amount
from product p left join day_sales s
on p.product_id = s.product_id
group by p.product_id, p.product_name, to_char(s.generated_date, 'YYYY')
order by 1, 3
