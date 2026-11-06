# RFM Customer Segmentation

## Scope and method

RFM analysis uses historical order records through **2026-11-06**, with **2026-11-07** as the reference date. The 828 rows dated after the cutoff are excluded.

- Historical records: 9,366
- Historical distinct orders: 4,672
- Customers: 804
- Recency: days since the customer's last historical order
- Frequency: distinct historical Order IDs per Customer ID
- Monetary: sum of historical Sales
- Total Profit: retained as a supporting profitability measure

R, F, and M scores use quintile ranking. Customer segments are assigned using project-defined rules; they are not universal industry-standard labels.

## Segment results

| Customer segment | Customers | Sales | Profit | Profit margin | Profit contribution |
|---|---:|---:|---:|---:|---:|
| At Risk | 133 | $417,518.54 | $69,956.88 | 16.76% | 25.62% |
| Loyal Customers | 140 | $436,911.44 | $68,037.14 | 15.57% | 24.92% |
| Champions | 119 | $553,125.20 | $60,782.39 | 10.99% | 22.26% |
| Lost Customers | 189 | $274,779.32 | $34,259.53 | 12.47% | 12.55% |
| Potential Loyalists | 137 | $296,273.09 | $21,519.08 | 7.26% | 7.88% |
| New Customers | 86 | $175,361.88 | $18,458.26 | 10.53% | 6.76% |

## Validation

| Check | RFM result | Historical result | Status |
|---|---:|---:|---|
| Customer records | 804 | 804 unique Customer IDs | Match |
| Missing values | 0 | — | Pass |
| Sales | $2,153,969.48 | $2,153,969.48 | Match |
| Profit | $273,013.27 | $273,013.27 | Match |

All 804 RFM rows map to unique Customer IDs. No missing values were found in the RFM output. Sales and profit reconcile exactly to the historical source subset.

## Interpretation

- At Risk customers account for the largest profit contribution (25.62%).
- Loyal Customers contribute 24.92% of profit.
- Champions produce the highest sales ($553,125.20), but contribute 22.26% of profit.
- Potential Loyalists have the lowest segment profit margin (7.26%).

Profit contribution is a share of total profit; profit margin is profit divided by sales. They are different measures. These descriptive results do not establish that a segment label causes a customer's purchasing or profitability behavior.

## Limitations

- Customer ID is used as the RFM key. A customer mapping anomaly involving Harry Olson and multiple Customer IDs was observed and documented; no IDs were merged.
- The 2026-11-06 cutoff means November 2026 is partial.
- The RFM scores are relative quintile scores and depend on this dataset's distribution.
