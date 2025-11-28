-- Write your PostgreSQL query statement below


select
case when a.cnt1 > b.cnt2 then 'New York University' 
     when a.cnt1 < b.cnt2 then 'California University'
     else 'No Winner' end as winner
from
(select count(*) as cnt1 from newyork where score >= 90) a
cross join
(select count(*) as cnt2 from california where score >=90) b

