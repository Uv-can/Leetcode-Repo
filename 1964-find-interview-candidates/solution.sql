-- Write your PostgreSQL query statement below

with gold_wins as (
    select gold_medal as user_id 
    from contests
    group by gold_medal
    having count(*) >= 3
),
all_medals as(
    select contest_id, gold_medal as user_id from contests
    UNION ALL
    select contest_id, silver_medal as user_id from contests 
    UNION ALL
    select contest_id, bronze_medal as user_id from contests
),
seq as(
    select contest_id, user_id,
    lag(contest_id, 2) over(partition by user_id order by contest_id) as prev2
    from all_medals
),
three_wins as(
    select distinct user_id
    from seq
    where contest_id - prev2 = 2
)
select u.name, u.mail
from users u
join (select user_id from gold_wins
     union
     select user_id from three_wins) w
on u.user_Id = w.user_id;




