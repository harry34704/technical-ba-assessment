Use Case 2: Churn Prediction
  
Problem

Identify customers likely to cancel based on:

Declining usage
Short subscription duration
SQL Query
WITH usage_trend AS (
    SELECT 
        u.Customer_ID,
        AVG(u.Data_Used_Mb) AS avg_data,
        AVG(u.Call_Minutes) AS avg_calls,
        LAG(AVG(u.Data_Used_Mb)) OVER (PARTITION BY u.Customer_ID ORDER BY DATE_TRUNC('month', u.Date)) AS prev_data
    FROM Usage u
    GROUP BY u.Customer_ID, DATE_TRUNC('month', u.Date)
),
subscription_length AS (
    SELECT 
        Customer_ID,
        DATEDIFF(day, Start_Date, COALESCE(End_Date, CURRENT_DATE)) AS duration_days
    FROM Subscriptions
)
SELECT 
    ut.Customer_ID,
    ut.avg_data,
    ut.prev_data,
    sl.duration_days,
    CASE 
        WHEN ut.avg_data < ut.prev_data * 0.7 THEN 'Declining Usage'
        WHEN sl.duration_days < 30 THEN 'Short Subscription'
        ELSE 'Stable'
    END AS Risk_Flag
FROM usage_trend ut
JOIN subscription_length sl
    ON ut.Customer_ID = sl.Customer_ID;
Approach & Reasoning
Used window function (LAG) to compare current vs previous usage
Identified behavior change, not just static values
Combined:
Usage trend
Subscription duration

This gives a more realistic churn signal.

Performance Considerations
Partitioning by Customer_ID ensures efficient window function usage
Index recommendation:
CREATE INDEX idx_usage_customer_date ON Usage(Customer_ID, Date);
Business Impact
Enables proactive retention strategies
Customer support can target high-risk users
Marketing can trigger retention campaigns

