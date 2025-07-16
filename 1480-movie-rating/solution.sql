-- Write your PostgreSQL query statement below
select b.name as results from
(select u.name,
dense_rank() over( order by count(m.movie_id) desc, u.name) as rnk
from MOvierating m join users u
on m.user_id = u.user_id
group by m.user_id, u.name) b
where b.rnk =1
UNION ALL
select a.title as results from
(select u.title,
dense_rank() over( order by AVG(m.rating) desc, u.title) as rnk
from MOvierating m join movies u
on m.movie_id = u.movie_id
where to_char(m.created_at, 'yyyy-MM') = '2020-02'
group by u.title) a
where a.rnk = 1

