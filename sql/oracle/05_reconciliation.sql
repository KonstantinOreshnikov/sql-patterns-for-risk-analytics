-- Compare a calculated monthly result with an independent synthetic control total.

select coalesce(a.snapshot_month, c.snapshot_month) as snapshot_month,
       nvl(a.calculated_balance, 0) as calculated_balance,
       nvl(c.control_balance, 0) as control_balance,
       nvl(a.calculated_balance, 0) - nvl(c.control_balance, 0) as difference
  from (
        select trunc(snapshot_date, 'MM') as snapshot_month,
               sum(balance_amount) as calculated_balance
          from (
                select p.*,
                       row_number() over (
                           partition by account_id, trunc(snapshot_date, 'MM')
                           order by snapshot_date desc
                       ) as rn
                  from demo_portfolio_snapshots p
               )
         where rn = 1
         group by trunc(snapshot_date, 'MM')
       ) a
  full join (
        select date '2026-01-01' as snapshot_month, 2350 as control_balance from dual
        union all
        select date '2026-02-01', 2200 from dual
       ) c
    on c.snapshot_month = a.snapshot_month
 order by snapshot_month;

