-- Write your PostgreSQL query statement below
--select id, 'Leaf' as type from tree where p_id is not NULL and id not in (select distinct p_id from tree where p_Id is not NULL)
--UNION ALL
--select id, 'Inner' as type from tree where p_id is not NULL and id in (select distinct p_id from tree)
--UNION ALL
--select id, 'Root' as type from tree where p_id is NULL

select id,
case when p_id is NULL then 'Root'
when p_id is not NULL and id in (select distinct a.p_id from tree a) then 'Inner'
else 'Leaf' end as type
from Tree
