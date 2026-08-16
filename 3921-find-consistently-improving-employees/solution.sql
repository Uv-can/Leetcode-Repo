-- Write your PostgreSQL query statement below
with perf_rev as(
select employee_id, review_date, rating,
count(*) over(partition by employee_id) as tot_cnt,
lead(rating, 1) over(partition by employee_id order by review_date desc) as nxt_rt,
lead(rating, 2) over(partition by employee_id order by review_date desc) as sec_nxt_rt,
row_number() over(partition by employee_id order by review_date desc) as rnum
from performance_reviews)



select p.employee_id, e.name,  rating - sec_nxt_rt as improvement_score
from (select * from perf_rev where rnum = 1 and tot_cnt >= 3) p join employees e
on p.employee_id = e.employee_id
where rating > nxt_rt and nxt_rt > sec_nxt_rt
order by improvement_score desc, name
