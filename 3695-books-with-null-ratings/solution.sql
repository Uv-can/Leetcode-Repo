-- Write your PostgreSQL query statement below
select book_id, title, author, published_year
from books
where rating is NULL
order by 1
