# E-commerce Profitability & Revenue Intelligence

An end-to-end analytics portfolio project focused on sales, profitability, customer behavior, and business reporting.

## Current progress

| Workstream | Status |
|---|---|
| Data understanding | Complete |
| Initial cleaning and validation | Complete |
| Exploratory data analysis | Core analysis complete |
| Customer analysis | Complete through repeat-vs-one-time review |
| RFM segmentation | Complete — six segments created and totals validated |
| SQL business analysis | Complete — 15 analysis outputs exported |
| Profit prediction | Planned |
| Sales forecasting | Planned |
| Power BI dashboard | Built locally — 5 pages completed; PBIX upload pending |

## Dataset overview

The inspected working file contains **10,194 rows × 21 columns**, with order, customer, product, shipping, geography, sales, quantity, discount, and profit fields.

- Unique orders: 5,111
- Customer IDs: 804
- Products: 1,862
- Countries: United States (9,994 rows) and Canada (200 rows)
- Order dates: 2023-01-03 to 2026-12-30
- Missing values: 0
- Exact duplicate rows: 0
- Duplicate Row IDs: 0

The file differs from the commonly circulated 9,994-row, US-only Sample Superstore version. Its exact provenance has not been independently verified, so this project treats it as a modified/extended Superstore-style dataset rather than claiming it is the canonical original.

## Work completed

### Initial cleaning and validation
- Preserved raw and working copies.
- Stripped leading/trailing whitespace from text columns.
- Converted Postal Code to string to support mixed numeric and alphanumeric postal codes.
- Validated missing values, duplicates, Row IDs, date order, and numeric ranges.
- No rows were deleted during initial cleaning.

### Exploratory analysis
- Overall sales, profit, order, customer, and quantity KPIs.
- Category and sub-category performance.
- Discount-band and category-versus-discount analysis.
- Regional performance.
- Historical monthly sales and profit trends.
- Customer-level sales and profitability.
- Repeat versus one-time customer analysis.

### RFM segmentation
RFM uses historical records through **2026-11-06**, with **2026-11-07** as the reference date. The 828 rows dated after the cutoff are excluded.

- Historical rows: 9,366
- Historical unique orders: 4,672
- Customers represented: 804
- Recency: days since last historical order
- Frequency: distinct historical orders per Customer ID
- Monetary: historical Sales total
- Total Profit is retained as a supporting metric.

R, F, and M quintile scores (1–5) were created and mapped into six project-defined segments: Champions, Loyal Customers, New Customers, At Risk, Lost Customers, and Potential Loyalists. These labels follow custom project rules and are not universal industry-standard classifications.

### SQL business analysis
Phase 4 was completed using SQLite on 9,366 historical records through **2026-11-06**. The analysis covers overall performance, category and sub-category profitability, discount bands, regions, yearly and monthly trends, products, customer segments, shipping modes, and state/province performance.

- Historical sales: **$2,153,969.48**
- Historical profit: **$273,013.27**
- Profit margin: **12.67%**
- Unique orders: **4,672**
- Unique customers: **804**
- 15 CSV result tables were exported and bundled in [dataset/phase4_sql_outputs.zip](dataset/phase4_sql_outputs.zip).
- Detailed findings and limitations: [reports/phase4_sql_business_analysis.md](reports/phase4_sql_business_analysis.md).

## RFM validation results

- RFM customers: **804**; unique Customer IDs: **804**.
- Missing values in the RFM output: **0**.
- RFM Monetary total and historical Sales total both equal **$2,153,969.48**.
- RFM Total Profit and historical Profit total both equal **$273,013.27**.
- Segment profit contribution: At Risk **25.62%**, Loyal Customers **24.92%**, Champions **22.26%**, Lost Customers **12.55%**, Potential Loyalists **7.88%**, New Customers **6.76%**.

The validation totals match exactly. The detailed segment table, margins, methodology, and limitations are documented in [reports/rfm_customer_segmentation.md](reports/rfm_customer_segmentation.md).

## Data-quality notes and limitations

- **Future-dated rows:** 828 records have Order Dates after 2026-11-06. They are retained in the dataset but excluded from historical trend and RFM analysis.
- **Partial month:** November 2026 is incomplete at the analysis cutoff.
- **Customer mapping anomaly:** Harry Olson is associated with five Customer IDs. Two orders are each linked to four different Customer IDs and show repeated product and sales/profit patterns. No IDs have been merged and no records deleted; Customer ID remains the RFM identifier pending source verification.
- **Order-count / customer-association discrepancy:** Phase 4 SQL reports 4,678 customer-order associations across 804 Customer IDs versus 4,672 distinct Order IDs (six extra associations). An earlier Phase 3 summary reported 5,117 associations; that result has not yet been reconciled with the Phase 4 calculation. Two orders were observed linked to multiple Customer IDs, and Harry Olson is associated with five Customer IDs. No IDs have been merged and no rows have been deleted.
- **Customer-frequency discrepancy:** Phase 3 previously reported 12 one-time customers, while the Phase 4 SQL grouping found 24. This remains unresolved and should be reconciled before treating the results as consistent.
- **Discount analysis:** Losses in higher discount bands are associations, not proof that discounts caused the losses.
- **Dataset scope:** No ad spend, web traffic, conversion, inventory, or campaign data is available. Those metrics cannot be directly analyzed.

## Power BI dashboard

The interactive Power BI report has been built and reviewed locally. It contains five pages:

1. **Executive Overview** — sales, profit, orders, margin, and regional/category trends.
2. **Product & Profitability** — product rankings, sub-category performance, category margins, and discount impact.
3. **Customer Intelligence** — customer segments, sales contribution, profit contribution, and average order value.
4. **RFM Customer Analysis** — segment distribution and recency, frequency, and monetary analysis.
5. **Business Insights & Trends** — monthly profit trends, regional sales vs. profit, discount impact, and category profit margins.

Year, Category, and Region slicers are included on the Business Insights & Trends page. The report was saved as `Ecommerce_Profitability_Revenue_Intelligence.pbix` locally. **The PBIX binary has not yet been uploaded to this repository**; add it under `powerbi/` when available.

## Repository structure

```text
dataset/       Dataset source notes and exported SQL result archive
notebooks/     Python/Colab notebooks
sql/           SQLite Phase 4 analysis scripts and run instructions
powerbi/       Power BI project files (to be added)
reports/       Findings and documentation
visuals/       Exported charts and dashboard images
```

## Technology stack

Python, pandas, NumPy, Matplotlib, Seaborn, scikit-learn, SQLite, Power BI, Google Colab, and GitHub.

## Reproducibility

Install dependencies with `pip install -r requirements.txt`. The uploaded notebooks document the current analysis workflow. Phase 4 SQL queries are available in [sql/phase4_business_analysis.sql](sql/phase4_business_analysis.sql); load the cleaned data into a SQLite table named `orders` and follow [sql/README.md](sql/README.md). Confirm data paths and rerun cells in a fresh runtime before reproducing results.

## License and attribution

The dataset is separate from this repository's code and documentation. Confirm the actual source and applicable terms before redistribution. Raw data is not committed to this repository.
