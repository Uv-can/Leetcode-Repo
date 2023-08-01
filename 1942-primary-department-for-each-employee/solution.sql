# Write your MySQL query statement below

SELECT employee_id, department_id
FROM (SELECT *, COUNT(*) OVER(PARTITION BY employee_id) cnt
FROM Employee) t1
WHERE (cnt=1) OR (cnt<>1 AND primary_flag='Y')
