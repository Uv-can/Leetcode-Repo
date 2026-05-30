-- Write your PostgreSQL query statement below


select  l.book_id, l.title, l.author, l.genre, l.publication_year, l.total_copies as current_borrowers
from library_books l join
(select book_id, count(*) as cnt from borrowing_records where return_date is NULL group by book_id) b
on l.book_id=b.book_id and l.total_copies = b.cnt
order by current_borrowers desc, title
