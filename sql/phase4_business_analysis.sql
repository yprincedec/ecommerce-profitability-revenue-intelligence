-- Phase 4: E-commerce Profitability & Revenue Intelligence
-- Database: SQLite
-- Source table: orders
-- Scope: historical records through 2026-11-06 (inclusive)
-- The source table contains 9,366 historical rows plus future-dated rows.
-- These queries filter the historical cutoff explicitly for reproducibility.

-- 01. Overall business performance
SELECT
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT "Order ID") AS unique_orders,
    COUNT(DISTINCT "Customer ID") AS unique_customers,
    SUM("Quantity") AS total_quantity
FROM orders
WHERE date("Order Date") <= date('2026-11-06');

-- 02. Category-wise performance
SELECT
    "Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT "Order ID") AS unique_orders
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Category"
ORDER BY total_profit DESC;

-- 03. Sub-category profitability
SELECT
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Category", "Sub-Category"
ORDER BY total_profit ASC;

-- 04. Discount-band analysis
SELECT
    CASE
        WHEN "Discount" = 0 THEN 'No Discount'
        WHEN "Discount" <= 0.20 THEN 'Low Discount'
        WHEN "Discount" <= 0.50 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_band,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct,
    COUNT(*) AS line_items
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY discount_band
ORDER BY
    CASE discount_band
        WHEN 'No Discount' THEN 1
        WHEN 'Low Discount' THEN 2
        WHEN 'Medium Discount' THEN 3
        ELSE 4
    END;

-- 05. Regional performance
SELECT
    "Region",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT "Order ID") AS unique_orders
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Region"
ORDER BY total_profit DESC;

-- 06. Year-wise performance
SELECT
    strftime('%Y', "Order Date") AS order_year,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT "Order ID") AS unique_orders
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY strftime('%Y', "Order Date")
ORDER BY order_year;

-- 07. Top 10 profitable products
SELECT
    "Product ID",
    "Product Name",
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Product ID", "Product Name", "Category", "Sub-Category"
ORDER BY total_profit DESC
LIMIT 10;

-- 08. Top 10 loss-making products
SELECT
    "Product ID",
    "Product Name",
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Product ID", "Product Name", "Category", "Sub-Category"
HAVING SUM("Profit") < 0
ORDER BY total_profit ASC
LIMIT 10;

-- 09. Customer segment performance
SELECT
    "Segment",
    COUNT(DISTINCT "Customer ID") AS total_customers,
    COUNT(DISTINCT "Order ID") AS unique_orders,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Segment"
ORDER BY total_profit DESC;

-- 10. Shipping mode performance
-- julianday difference is based on date-only values, not exact delivery timestamps.
SELECT
    "Ship Mode",
    COUNT(DISTINCT "Order ID") AS unique_orders,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(AVG(julianday("Ship Date") - julianday("Order Date")), 2) AS avg_date_difference_days
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Ship Mode"
ORDER BY unique_orders DESC;

-- 11. Monthly sales and profit trend
SELECT
    strftime('%Y-%m', "Order Date") AS year_month,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    COUNT(DISTINCT "Order ID") AS unique_orders
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY strftime('%Y-%m', "Order Date")
ORDER BY year_month;

-- 12. One-time vs repeat customer frequency
-- Counts distinct orders per Customer ID. The sum of customer-order associations
-- may be greater than distinct orders when an Order ID maps to multiple Customer IDs.
WITH customer_orders AS (
    SELECT
        "Customer ID",
        COUNT(DISTINCT "Order ID") AS order_count,
        SUM("Sales") AS customer_sales,
        SUM("Profit") AS customer_profit
    FROM orders
    WHERE date("Order Date") <= date('2026-11-06')
    GROUP BY "Customer ID"
)
SELECT
    CASE WHEN order_count = 1 THEN 'One-Time Customer'
         ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS total_customers,
    SUM(order_count) AS customer_order_associations,
    ROUND(SUM(customer_sales), 2) AS total_sales,
    ROUND(SUM(customer_profit), 2) AS total_profit,
    ROUND(100.0 * SUM(customer_profit) / NULLIF(SUM(customer_sales), 0), 2) AS profit_margin_pct
FROM customer_orders
GROUP BY customer_type
ORDER BY total_customers DESC;

-- 13. Category x discount-band profitability
SELECT
    "Category",
    CASE
        WHEN "Discount" = 0 THEN 'No Discount'
        WHEN "Discount" <= 0.20 THEN 'Low Discount'
        WHEN "Discount" <= 0.50 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_band,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Category", discount_band
ORDER BY "Category",
    CASE discount_band
        WHEN 'No Discount' THEN 1
        WHEN 'Low Discount' THEN 2
        WHEN 'Medium Discount' THEN 3
        ELSE 4
    END;

-- 14. State/province-level performance
SELECT
    "Country/Region",
    "State/Province",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(100.0 * SUM("Profit") / NULLIF(SUM("Sales"), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT "Order ID") AS unique_orders
FROM orders
WHERE date("Order Date") <= date('2026-11-06')
GROUP BY "Country/Region", "State/Province"
ORDER BY total_profit DESC;

-- 15. State/province profitability summary
WITH state_performance AS (
    SELECT
        "Country/Region",
        "State/Province",
        SUM("Sales") AS total_sales,
        SUM("Profit") AS total_profit
    FROM orders
    WHERE date("Order Date") <= date('2026-11-06')
    GROUP BY "Country/Region", "State/Province"
)
SELECT
    COUNT(*) AS total_states_provinces,
    SUM(CASE WHEN total_profit > 0 THEN 1 ELSE 0 END) AS profitable_states_provinces,
    SUM(CASE WHEN total_profit < 0 THEN 1 ELSE 0 END) AS loss_making_states_provinces,
    SUM(CASE WHEN total_profit = 0 THEN 1 ELSE 0 END) AS break_even_states_provinces
FROM state_performance;
