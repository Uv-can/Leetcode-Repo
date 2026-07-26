-- Write your PostgreSQL query statement below

select member_id, name,
case when conv_rt >= 80 then 'Diamond'
     when conv_rt >= 50 then 'Gold'
     when conv_rt < 50 then 'Silver'
     else 'Bronze' end as category
from
(select m.member_id, m.name, 
 100.00*count(p.visit_id) / NULLIF(count(v.visit_id), 0) as conv_rt
from members m left join visits v on m.member_id = v.member_id
left join purchases p on v.visit_id = p.visit_id
group by m.member_id, m.name) a
order by 1
