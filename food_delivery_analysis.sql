-- Food Delivery Analytics | SQLite
-- Dataset note: these CSV files contain SYNTHETIC sample data created for portfolio practice.
-- Import customers.csv as customers, restaurants.csv as restaurants, and orders.csv as orders.
-- If your editor cannot import CSVs, use the CSV files with a local SQLite app or ask for help.

-- 1. Check order records
SELECT * FROM orders LIMIT 10;

-- 2. Overall order and revenue summary (revenue here includes all statuses; compare delivered revenue below)
SELECT COUNT(*) AS total_orders,
       ROUND(SUM(order_amount), 2) AS total_order_value,
       ROUND(AVG(order_amount), 2) AS average_order_value
FROM orders;

-- 3. Delivered orders and delivered revenue
SELECT COUNT(*) AS delivered_orders,
       ROUND(SUM(order_amount), 2) AS delivered_revenue
FROM orders
WHERE order_status = 'Delivered';

-- 4. Restaurant performance
SELECT r.restaurant_name,
       COUNT(o.order_id) AS total_orders,
       ROUND(SUM(CASE WHEN o.order_status = 'Delivered' THEN o.order_amount ELSE 0 END), 2) AS delivered_revenue
FROM restaurants r
LEFT JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY delivered_revenue DESC;

-- 5. Monthly order and delivered revenue trend
SELECT substr(order_date, 1, 7) AS order_month,
       COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN order_status = 'Delivered' THEN order_amount ELSE 0 END), 2) AS delivered_revenue
FROM orders
GROUP BY substr(order_date, 1, 7)
ORDER BY order_month;

-- 6. Customer order activity
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders,
       ROUND(SUM(CASE WHEN o.order_status = 'Delivered' THEN o.order_amount ELSE 0 END), 2) AS delivered_spend
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY delivered_spend DESC
LIMIT 10;

-- 7. Order status distribution
SELECT order_status, COUNT(*) AS order_count,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM orders), 1) AS percentage
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 8. Average delivery time by restaurant (delivered orders only)
SELECT r.restaurant_name,
       ROUND(AVG(o.delivery_time_minutes), 1) AS avg_delivery_minutes
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY avg_delivery_minutes;

-- 9. Ratings by restaurant
SELECT r.restaurant_name,
       COUNT(o.rating) AS ratings_count,
       ROUND(AVG(o.rating), 2) AS average_rating
FROM restaurants r
LEFT JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY average_rating DESC;

-- 10. Cancellation rate
SELECT ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate_pct
FROM orders;
