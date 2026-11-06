# E-commerce Profitability & Revenue Intelligence

An end-to-end analytics portfolio project using the Tableau Sample Superstore dataset. The project investigates sales performance, profitability, customer purchasing patterns, and business performance using Python, SQL, machine learning, and Power BI.

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

## Dataset

**Tableau Sample Superstore**  
Source: https://public.tableau.com/app/sample-data/sample_-_superstore.xls

The dataset contains fictional retail order-level information, including sales, profit, discounts, products, customers, dates, shipping, and geography.

It does not contain website sessions, clicks, advertising spend, marketing campaign costs, or inventory records. Therefore, this project will not claim to measure web conversion rates, advertising ROI, or inventory performance.

See [dataset/README.md](dataset/README.md) for download and handling instructions.

## Planned workflow

1. Data understanding and quality assessment
2. Data cleaning and preparation
3. Exploratory data analysis
4. SQL business analysis
5. RFM customer segmentation
6. Profit prediction and model evaluation
7. Sales trend analysis and forecasting experiments
8. Power BI dashboard development
9. Documentation and business recommendations

## Repository structure

```text
dataset/       Dataset instructions; raw data is not committed
notebooks/     Python analysis notebooks
sql/           SQL scripts and business queries
powerbi/       Power BI dashboard files and notes
reports/       Findings and project documentation
visuals/       Exported charts and dashboard screenshots
```

## Project status

**Current stage:** Repository setup and dataset understanding.

No analytical findings or model metrics are claimed until the analysis has been run and validated.

## Reproducibility

Install dependencies with:

```bash
pip install -r requirements.txt
```

The analysis notebooks will document the data preparation, assumptions, evaluation methods, and limitations.

## License and attribution

The dataset is provided by Tableau Public for sample-data use. Refer to the source and its applicable terms before redistribution. This repository's code and documentation are separate from the dataset.
