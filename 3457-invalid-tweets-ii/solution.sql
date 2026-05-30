-- Write your PostgreSQL query statement below

select tweet_id from
(select tweet_id, length(content) tweet_len, REGEXP_COUNT(content, '@') mentions, 
REGEXP_COUNT(content, '#') tags
from tweets) where tweet_len > 140 or mentions > 3 or tags > 3
order by 1

