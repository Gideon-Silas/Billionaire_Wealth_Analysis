# BILLIONAIRE WEALTH ANALYSIS
An Exploratory SQL Data Analysis of the World's 200 Richest Billionaires

![Database](https://img.shields.io/badge/Database-SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=white)
![Language](https://img.shields.io/badge/Language-SQL-4479A1?logo=postgresql&logoColor=white)
![Technique](https://img.shields.io/badge/Technique-Data%20Analysis%20%26%20Aggregation-1F4E79)
![Domain](https://img.shields.io/badge/Domain-Financial%20%26%20Wealth%20Analytics-0B6E99)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

# INTRODUCTION
![Introduction](Introductory_Image.png)

## Project Overview
- This project analyses a dataset containing information about the world's 200 richest billionaires.
- The aim is to investigate wealth distribution, individual net worth, age demographics, country representation and industry dominance using SQL Server.
- The project demonstrates how SQL can be used to explore structured data, answer business questions, identify patterns and communicate meaningful insights.

## The objectives of this project are to:
•	Identify the wealthiest individuals in the dataset.
•	Examine the age distribution of billionaires.
•	Calculate average age and net worth.
•	Investigate billionaire representation across countries.
•	Calculate combined wealth by country.
•	Identify industries with the highest billionaire representation.
•	Examine wealth distribution across age groups.
•	Compare average net worth across countries and industries.
•	Identify industries whose average wealth exceeds the overall dataset average.

## Dataset Description
- Dataset: Top 200 Richest Person in the World
- Number of records: 200
- Number of columns: 7
  
## Dataset columns
- serial_number:	Unique serial identifier
- rank:	Billionaire's ranking
- name:	Billionaire's name
- age:	Billionaire's age
- country:	Country associated with the billionaire
- networth_billion_US_dollars:	Net worth in billions of US dollars
- industry:	Industry associated with the billionaire

## Data types
•	serial_number: Integer
•	rank: Integer
•	name: Text
•	age: Integer
•	country: Text
•	networth_billion_US_dollars: Numeric
•	industry: Text

## Tools and Technologies
•	Microsoft SQL Server
•	SQL Server Management Studio (SSMS 22)
•	Microsoft Excel (data inspection and preparation)
•	GitHub (project documentation and portfolio presentation)

## Database Setup
- The dataset was imported into a SQL Server database named:
Billionaire_Wealth_Analysis
- The imported table is:
dbo.[Top 200 Richest Person in the World]
- The following database context is used for the analysis:
USE Billionaire_Wealth_Analysis;

## Business Questions and SQL Analysis
BUSINESS QUESTION 1
Who are the 20 richest billionaires in the dataset?
SELECT TOP 20
    name,
    country,
    age,
    industry,
    networth_billion_US_dollars
FROM dbo.[Top 200 Richest Person in the World]
ORDER BY networth_billion_US_dollars DESC;
Purpose: Identify the 20 individuals with the highest net worth.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 2
Who are the five youngest billionaires?
SELECT TOP 5
    name,
    age,
    country,
    industry,
    networth_billion_US_dollars
FROM dbo.[Top 200 Richest Person in the World]
ORDER BY age ASC;
Purpose: Identify the youngest individuals in the dataset.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 3
What are the average age and average net worth of the 200 billionaires?
SELECT
    AVG(age) AS average_age,
    AVG(networth_billion_US_dollars) AS average_net_worth
FROM dbo.[Top 200 Richest Person in the World];
Purpose: Establish the average demographic and wealth profile.
Finding: The average age is 69.38 years, while the average net worth is approximately $31.84 billion.
BUSINESS QUESTION 4
Which five countries have the highest number of billionaires?
SELECT TOP 5
    country,
    COUNT(*) AS number_of_billionaires
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
ORDER BY number_of_billionaires DESC;
Purpose: Identify the countries with the highest billionaire representation.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 5
What is the combined net worth of billionaires in each country?
SELECT
    country,
    SUM(networth_billion_US_dollars) AS total_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
ORDER BY total_net_worth DESC;
Purpose: Compare the total wealth represented by each country.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 6
Which five industries have the highest number of billionaires?
SELECT TOP 5
    industry,
    COUNT(*) AS number_of_billionaires
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY number_of_billionaires DESC;
Purpose: Identify the industries with the highest billionaire representation.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 7
Which countries have at least five billionaires?
SELECT
    country,
    COUNT(*) AS number_of_billionaires
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY number_of_billionaires DESC;
Purpose: Identify countries meeting the minimum representation threshold.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 8
What is the total net worth of billionaires younger than 50?
SELECT
    SUM(networth_billion_US_dollars) AS total_net_worth
FROM dbo.[Top 200 Richest Person in the World]
WHERE age < 50;
Purpose: Calculate the combined wealth of billionaires below age 50.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 9
Which billionaires have a net worth above the overall average?
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
ORDER BY networth_billion_US_dollars DESC;
Purpose: Identify individuals whose net worth exceeds the overall dataset average.
Finding: [Insert your verified findings.]
BUSINESS QUESTION 10
Which industry has the highest average net worth?
SELECT TOP 1
    industry,
    AVG(networth_billion_US_dollars) AS average_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY average_net_worth DESC;
Purpose: Identify the industry with the highest average billionaire wealth.
Finding: [Insert your verified findings.]
________________________________________
7. Additional Business Questions
The following questions extend the original analysis and provide deeper insights into wealth distribution.
ADDITIONAL QUESTION 12
Which age group has the highest combined net worth?
Age groups:
•	Under 40
•	40–59
•	60 and above
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
ORDER BY total_net_worth DESC;
Purpose: Compare the combined wealth of different age groups.
Finding: [Insert your verified findings.]
ADDITIONAL QUESTION 14
How many billionaires belong to each age group?
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
ORDER BY number_of_billionaires DESC;
Purpose: Understand the age composition of the dataset.
Finding: [Insert your verified findings.]
ADDITIONAL QUESTION 15
Which country has the highest average billionaire net worth?
SELECT TOP 1
    country,
    AVG(networth_billion_US_dollars) AS average_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY country
ORDER BY average_net_worth DESC;
Purpose: Compare average billionaire wealth across countries.
Finding: [Insert your verified findings.]
ADDITIONAL QUESTION 18
Which industry has the highest combined net worth?
SELECT TOP 1
    industry,
    SUM(networth_billion_US_dollars) AS total_net_worth
FROM dbo.[Top 200 Richest Person in the World]
GROUP BY industry
ORDER BY total_net_worth DESC;
Purpose: Identify the industry representing the greatest combined wealth.
Finding: [Insert your verified findings.]
ADDITIONAL QUESTION 20
Which industries have an average net worth above the overall dataset average?
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
ORDER BY average_net_worth DESC;
Purpose: Identify industries whose average billionaire wealth exceeds the overall average.
Finding: [Insert your verified findings.]
________________________________________
8. Key SQL Concepts Applied
The project demonstrates the following SQL concepts:
SQL concept	Application
SELECT	Retrieve specific columns
TOP	Limit returned records
WHERE	Filter individual records
ORDER BY	Sort query results
GROUP BY	Aggregate records into groups
COUNT()	Count records
SUM()	Calculate total wealth
AVG()	Calculate average values
HAVING	Filter grouped results
CASE WHEN	Categorize billionaires by age
BETWEEN	Define age ranges
Subqueries	Compare individual and grouped results with an overall average
Aliases	Give calculated columns meaningful names

## Key Findings and Business Insights
This section is completed after I have executed actual SQL outputs.
The final analysis highlights:
1.	The wealthiest individuals in the dataset.
2.	The average age and net worth of the billionaires.
3.	Countries with the highest billionaire representation.
4.	Countries with the greatest combined billionaire wealth.
5.	Industries with the highest billionaire representation.
6.	The relationship between age groups and wealth distribution.
7.	Countries and industries with the highest average net worth.
8.	Industries whose average net worth exceeds the overall benchmark etc.
   
## Project Limitations
•	The analysis is based on only 200 individuals, not the entire global billionaire population.
•	The dataset represents a particular point in time and may not reflect current wealth rankings.
•	The analysis identifies patterns and associations but does not establish the causes of wealth differences.
•	Country and industry classifications depend on how the original dataset defines and records them.
•	Average values can be influenced by extremely high net worth observations.


## Conclusion
This project applies SQL to investigate wealth distribution among the 200 richest billionaires in the dataset.
Through structured queries and business-driven questions, the analysis explores individual wealth, demographic patterns, country representation and industry distribution.
The project also demonstrates the importance of translating raw query results into meaningful business insights.

 ## Repository Structure
Suggested GitHub repository layout:
Billionaire-Wealth-Analysis/
│
├── README.md
│
├── Dataset/
│   └── Top 200 Richest Person in the World.csv
│
├── Project_Script/
│   ├── 200_Top_Billionaires
└── 
________________________________________
Project Status: SQL analysis completed in development; findings verification, and documentation

## About the Author

**Gideon Silas** is a Finance graduate, specializing at the intersection of corporate finance and modern data analytics. He is learning and building robust technical toolkits that allow him to transform raw enterprise data into strategic financial insights.

He enjoys turning messy business data into decisions people can act on, especially where finance and data meet.

- [LinkedIn](https://www.linkedin.com/in/gideonsilas)
- [Email](gideonmondaysilas@gmail.com)
- [More projects](https://wwww.github.com/Gideon-Silas)

*If you found this project useful, feel free to star the repository.*

