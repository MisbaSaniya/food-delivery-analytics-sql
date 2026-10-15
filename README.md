# Food Delivery Analytics (SQL)

## Project overview
This beginner-friendly portfolio project uses SQL to explore food delivery order patterns, restaurant performance, customer activity, order statuses, delivery times, and ratings.

> **Dataset disclosure:** The included CSVs are synthetic sample data generated for practice. They are not real customer or business records. Do not present the results as real-world business findings.

## Tools
- SQL (SQLite)
- CSV files
- GitHub

## Dataset files
- `orders.csv` — 150 sample orders, including date, amount, status, delivery time, and rating
- `restaurants.csv` — 6 sample restaurants and cuisines
- `customers.csv` — 30 sample customers with fictional names and example.com emails

## How to run
1. Open an online SQL editor that supports SQLite and CSV import.
2. Import `restaurants.csv` as `restaurants`, `customers.csv` as `customers`, and `orders.csv` as `orders`.
3. Open `food_delivery_analysis.sql`.
4. Run each query after importing all three tables.
5. Save screenshots of selected query results in a `screenshots` folder if desired.

## Questions explored
1. What are the overall order count and average order value?
2. How many orders were delivered, and what was delivered revenue?
3. Which restaurants have the highest delivered revenue?
4. How do orders and delivered revenue vary by month?
5. Which customers have the highest delivered spend?
6. What share of orders are delivered, cancelled, or preparing?
7. Which restaurants have shorter average delivery times?
8. How do restaurant ratings compare?
9. What is the cancellation rate?

## SQL concepts demonstrated
`SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, aggregate functions, `CASE WHEN`, subqueries, `LEFT JOIN`, `JOIN`, and date string functions.

## Findings
Run the SQL queries against the included data and write 2–3 findings from the results here. Because the dataset is synthetic, label findings as observations from sample data.

## Limitations
This is a small synthetic dataset designed for SQL practice. It does not represent a real food-delivery platform and should not be used to make real business decisions.
