-- Synthetic training objects. Run only in a disposable schema.

create table demo_applications (
    application_id number primary key,
    customer_id number not null,
    application_date date not null,
    completion_date date,
    stage_name varchar2(30) not null,
    requested_amount_txt varchar2(30),
    segment_code varchar2(20)
);

insert into demo_applications values (1001, 501, date '2026-01-03', date '2026-01-05', 'COMPLETED', '1250.50', 'ALPHA');
insert into demo_applications values (1002, 502, date '2026-01-04', null, 'REVIEW', '900', 'BETA');
insert into demo_applications values (1003, 503, date '2026-01-09', null, 'REJECTED', 'not_available', 'ALPHA');
insert into demo_applications values (1004, 501, date '2026-02-02', date '2026-02-06', 'COMPLETED', '1750', 'BETA');

create table demo_portfolio_snapshots (
    account_id number not null,
    snapshot_date date not null,
    balance_amount number(18,2) not null,
    risk_status varchar2(20) not null,
    constraint pk_demo_portfolio primary key (account_id, snapshot_date)
);

insert into demo_portfolio_snapshots values (7001, date '2026-01-15', 1000, 'CURRENT');
insert into demo_portfolio_snapshots values (7001, date '2026-01-31', 950, 'CURRENT');
insert into demo_portfolio_snapshots values (7002, date '2026-01-31', 1400, 'WATCH');
insert into demo_portfolio_snapshots values (7001, date '2026-02-28', 875, 'CURRENT');
insert into demo_portfolio_snapshots values (7002, date '2026-02-28', 1325, 'WATCH');

commit;

