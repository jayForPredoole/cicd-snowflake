CREATE OR REPLACE VIEW ${MY_DB}.${MY_SCHEMA}.SALES_REPORT AS
SELECT 
    DATE_TRUNC('month', o.order_date) as sales_month,
    COUNT(o.order_id) as total_orders,
    SUM(o.order_amount) as total_sales,
    SUM(${MY_DB}.${MY_SCHEMA}.CALCULATE_TAX(o.order_amount, 'US')) as total_tax,
    AVG(o.order_amount) as avg_order_value
FROM ${MY_DB}.${MY_SCHEMA}.ORDERS o
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY sales_month DESC;

