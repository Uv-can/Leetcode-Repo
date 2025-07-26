-- Write your PostgreSQL query statement below


select b.book_id, b.name from 
(select * from books where available_from <= '2019-06-23'::Date - interval '1 month') b left join
orders o on b.book_id = o.book_id and o.dispatch_date between '2019-06-23'::date - interval '1 year' and '2019-06-23' 
group by b.book_id, b.name
having sum(o.quantity) is null or  sum(o.quantity) < 10

