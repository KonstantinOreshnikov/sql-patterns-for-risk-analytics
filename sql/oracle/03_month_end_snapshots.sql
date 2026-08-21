-- Select the latest available snapshot for every account and calendar month.

select account_id,
       snapshot_date,
       balance_amount,
       risk_status
  from (
        select p.*,
               row_number() over (
                   partition by account_id, trunc(snapshot_date, 'MM')
                   order by snapshot_date desc
               ) as rn
          from demo_portfolio_snapshots p
       )
 where rn = 1
 order by snapshot_date, account_id;

-- Aggregate after selecting the monthly account-level snapshot.
select snapshot_month,
       sum(balance_amount) as portfolio_balance
  from (
        select trunc(snapshot_date, 'MM') as snapshot_month,
               balance_amount,
               row_number() over (
                   partition by account_id, trunc(snapshot_date, 'MM')
                   order by snapshot_date desc
               ) as rn
          from demo_portfolio_snapshots
       )
 where rn = 1
 group by snapshot_month
 order by snapshot_month;

