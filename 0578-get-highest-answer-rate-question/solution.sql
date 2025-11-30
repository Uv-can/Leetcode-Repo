
/*select question_id
from
(select question_id,
SUM(case when answer_id is NULL then 1.0 end) /
NULLIF(SUM(case when answer_id is not null then 1.0 end), 0) as rate,
dense_rank() over(order by (SUM(case when answer_id is NULL then 1.0 else 0.0 end)) /
(SUM(case when answer_id is not null then 1.0 else 0.0 end)) desc) as rnk
from surveylog
where action in ('show', 'answer')
group by question_id) a
where rnk = 1 */
 SELECT question_id AS survey_log
 FROM surveylog
 GROUP BY question_id
 ORDER BY SUM(CASE WHEN action = 'answer' THEN 1.0 ELSE 0 END)
   / SUM(CASE WHEN action = 'show' THEN 1.0 ELSE 0 END) DESC
   , question_id ASC
 LIMIT 1
