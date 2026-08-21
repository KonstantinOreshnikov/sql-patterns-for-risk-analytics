-- Generic process-stage aggregation on synthetic or public data.
-- Expected table: application_events(application_id, event_time, stage_name, amount).

select toStartOfISOWeek(event_time) as week_start,
       concat(toString(toISOYear(event_time)), '-W', leftPad(toString(toISOWeek(event_time)), 2, '0')) as iso_week,
       uniqExact(application_id) as entered_cases,
       uniqExactIf(application_id, stage_name = 'REVIEW') as reviewed_cases,
       uniqExactIf(application_id, stage_name = 'COMPLETED') as completed_cases,
       round(100 * completed_cases / nullIf(entered_cases, 0), 2) as completion_rate_pct
  from application_events
 where event_time >= toDateTime('${dt_from}')
   and event_time <  toDateTime('${dt_to}') + interval 1 day
 group by week_start, iso_week
 order by week_start;

