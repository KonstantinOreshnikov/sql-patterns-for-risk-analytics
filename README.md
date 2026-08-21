# SQL Patterns for Risk Analytics

Reusable Oracle and ClickHouse patterns for controlled analytical workflows. All schemas, records and values are synthetic and exist only to demonstrate engineering techniques.

## Patterns

| Pattern | Engine | Purpose |
|---|---|---|
| [Synthetic schema](sql/oracle/00_synthetic_schema.sql) | Oracle | Create a small demonstration dataset |
| [Safe numeric conversion](sql/oracle/01_safe_numeric_conversion.sql) | Oracle | Prevent invalid text values from breaking arithmetic |
| [Grain and duplicate checks](sql/oracle/02_grain_and_duplicates.sql) | Oracle | Validate one-row-per-entity assumptions |
| [Month-end snapshots](sql/oracle/03_month_end_snapshots.sql) | Oracle | Select the latest snapshot in each month |
| [Sortable ISO week labels](sql/oracle/04_sortable_iso_week.sql) | Oracle | Produce chronologically sortable text labels |
| [Source reconciliation](sql/oracle/05_reconciliation.sql) | Oracle | Compare two aggregates safely |
| [Date parameters](sql/clickhouse/01_date_parameters.sql) | ClickHouse | Enter a reporting period once in DBeaver |
| [Stage aggregation](sql/clickhouse/02_stage_aggregation.sql) | ClickHouse | Build a generic process funnel |
| [Quality checks](tests/quality_checks.sql) | Oracle | Run a compact validation pack |

## Design principles

- define the grain first;
- cast text fields explicitly before arithmetic;
- keep date inputs in one place;
- reconcile counts and measures before optimization;
- use deterministic tie-breaking;
- prefer outputs that work reliably in downstream tools;
- never hide a business-rule change inside a technical refactor.

## Running the Oracle examples

1. Execute `sql/oracle/00_synthetic_schema.sql` in a disposable training schema.
2. Run the remaining Oracle scripts independently.
3. Remove the demonstration tables when finished if your environment requires cleanup.

The ClickHouse examples assume a generic `application_events` table described in their comments.

## Confidentiality

This repository was written from scratch for public education. It does not contain employer code, production identifiers, real portfolio data, proprietary cut-offs or internal decision logic.

## License

MIT — see [LICENSE](LICENSE).

