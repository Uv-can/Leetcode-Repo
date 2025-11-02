-- Write your PostgreSQL query statement below
DELETE FROM person
where (id, email) in ( select p1.id, p1.email from person p1,
    person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id)
