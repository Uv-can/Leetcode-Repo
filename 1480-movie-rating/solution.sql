# Write your MySQL query statement below
(select c.name as results from(
select b.name, count(*) as rating_cnt
from MovieRating a left join
Users b on
a.user_id = b.user_id
group by b.name
order by rating_cnt desc, b.name asc limit 1) c)
UNION all
(select d.title as results from
(select b.title,
round(avg(a.rating) over(partition by a.movie_id ), 2) as avg_rating
from MovieRating a left join
Movies b on
a.movie_id = b.movie_id
where a.created_at like '2020-02-%') d
order by d.avg_rating desc, d.title asc limit 1)

