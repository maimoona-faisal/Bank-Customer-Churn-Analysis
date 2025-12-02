-- 1. DATASET INFORMATION 
-- View the Table
SELECT * 
FROM churn_modelling;

-- Identify the datatypes 
DESCRIBE churn_modelling; 

-- 2. DATA CLEANING 
-- Check for duplicates 
SELECT CustomerId, COUNT(*) 
FROM churn_modelling 
GROUP BY CustomerId 
HAVING COUNT(*) > 1;

-- Check if categorical values are standardized 
SELECT DISTINCT HasCrCard, IsActiveMember, Exited
FROM churn_modelling;

-- 3. MATHEMATICAL OPERATIONS 
-- The annual balance change estimate 
SELECT CustomerId,
       Balance,
       Balance * 0.05 AS projected_growth_5_percent
FROM churn_modelling
LIMIT 5;

SELECT CustomerId, CreditScore, Age, 
       (CreditScore / Age) AS score_age_ratio
FROM churn_modelling;


-- 4. DESCRIPTIVE STATISTICS 
SELECT 
    MIN(CreditScore) AS min_credit,
    MAX(CreditScore) AS max_credit,
    AVG(CreditScore) AS avg_credit,
    MIN(Balance) AS min_balance,
    MAX(Balance) AS max_balance,
    AVG(Balance) AS avg_balance,
    COUNT(*) AS total_customers,
    SUM(Exited) AS total_churned
FROM churn_modelling;

-- Summary of credit score 
SELECT MIN(CreditScore) AS min_score,
       MAX(CreditScore) AS max_score,
       AVG(CreditScore) AS avg_score
FROM churn_modelling;

-- count of churned vs non churned 
SELECT Exited, COUNT(*) AS total_customers
FROM churn_modelling
GROUP BY Exited;

-- Total balance in bank 
SELECT SUM(Balance) AS total_bank_balance
FROM churn_modelling;
 
-- 5. FILTERING RECORDS 
-- customers who churned and have a high credit score
SELECT *
FROM churn_modelling
WHERE Exited = 1
  AND CreditScore > 700;

-- Customers with balance > 100,000 
SELECT CustomerId, Balance 
FROM churn_modelling
WHERE Balance > 100000;

-- Filter using multiple conditions
SELECT *
FROM churn_modelling
WHERE Age > 40
  AND Geography = 'France'
  AND Exited = 1;

-- 6. GROUPING AND AGGREGATION 
-- Churn count by geography
SELECT Geography, COUNT(*) AS churn_count
FROM churn_modelling
WHERE Exited = 1
GROUP BY Geography
ORDER BY churn_count DESC;

-- Average balance by gender 
SELECT Gender, AVG(Balance) AS avg_balance
FROM churn_modelling
GROUP BY Gender;

-- 7. ORDERING AND LIMITING RESULTS 
-- Top 10 highest balance customers 
SELECT CustomerId, Balance
FROM churn_modelling
ORDER BY Balance DESC
LIMIT 10;

-- Lowest credit scores 
SELECT CustomerId, CreditScore
FROM churn_modelling
ORDER BY CreditScore ASC
LIMIT 5;

-- 9. ALIASING 
-- Column aliasing 
SELECT CustomerId AS ID,
       Balance AS CustomerBalance
FROM churn_modelling;

-- Table aliasing 
SELECT bc.CustomerId, bc.Age
FROM churn_modelling AS bc
LIMIT 5;


-- 10. CHURN ANALYSIS INSIGHTS 
-- Churn rate calculation 
SELECT 
    ROUND(SUM(Exited)*100.0/COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling;

-- Age group churn 
SELECT CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 50 THEN '30-50'
           ELSE '>50'
       END AS age_group,
       COUNT(*) AS total_customers,
       SUM(Exited) AS churned,
       ROUND(SUM(Exited)*100.0/COUNT(*),2) AS churn_rate
FROM churn_modelling 
GROUP BY age_group;
 
-- 11. Ranking (Window function)
SELECT Geography,
       COUNT(*) AS churn_count,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_churn
FROM churn_modelling
WHERE Exited = 1
GROUP BY Geography;





 


 









