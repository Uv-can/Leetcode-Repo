-- Write your PostgreSQL query statement below
with cte as(
select category, case when extract(MONTH from sale_date) in (12,1,2) then 'Winter'
     when extract(MONTH from sale_date)  in (3,4,5) then 'Spring'
     when extract(MONTH from sale_date)  in (6,7,8) then 'Summer'
     when extract(MONTH from sale_date)  in (9,10,11) then 'Fall' end as Season, SUM(quantity) tot_qua, SUM(quantity * price) as rev
from sales s join products p on s.product_id = p.product_id
group by category, extract(MONTH from sale_date) 
)

select season, category, total_quantity, total_revenue from(
select 
season, category, SUM(tot_qua) as total_quantity, SUM(rev) total_revenue,
dense_rank() over(partition by season order by SUM(tot_qua) desc, SUM(rev) desc, category) as rnk
from cte 
group by category, season
order by total_quantity desc, total_revenue desc, category) a
where rnk = 1
order by season
