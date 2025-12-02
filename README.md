Bank Customer Churn Analysis (SQL & Data-Driven Strategy)

Project Overview

This project uses SQL to perform a comprehensive exploratory data analysis (EDA) on a banking dataset to identify and quantify the primary drivers of customer churn (account closure). The goal is to provide data-backed insights and recommendations to help the bank develop targeted retention strategies, ultimately protecting its customer base and maximizing lifetime value.

Analytical Findings

The analysis of 10,000 customer records revealed critical segments with disproportionately high churn rates:

Age-Related Risk: The overall churn rate is $\mathbf{20.37\%}$, but customers in the $\mathbf{>50}$ age group exhibited a $\mathbf{44.65\%}$ churn rate, making them the highest-risk segment for immediate intervention.

Geographic Vulnerability: Customers located in $\mathbf{Germany}$ churn at a significantly higher rate ($\mathbf{32.44\%}$) compared to those in France ($\mathbf{16.15\%}$) and Spain ($\mathbf{16.67\%}$), suggesting potential regional dissatisfaction or product fit issues.

SQL Techniques & Skill Demonstration

The analytical process in Bank_Customer_Churn_Project.sql demonstrates proficiency in advanced SQL techniques essential for a Data Analyst role:

Technique

Description

Section in Script

Common Table Expressions (CTEs)

Used a CTE (AgeGroupData) to modularize complex logic, categorize customers into age buckets, and calculate churn rates cleanly.

Section 11

Window Functions

Employed DENSE_RANK() to prioritize geographies based on total churn count, allowing for targeted resource allocation.

Section 10

Feature Engineering

Created new derived columns, such as a Score-to-Age Ratio, to assess risk profile across the customer lifecycle.

Section 3

Data Cleaning/Validation

Included essential checks for duplicates (CustomerId) and explicit checks for NULL/missing values in critical columns.

Section 2

Aggregation & Grouping

Used SUM(), AVG(), and COUNT() alongside GROUP BY to calculate key metrics, averages, and segment-specific churn rates.

Section 4, 6

Repository Contents

Bank_Customer_Churn_Project.sql: The complete, commented SQL script containing all 12 analytical steps, from data cleaning and descriptive statistics through advanced ranking and CTE implementation.

Churn_Modelling.csv: The raw dataset (10,000 rows) used for this analysis.

