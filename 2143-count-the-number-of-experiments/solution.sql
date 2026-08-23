-- Write your PostgreSQL query statement below

with plat_exp as
(  
    select distinct platform, experiment_name from
    (select 'IOS' as platform UNION   select 'Android' as platform UNION   select 'Web' as platform) cross join
    (select 'Programming' as experiment_name UNION   select 'Sports' as experiment_name UNION   select 'Reading' as experiment_name)
)


select p.platform, p.experiment_name, case when count(e.experiment_id) is null then 0 else count(e.experiment_id) end as num_experiments
from plat_exp p left join experiments e
on p.platform = e.platform and p.experiment_name = e.experiment_name
group by p.platform, p.experiment_name

