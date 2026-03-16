select * from customer limit 20

--Q1. What is the total number of customers?
SELECT count(*) AS total_customers
FROM customer;

--Q2. What is the overall churn rate (%)?
SELECT ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer;

--Q3. How many customers have churned vs retained?
SELECT churn,
	CASE
		WHEN churn = 1 THEN 'Churned'
		WHEN churn = 0 THEN 'Retained'
	END AS churn_status,
	COUNT(*) AS total_customers
FROM customer
GROUP BY churn;

--Q4. What is the churn rate by country?
SELECT 
    country,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer
GROUP BY country
ORDER BY churn_rate_percentage DESC;

--Q5. Does gender impact churn?
SELECT 
    gender,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer
GROUP BY gender;

--Q6. What is the churn rate based on active membership?
SELECT active_member,
	CASE
		WHEN active_member = 1 THEN 'True'
		WHEN active_member = 0 THEN 'False'
	END AS active_member_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer
GROUP BY active_member;

--Q7. How does number of products affect churn?
SELECT 
    products_number,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer
GROUP BY products_number
ORDER BY products_number;

--Q8. Which age group has the highest churn rate?
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 29 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle_Aged'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer
GROUP BY 
    CASE 
        WHEN age BETWEEN 18 AND 29 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle_Aged'
        ELSE 'Senior'
    END
ORDER BY churn_rate_percentage DESC;

--Q9. Does tenure affect churn?
SELECT 
    tenure,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percentage
FROM customer
GROUP BY tenure
ORDER BY tenure;

--Q10. What is the average balance and salary of churned vs non-churned customers?
SELECT 
    churn,
    CASE 
        WHEN churn = 1 THEN 'Churned Customers'
        WHEN churn = 0 THEN 'Non-Churned Customers'
    END AS churn_status,
    ROUND(AVG(balance)::numeric, 2) AS avg_balance,
    ROUND(AVG(estimated_salary)::numeric, 2) AS avg_salary
FROM customer
GROUP BY churn;