
/*==================================================

PROJECT: THE BILLIONAIRE WEALTH INVESTIGATION
BY:      GIDEON MONDAY SILAS
==================================================

1. ABOUT THE DATASET

The Top 200 Richest World's Billionaires Dataset
provides information about the wealthiest
individuals globally.

2. PROJECT OBJECTIVE

Is to analyse wealth distribution, industry
dominance, country representation and the
demographics of the world's richest people.

3. BUSINESS QUESTIONS

I am investigating business questions for 
this project.

==================================================*/


-- CREATING DATABASE TO WAREHOUSE MY TABLE

CREATE DATABASE
Billionaire_Wealth_Analysis;



-- SELECT NEW DATABASE

USE
Billionaire_Wealth_Analysis;



-- DATA EXPLORATION

-- View all records

SELECT *
FROM dbo.[Top 200 Richest Person in the World];


-- BUSINESS QUESTION 1

-- Retrieve the 20 richest billionaires

SELECT TOP 20 *
FROM dbo.[Top 200 Richest Person in the World]
ORDER BY networth_billion_US_dollars
DESC;



-- Identify the first 5 lowest richest billionaires

SELECT TOP 5 *
FROM dbo.[Top 200 Richest Person in the World]
ORDER BY networth_billion_US_dollars
ASC;


-- BUSINESS QUESTION 2

-- Identify the 5 youngest billionaires

SELECT TOP 5 *
FROM dbo.[Top 200 Richest Person in the World]
ORDER BY age
ASC;

-- Identify the 10 oldest billionaires

SELECT TOP 10 *
FROM dbo.[Top 200 Richest Person in the World]
ORDER BY age
DESC;


-- BUSINESS QUESTION 3

-- Calculate the average age and the average networth

SELECT 
AVG(age) AS average_age,
ROUND(AVG(networth_billion_US_dollars), 2) AS average_networth
FROM dbo.[Top 200 Richest Person in the World];



-- BUSINESS QUESTION 4

-- Find the 5 most represented countries

SELECT TOP 5 country,
COUNT(*) AS number_of_billonaires 
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
ORDER BY number_of_billonaires
DESC;


SELECT TOP 5 industry,
COUNT(*) AS number_of_billonaires 
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY number_of_billonaires
DESC;



-- BUSINESS QUESTION 5

-- Calculate the combined networth of Billonaires from each country

SELECT country,
SUM(networth_billion_US_dollars) AS total_networth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
ORDER BY total_networth
DESC;


-- BUSINESS QUESTION 6

-- Identify the five industries with the highest number of billionaires

SELECT TOP 5 industry,
COUNT(*) AS number_of_billionaires
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY number_of_billionaires
DESC;



-- BUSINESS QUESTION 7

-- Find countries with at least five billionaires

SELECT country,
COUNT(*) AS number_of_billionaires
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY number_of_billionaires
DESC;



-- BUSINESS QUESTION 8

-- Calculate the total wealth of billionaires younger than 50

SELECT
SUM(networth_billion_US_dollars) AS total_networth
FROM dbo.[Top 200 Richest Person in the World]
WHERE age < 50;



-- BUSINESS QUESTION 9

-- Identify billionaires whose networth exceeds the overall average networth

SELECT
name,
country,
industry,
networth_billion_US_dollars
FROM dbo.[Top 200 Richest Person in the World]
WHERE networth_billion_US_dollars > 
(
SELECT AVG(networth_billion_US_dollars)
FROM dbo.[Top 200 Richest Person in the World]
)
ORDER BY networth_billion_US_dollars
DESC;


-- BUSINESS QUESTION 10

-- Identify the industry with the highest average networth

SELECT TOP 1
industry,
AVG(networth_billion_US_dollars) AS average_networth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY average_networth
DESC;


-- ADDITIONAL BUSINESS QUESTION 11

-- Which age group has the highest combined net worth?
-- Age groups: Under 40, 40-59, 60 and above.

SELECT
CASE
WHEN age < 40 THEN 'Under 40'
WHEN age BETWEEN 40 AND 59 THEN '40-59'
ELSE '60 and above'
END AS age_group,
SUM(networth_billion_US_dollars) AS total_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY
CASE
WHEN age < 40 THEN 'Under 40'
WHEN age BETWEEN 40 AND 59 THEN '40-59'
ELSE '60 and above'
END
ORDER BY total_net_worth 
DESC;


-- ADDITIONAL BUSINESS QUESTION 12

-- How many billionaires belong to each age group?

SELECT
CASE
WHEN age < 40 THEN 'Under 40'
WHEN age BETWEEN 40 AND 59 THEN '40-59'
ELSE '60 and above'
END AS age_group,
COUNT(*) AS number_of_billionaires
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY
CASE
WHEN age < 40 THEN 'Under 40'
WHEN age BETWEEN 40 AND 59 THEN '40-59'
ELSE '60 and above'
END
ORDER BY number_of_billionaires
DESC;


-- ADDITIONAL BUSINESS QUESTION 13

-- Which country has the highest average billionaire net worth?

SELECT TOP 1
country,
AVG(networth_billion_US_dollars) AS average_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
ORDER BY average_net_worth 
DESC;


-- ADDITIONAL BUSINESS QUESTION 14
  
-- Which industry has the highest combined net worth?

SELECT TOP 1
industry,
SUM(networth_billion_US_dollars) AS total_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY total_net_worth 
DESC;


-- ADDITIONAL BUSINESS QUESTION 15
  
-- Which industries have average net worth above the overall average?

SELECT
industry,
AVG(networth_billion_US_dollars) AS average_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
HAVING AVG(networth_billion_US_dollars) >
(
SELECT AVG(networth_billion_US_dollars)
FROM dbo.[Top 200 Richest Person in the World]
)
ORDER BY average_net_worth 
DESC;


/*============================================================
  END OF PROJECT QUERIES
============================================================*/
