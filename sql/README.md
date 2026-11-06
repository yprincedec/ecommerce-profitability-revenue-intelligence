# SQL Analysis

Phase 4 business analysis was performed in **SQLite** against the `orders` table.

## Files

- `phase4_business_analysis.sql` — 15 reproducible queries covering overall KPIs, category and sub-category performance, discount bands, regions, yearly/monthly trends, products, customer segments, shipping modes, customer purchase frequency, category-by-discount performance, and state/province analysis.

## Run instructions

1. Load the cleaned dataset into a SQLite database table named `orders`.
2. Keep the source column names as they appear in the dataset (including spaces and hyphens).
3. Open the database in a SQLite client such as DB Browser for SQLite, or run the script with the SQLite command-line client:

   ```bash
   sqlite3 ecommerce_analysis.db < sql/phase4_business_analysis.sql
   ```

4. The queries apply the historical cutoff **2026-11-06** and use SQLite date functions.

## Important notes

- The script assumes the table is named `orders` and includes the fields referenced in the queries.
- Customer-order associations can exceed distinct Order IDs when one order is linked to multiple Customer IDs.
- Shipping date differences are calendar-date differences because the source contains dates, not delivery timestamps.
- Discount-band results show association, not causation.
- Exported Phase 4 result tables are available in [`dataset/phase4_sql_outputs.zip`](../dataset/phase4_sql_outputs.zip).
