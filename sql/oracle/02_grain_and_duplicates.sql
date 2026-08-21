-- Validate the declared grain: one row per application_id.

select count(*) as row_count,
       count(distinct application_id) as distinct_application_count,
       count(*) - count(distinct application_id) as duplicate_row_count
  from demo_applications;

-- Return the duplicate keys for investigation.
select application_id,
       count(*) as row_count
  from demo_applications
 group by application_id
having count(*) > 1
 order by row_count desc, application_id;

-- Example daily-customer grain check.
select customer_id,
       trunc(application_date) as application_day,
       count(*) as row_count
  from demo_applications
 group by customer_id, trunc(application_date)
having count(*) > 1
 order by application_day, customer_id;

