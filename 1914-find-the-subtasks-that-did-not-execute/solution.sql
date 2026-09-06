-- Write your PostgreSQL query statement below
with task as (
select task_id, subtasks_count, generate_series(1,subtasks_count) as subtask_id
from tasks)

/*
select t.task_id, t.subtask_id
from task t left join executed e
on t.task_id = e.task_id and t.subtask_id = e.subtask_id
where e.subtask_id is NULL
*/

select task_id, subtask_id from task 
EXCEPT
select task_id, subtask_id from executed
