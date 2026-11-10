# Notebooks

The canonical end-to-end analysis notebook is:

- **[E-commerce Profitability & Revenue Intelligence](Ecommerce_Profitability_Revenue_Intelligence.ipynb)** — primary working notebook covering data understanding, cleaning, EDA, customer analysis, RFM segmentation, and Phase 4 SQLite business analysis. It contains the latest uploaded Colab work, with the duplicate Step 9.8 cell removed and a project introduction added.

## Supporting notebooks

- [01_data_understanding.ipynb](01_data_understanding.ipynb) — concise data inspection, validation notes, and initial preparation workflow.
- [01_Data_Understanding_and_EDA.ipynb](01_Data_Understanding_and_EDA.ipynb) — earlier 37-cell EDA/RFM snapshot; retained as a historical reference, not the primary notebook.

## Reproducibility

The primary notebook includes saved execution outputs from the uploaded Colab session. A clean-runtime, top-to-bottom rerun has **not** been independently verified.

To reproduce the work:
1. Open the primary notebook in Google Colab or Jupyter.
2. Upload the modified/extended Superstore-style workbook when prompted.
3. Run all cells from top to bottom in a fresh runtime.
4. Confirm the data cutoff, KPI totals, RFM validation, SQL exports, and output files.
5. Review the dataset provenance and redistribution terms before sharing the workbook.

The source workbook is not stored in this repository. See [dataset/README.md](../dataset/README.md) for its scope and handling notes.
