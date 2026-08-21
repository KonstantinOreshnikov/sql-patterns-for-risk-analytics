-- Prefix display text with ISO year and week so text-only consumers sort correctly.

select application_id,
       application_date,
       to_char(application_date, 'IYYY') || '-W' ||
       to_char(application_date, 'IW') || ' | ' ||
       to_char(trunc(application_date, 'IW'), 'DD Mon') || '–' ||
       to_char(trunc(application_date, 'IW') + 6, 'DD Mon') as sortable_week_name,
       trunc(application_date, 'IW') as week_start
  from demo_applications
 order by week_start, application_id;

