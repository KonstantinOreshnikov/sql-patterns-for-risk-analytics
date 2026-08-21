-- Convert text to a number only when Oracle confirms the value is valid.

select application_id,
       requested_amount_txt,
       case
           when validate_conversion(requested_amount_txt as number) = 1
           then to_number(requested_amount_txt)
       end as requested_amount
  from demo_applications
 order by application_id;

-- Control invalid values separately instead of silently converting them to zero.
select requested_amount_txt,
       count(*) as row_count
  from demo_applications
 where requested_amount_txt is not null
   and validate_conversion(requested_amount_txt as number) = 0
 group by requested_amount_txt
 order by row_count desc;

