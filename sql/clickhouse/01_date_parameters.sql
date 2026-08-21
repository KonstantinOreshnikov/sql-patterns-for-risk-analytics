-- DBeaver variables are substituted once at execution time.
-- Expected table: application_events(application_id, event_time, stage_name, amount).

select stage_name,
       uniqExact(application_id) as applications,
       sum(amount) as total_amount
  from application_events
 where event_time >= toDateTime('${dt_from}')
   and event_time <  toDateTime('${dt_to}') + interval 1 day
 group by stage_name
 order by applications desc, stage_name;

