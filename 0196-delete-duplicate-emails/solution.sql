-- Write your PostgreSQL query statement below

delete from Person
where (id, email) in
(
    select p.id, p.email from
    (select id, email,
    dense_rank() over(partition by email order by id) as rnk
    from Person) p
    where p.rnk > 1
)
