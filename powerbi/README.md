# Power BI Dashboard

The interactive Power BI report has been built and reviewed locally. The PBIX file is committed in the repository root:

[Download Ecommerce Profitability Dashboard.pbix](../Ecommerce%20Profitability%20Dashboard.pbix)

## Report pages

1. **Executive Overview**
   - KPI cards: Total Sales, Total Profit, Total Orders, and Profit Margin %
   - Monthly Sales Trend
   - Category-wise Sales & Profit
   - Profit by Region
   - Year, Category, and Region slicers

2. **Product & Profitability**
   - Top 5 Profitable Products
   - Profit by Sub-Category
   - Sales vs. Profit by Category
   - Profit Margin by Category
   - Bottom 5 Products by Profit
   - Profit by Discount Level

3. **Customer Intelligence**
   - KPI cards: Total Customers, Total Orders, Average Order Value, and Average Quantity per Order
   - Customer distribution by segment
   - Sales and profit contribution by customer segment
   - Average Order Value by customer segment

4. **RFM Customer Analysis**
   - KPI cards: 804 Total RFM Customers, 184 Champions, 125 At Risk, and 197 Lost Customers
   - RFM customer segment distribution
   - Average Monetary Value, Recency, and Order Frequency by segment

5. **Business Insights & Trends**
   - Monthly Profit Trend
   - Sales vs. Profit by Region
   - Discount Impact on Profit
   - Category-wise Profit Margin
   - Year, Region, and Category slicers (tested)

## Data scope and interpretation

The report uses the historical cutoff through 2026-11-06 for its historical analysis, excluding 828 future-dated records from the historical view. The historical KPI totals documented in the project analysis are Sales **$2,153,969.48**, Profit **$273,013.27**, **4,672** unique orders, **804** customers, and **12.67%** profit margin. These figures describe the historical analysis dataset and should not be assumed to be identical to every visual under every slicer selection.

Discount-band relationships are descriptive and do not establish that discounts caused losses. Customer segment labels follow the project's custom RFM rules.

## Screenshots

See the five dashboard screenshots embedded in the [main project README](../README.md#dashboard-screenshots).

## Notes

- Open the PBIX file in Power BI Desktop.
- The report was reviewed locally; this documentation does not claim that every measure or visual has been independently audited from the PBIX internals.
- The PBIX is stored in the repository root, not in this folder.
