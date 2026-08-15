-- Write your PostgreSQL query statement below

/*select hashtag, count(*) as hashtag_count
from
(select (regexp_matches(tweet, '#[A-Za-z0-9_]+', 'g'))[1] as hashtag
from tweets
where tweet_date >= '2024-02-01' AND tweet_date < '2024-03-01') a
group by hashtag
order by 2 desc, 1 desc
limit 3;*/


select hashtag, hashtag_count
from
(select (regexp_matches(tweet, '#[A-Za-z0-9_]+', 'g'))[1] as hashtag,
count(*)  as hashtag_count,
row_number() over(order by count(*) desc, (regexp_matches(tweet, '#[A-Za-z0-9_]+', 'g'))[1] desc) as rnum
from tweets where tweet_date >= '2024-02-01' AND tweet_date < '2024-03-01'
group by (regexp_matches(tweet, '#[A-Za-z0-9_]+', 'g'))[1]) a
where rnum < 4
