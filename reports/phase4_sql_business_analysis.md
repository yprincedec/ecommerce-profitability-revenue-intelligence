# Phase 4 — SQL Business Analysis

**Project:** E-commerce Profitability & Revenue Intelligence  
**Analysis scope:** Historical records through 2026-11-06  
**Database:** SQLite table `orders`  
**Historical records:** 9,366  
**Unique orders:** 4,672  
**Unique customers:** 804  
**Total sales:** $2,153,969.48  
**Total profit:** $273,013.27

## Analysis completed

1. SQLite database setup and schema inspection
2. Overall business performance
3. Category-wise performance
4. Sub-category profitability
5. Discount impact
6. Regional performance
7. Year-wise performance
8. Top profitable products
9. Top loss-making products
10. Customer segment analysis
11. Shipping mode analysis
12. Monthly sales and profit trend
13. Repeat vs one-time customer analysis
14. Category-wise discount impact
15. State/province-level performance

## Key findings

### Overall performance
- Sales: **$2,153,969.48**
- Profit: **$273,013.27**
- Profit margin: **12.67%**
- Orders: **4,672**
- Customers: **804**

### Category and product profitability
- Technology generated the highest category sales and profit.
- Office Supplies had the highest category profit margin.
- Furniture had a comparatively low overall profit margin.
- Tables and Bookcases were loss-making sub-categories; Copiers generated the highest sub-category profit.
- Several Machines products appeared among the largest loss-making products, despite Technology being profitable overall.

### Discount impact
- No Discount: **$299,981.69** profit; **29.59%** margin.
- Low Discount: **$95,427.36** profit; **11.90%** margin.
- Medium Discount: **-$33,409.60** profit; **-15.29%** margin.
- High Discount: **-$88,986.17** profit; **-74.05%** margin.

High-discount groups were loss-making across all three categories in the category-by-discount analysis. These are observed associations, not proof that discounts alone caused the losses.

### Regional and yearly performance
- West led regional sales and profit, with **$691,417.33** sales and **$104,560.20** profit.
- Central had the lowest regional margin at **9.10%**.
- 2025 was the highest-sales year in the historical annual summary, at **$613,933.58**.
- 2026 figures are partial through November 6, 2026 and should not be compared with full-year totals without qualification.

### Shipping mode
| Ship Mode | Orders | Sales | Profit | Average date difference |
|---|---:|---:|---:|---:|
| Standard Class | 2,809 | $1,271,055.48 | $154,914.00 | 5.00 days |
| Second Class | 895 | $434,389.47 | $53,572.63 | 3.23 days |
| First Class | 729 | $327,434.12 | $48,671.36 | 2.18 days |
| Same Day | 239 | $121,090.41 | $15,855.29 | 0.04 days |

The shipping duration is calculated from date-only fields, so it is a calendar-date difference rather than an actual elapsed delivery time.

### Monthly trend
- Highest monthly sales in the displayed period: December 2025 — **$97,502.28**.
- Highest monthly profit: October 2025 — **$16,256.84**.
- November 2026 through November 6: **-$935.61** profit; partial month.

### Customer purchase frequency
SQL grouping by Customer ID found:
- One-time customers: **24**
- Repeat customers: **780**
- Total: **804**

The earlier Phase 3 analysis reported 12 one-time customers. This discrepancy remains unresolved and should be reconciled against the original Phase 3 calculation before treating the two phases as fully consistent. Customer-level order associations total 4,678, six more than the 4,672 distinct orders; some orders may be associated with multiple customer IDs.

### State/province profitability
- Total states/provinces: **59**
- Profitable: **47**
- Loss-making: **12**
- Break-even: **0**
- California led total state/province profit at **$71,192.28**.
- Texas had the largest loss at **-$21,301.15**.
- Among higher-volume loss-making states, Ohio had a **-22.32%** margin.

## Exported SQL outputs

15 CSV result tables were exported in the Colab runtime to the `sql_outputs/` folder. These local exports have not yet been uploaded to GitHub.

## Data interpretation notes

- The analysis uses historical rows through 2026-11-06; 828 future-dated rows were excluded.
- State-level results include both U.S. states and Canadian provinces, as represented in the source field.
- Order counts grouped by category, shipping mode, or customer can overlap and should not be summed as if each group were mutually exclusive.
- Profit margin is calculated as total profit divided by total sales, multiplied by 100.
