Technical Business Analyst Assessment
Overview

This repository contains my submission for the Technical Business Analyst assessment. The focus of this assessment is on SQL problem-solving and API design, with an emphasis on structured thinking, clarity, and real-world applicability.

Rather than just providing technical outputs, the aim was to approach each task from a business perspective — understanding the problem, designing a solution, and ensuring it can be explained clearly to both technical and non-technical stakeholders.

The submission is divided into two parts:

Part 1: SQL Case Study
Part 2: API Case Study
Part 1: SQL Case Study

In this section, I worked with a telecom-style dataset to solve business-driven problems related to revenue, customer behaviour, and growth opportunities.

Problems Addressed

1. Sales Report Bottleneck

Optimised a query to calculate monthly revenue
Focused on improving performance using aggregation and efficient query structure

2. Churn Prediction

Identified customers likely to churn using usage patterns and subscription duration
Applied window functions to track behavioural changes over time

3. Upsell Opportunities

Identified customers nearing their plan limits
Highlighted potential upgrade opportunities to increase revenue
What Each SQL Solution Includes
SQL queries
Explanation of approach
Performance and scalability considerations
Business impact
SQL Technology Stack
SQL (PostgreSQL-style syntax)
GitHub (version control)
MS Word (for structured documentation)
SQL Setup Instructions

To run the SQL queries:

Create the following tables in your database:
Customers
Subscriptions
Usage
Ensure relationships are set using Customer_ID
Run the SQL queries provided in the SQL files or document
SQL Notes

Some functions (e.g. DATE_TRUNC, DATEDIFF) may vary depending on the database used.
Minor syntax adjustments may be required if using MySQL or SQL Server instead of PostgreSQL.

SQL Assumptions
Plan pricing was not provided, so the following was assumed:
Basic = 100
Premium = 200
Plan usage limits:
Basic = 10,000 MB
Premium = 50,000 MB
Usage data is assumed to be complete and accurate
SQL Key Considerations
Queries were written with scalability in mind
Indexing strategies were considered to improve performance
Focus was placed on business impact, not just technical output
Part 2: API Case Study

For this part of the assessment, I built a simple User Management API using FastAPI.

The objective was to demonstrate an understanding of how systems expose and manage data through APIs, including validation, error handling, and structured design.

I chose FastAPI because it is lightweight, easy to set up, and automatically generates interactive Swagger documentation, making it straightforward to test and review the API.

API Technology Stack
Python 3.10+
FastAPI
Uvicorn
Pydantic
email-validator
API Features

The API supports basic user management functionality:

Create a user
Retrieve a user by ID
Update a user
Delete a user
Health check endpoint
API Setup Instructions
Navigate to the API folder:
cd api_case_study
Create a virtual environment:
python -m venv venv
Activate the environment:

Windows

venv\Scripts\activate

Mac/Linux

source venv/bin/activate
Install dependencies:
pip install -r requirements.txt
Run the API:
uvicorn main:app --reload
Accessing the API

Once the server is running:

Base URL:
http://127.0.0.1:8000
Swagger Documentation:
http://127.0.0.1:8000/docs

The Swagger UI provides a fully interactive interface where all endpoints can be tested directly.

How to Test the API
1. Health Check

Run:
GET /health

Expected response:

{
  "status": "ok"
}
2. Create a User

Run:
POST /api/v1/users

Example request:

{
  "name": "Harry Munyai",
  "email": "harry@test.com"
}

Expected:

Status: 201
User is created
3. Retrieve User

Run:
GET /api/v1/users/{user_id}

Expected:

Status: 200
Returns user details
4. Update User

Run:
PUT /api/v1/users/{user_id}

Example:

{
  "name": "Updated Name"
}

Expected:

Status: 200
User details updated
5. Delete User

Run:
DELETE /api/v1/users/{user_id}

Expected:

Status: 200
Confirmation message returned
6. Error Handling Tests
Duplicate email → returns 409
Non-existent user → returns 404
Invalid input → returns 422
API Endpoints Summary
POST /api/v1/users → Create a user
GET /api/v1/users/{user_id} → Retrieve a user
PUT /api/v1/users/{user_id} → Update a user
DELETE /api/v1/users/{user_id} → Delete a user
GET /health → Confirm API is running
API Assumptions
Data is stored in memory (no database used)
Data resets when the API restarts
Emails must be unique
User IDs are auto-incremented starting from 101
The update endpoint supports partial updates
Design Decisions
Kept the implementation simple and easy to review
Used FastAPI to leverage built-in Swagger documentation
Applied validation to prevent invalid input
Implemented duplicate email checking at application level
Added a health endpoint for quick system checks
Scalability Considerations

If this API were extended into a production system:

Replace in-memory storage with a database (e.g. PostgreSQL)
Add indexing for performance
Separate business logic into service layers
Implement authentication and authorization
Add logging and monitoring
Supporting Documents

This repository is supported by:

SQL Case Study.docx
Part2_API_Case_Study.docx

These documents provide more detailed explanations of the approach, assumptions, and business reasoning.

Author

Harry Munyai
