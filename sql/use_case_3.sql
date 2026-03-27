Use Case 3: Upsell Opportunities
Problem

Identify customers close to plan limits who are good candidates for upgrades.

Assumptions
Plan limits:
Basic → 10,000 MB
Premium → 50,000 Mb
SQL Query
SELECT 
    u.Customer_ID,
    s.Plan_Type,
    SUM(u.Data_Used_Mb) AS Total_Data_Used,
    CASE 
        WHEN s.Plan_Type = 'Basic' THEN 10000
        WHEN s.Plan_Type = 'Premium' THEN 50000
    END AS Plan_Limit,
    ROUND(
        (SUM(u.Data_Used_Mb) * 100.0) /
        CASE 
            WHEN s.Plan_Type = 'Basic' THEN 10000
            WHEN s.Plan_Type = 'Premium' THEN 50000
        END, 2
    ) AS Usage_Percentage
FROM Usage u
JOIN Subscriptions s
    ON u.Customer_ID = s.Customer_ID
GROUP BY u.Customer_ID, s.Plan_Type
HAVING 
    (SUM(u.Data_Used_Mb) * 1.0) /
    CASE 
        WHEN s.Plan_Type = 'Basic' THEN 10000
        WHEN s.Plan_Type = 'Premium' THEN 50000
    END > 0.8
ORDER BY Usage_Percentage DESC;
Approach & Reasoning
Aggregated total usage per customer
Compared usage against plan thresholds
Filtered only customers above 80% usage

This ensures

We don’t target everyone
Only high-probability upgrade candidates
Performance Considerations
Index:
CREATE INDEX idx_usage_customer ON Usage(Customer_ID);
Aggregation happens before filtering → reduces dataset size
Business Impact
Direct revenue growth opportunity
Enables targeted upsell campaigns
Improves customer experience (avoids overage frustration)
