-- Write your PostgreSQL query statement below

select N, 'Root' as Type from Tree where P is NULL
UNION ALL
select N, 'Leaf' as Type from Tree where P is not NULL and N not in 
(
    select distinct P from Tree where P is not NULL
    )
UNION ALL
select N, 'Inner' as Type from Tree where P is not NULL and N in (select distinct P from Tree where P is not NULL)
order by N
