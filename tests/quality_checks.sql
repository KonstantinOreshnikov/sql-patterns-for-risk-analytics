-- Compact Oracle validation pack for the synthetic application table.

select count(*) as row_count,
       count(distinct application_id) as distinct_application_count,
       min(application_date) as min_application_date,
       max(application_date) as max_application_date
  from demo_applications;

select application_id, count(*) as row_count
  from demo_applications
 group by application_id
having count(*) > 1;

select stage_name, count(*) as row_count
  from demo_applications
 group by stage_name
 order by row_count desc, stage_name;

select sum(case when customer_id is null then 1 else 0 end) as missing_customer_id,
       sum(case when application_date is null then 1 else 0 end) as missing_application_date,
       sum(case when stage_name is null then 1 else 0 end) as missing_stage_name
  from demo_applications;

select count(*) as invalid_numeric_values
  from demo_applications
 where requested_amount_txt is not null
   and validate_conversion(requested_amount_txt as number) = 0;

