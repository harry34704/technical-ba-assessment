# Technical Business Analyst Assessment

## Overview
This repository contains my submission for the Technical Business Analyst assessment, focusing on SQL analysis and API design.

The assessment is divided into two parts:
- Part 1: SQL Case Study
- Part 2: API Case Studies (selected tasks)

The goal of this submission is to demonstrate both technical capability and the ability to translate business requirements into practical solutions.

---

## Part 1: SQL Case Study

In this section, I worked with a telecom dataset to solve three business problems:

1. Sales Report Bottleneck  
   - Optimized query to calculate monthly revenue  
   - Focused on improving performance using indexing and aggregation  

2. Churn Prediction  
   - Identified at-risk customers using usage trends and subscription duration  
   - Applied window functions to detect behavioural changes  

3. Upsell Opportunities  
   - Identified customers close to plan limits  
   - Highlighted high-value upgrade opportunities  

Each solution includes:
- SQL queries  
- Explanation of approach  
- Performance considerations  
- Business impact  

---

## Technology Stack

- SQL (PostgreSQL-style syntax)
- GitHub for version control
- MS Word (for formatted submission)

---

## Setup Instructions

1. Create the following tables in your SQL environment:
   - Customers
   - Subscriptions
   - Usage

2. Ensure relationships are set using `Customer_ID`

3. Run the SQL queries provided in the document

Note:
- Some functions (e.g., `DATE_TRUNC`, `DATEDIFF`) may vary depending on the database used  
- Adjust syntax accordingly if using MySQL or SQL Server  

---

## Assumptions

- Plan pricing was not provided:
  - Basic = 100
  - Premium = 200

- Plan usage limits:
  - Basic = 10,000 MB
  - Premium = 50,000 MB

- Usage data is assumed to be accurate and complete

---

## Key Considerations

- Queries were written with scalability in mind  
- Indexing strategies were included to improve performance  
- Solutions focus on real business impact, not just technical output  

---

## Author
Harry Munyai
