# E-commerce Profitability & Revenue Intelligence

An end-to-end analytics portfolio project focused on sales, profitability, customer behavior, and business reporting.

## Project objectives

- Understand and validate retail transaction data.
- Identify sales and profit trends across products, categories, regions, and time.
- Investigate discounting and loss-making product segments.
- Segment customers using RFM (Recency, Frequency, Monetary) analysis.
- Build and evaluate carefully validated predictive models.
- Develop an interactive Power BI dashboard with actionable findings.

## Technology stack

- Python: pandas, NumPy, Matplotlib, Seaborn, scikit-learn
- SQL: PostgreSQL
- BI: Microsoft Power BI, Power Query, DAX
- Development: Google Colab, Jupyter Notebook, GitHub

## Dataset and provenance note

The working file used in the initial Colab inspection was `sample_-_superstore (1).xls`.

Observed contents:
- **10,194 rows × 21 columns**
- **2023-01-03 to 2026-12-30**
- United States: 9,994 rows
- Canada: 200 rows

This differs from the commonly circulated 9,994-row, US-only Sample Superstore version. The exact provenance/version of the uploaded file has **not** been independently verified. Until confirmed, this project treats it as a modified/extended variant and does not describe it as the canonical original dataset.

The dataset contains fictional retail transaction information such as sales, profit, discounts, products, customers, dates, shipping, and geography. It does not contain website sessions, clicks, advertising spend, marketing campaign costs, or inventory records. Therefore, this project will not claim to measure web conversion rates, advertising ROI, or inventory performance.

See [dataset/README.md](dataset/README.md) for handling notes. Raw data is not committed to this repository.

## Initial data-quality findings

- Missing values: **0**
- Exact duplicate rows: **0**
- Duplicate Row IDs: **0**
- Ship dates earlier than order dates: **0**
- Non-positive sales: **0**
- Non-positive quantities: **0**
- Discounts outside the 0–1 range: **0**
- Postal Code standardized to text to preserve alphanumeric Canadian postal codes and leading zeros.
- Leading/trailing whitespace removed from text columns.
- **828 rows (8.12%)** have order dates later than 2026-11-06. These rows are preserved pending source verification and must be handled explicitly in time-based analysis; they must not silently enter historical training/evaluation windows.

These findings describe the inspected working file and should be reproduced from the notebook before further analysis.

## Planned workflow

1. Data understanding and validation
2. Data cleaning and quality checks
3. Exploratory data analysis
4. SQL business analysis
5. RFM customer segmentation
6. Profitability analysis and carefully validated prediction
7. Sales trend/forecasting with time-based validation
8. Power BI dashboard and documentation

## Repository structure

```text
dataset/       Dataset source notes (raw data excluded)
notebooks/     Jupyter/Colab notebooks
sql/           SQL analysis
powerbi/       Power BI project files
reports/       Findings and documentation
visuals/       Exported charts and dashboard images
```

## Reproducibility

Install dependencies with:

```bash
pip install -r requirements.txt
```

The notebooks will document data preparation, assumptions, evaluation methods, and limitations.

## License and attribution

The dataset is separate from this repository's code and documentation. Refer to the actual source and applicable terms before redistribution.
