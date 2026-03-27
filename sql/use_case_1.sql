Use Case 1: Sales Report Bottleneck
Understanding the Problem

The business is struggling with slow monthly revenue reports. That usually points to inefficient queries, large datasets, or missing indexes.

The requirement is to calculate monthly revenue, broken down by:

Plan type
Customer segment (in this case, inferred from plan type)
Assumptions

Since pricing isn’t provided, I made a simple assumption:

Basic plan = 100
Premium plan = 200

This is just to simulate how revenue would be calculated.

SQL Query
SELECT 
    s.Plan_Type,
    DATE_TRUNC('month', s.Start_Date) AS revenue_month,
    COUNT(DISTINCT s.Customer_ID) AS total_customers,
    SUM(
        CASE 
            WHEN s.Plan_Type = 'Basic' THEN 100
            WHEN s.Plan_Type = 'Premium' THEN 200
            ELSE 0
        END
    ) AS monthly_revenue
FROM Subscriptions s
JOIN Customers c 
    ON s.Customer_ID = c.Customer_ID
GROUP BY s.Plan_Type, DATE_TRUNC('month', s.Start_Date)
ORDER BY revenue_month;
My Approach

I kept the query as simple as possible because complexity is usually where performance issues come in.

I used a CASE statement to simulate revenue per plan
Aggregated data at a monthly level, since thats what the busines needs
Only joined the Customers table where necessary

The focus here was to avoid overcomplicating the logic.

Performance Considerations

This is where most systems fail in real life.

1. Indexing

I would add indexes on:

CREATE INDEX idx_subscriptions_customer ON Subscriptions(Customer_ID);
CREATE INDEX idx_subscriptions_start_date ON Subscriptions(Start_Date);

This helps to 

Speed up joins
Improve grouping/filtering on dates
2. Reduce Data Early

By grouping early in the query, we reduce how much data the database needs to process later.

3. Long-Term Fix

If this report is used often, I wouldn’t run this query every time.

Instead:

Create a materialized view or summary table
Update it daily
Business Impact

Fixing this improves:

Reporting speed
Decision-making for finance
Visibility into revenue trends
