--- PROJECT 1 -  ANALYSIS OF RETAIL SALES DATA

use sql_project

-- Data have been loaded directly from system to SSMS hence rows and columns are uploaded directly and can be checked with below command-

select * from [SQL - Retail Sales Analysis]


-- Data checking and cleaning

select count(*) from [SQL - Retail Sales Analysis] --  shows data has 2000 rows - ok

select * from [SQL - Retail Sales Analysis]  -- shows data has 3 null values
where transactions_id IS NULL 
      OR 
      sale_date IS NULL 
OR sale_time IS NULL 
OR customer_id IS NULL 
OR gender IS NULL 
OR quantiy IS NULL 
OR price_per_unit IS NULL 
OR cogs IS NULL 
OR total_sale IS NULL ;

DELETE from [SQL - Retail Sales Analysis] -- deleted 3 null values as per above
where transactions_id IS NULL 
      OR 
      sale_date IS NULL 
OR sale_time IS NULL 
OR customer_id IS NULL 
OR gender IS NULL 
OR quantiy IS NULL 
OR price_per_unit IS NULL 
OR cogs IS NULL 
OR total_sale IS NULL ;


-- DATA EXPLORATION 

--1 TOTAL SALES COUNT

select COUNT(*) as Total_sales_count from [SQL - Retail Sales Analysis]

--2 - TOTAL SALES

select sum(total_sale) from [SQL - Retail Sales Analysis]

--3 - TOTAL Unique  Customers
select COUNT(DISTINCT customer_id) as Total_customers from [SQL - Retail Sales Analysis]

--4- Total Unique category
select COUNT(DISTINCT category) as Total_category from [SQL - Retail Sales Analysis]

--DATA ANALYSIS QUERY : - BUSINEES Q & A

 -- 1) Write a sql query to retrieve all column for sales made on " 2022-11-05"
 select * from [SQL - Retail Sales Analysis]
 where sale_date ='2022-11-05'

 --2) Write a sql query to retrieve all transactions where the catagory is 'clothing ' and the quantity sold is more then 4 in the month of Nov - 2022 ?

SELECT category, SUM(quantiy) as Total_transactions
FROM [SQL - Retail Sales Analysis]
WHERE category = 'Clothing'
  AND FORMAT(sale_date, 'yyyy-MM') = '2022-11'
  AND quantiy >= 4
GROUP BY category;

-- 3) Write a SQL query to calculate the total sales for each Category ?
select distinct category ,sum(total_sale) as Netsales  
from [SQL - Retail Sales Analysis]
group by category
;

--4) Write a SQL query to find the average age of customers who purchases the items for 'beauty' category ?

select avg(age) as average_age
from [SQL - Retail Sales Analysis]
where category = 'Beauty';

--5)Write a SQL query to find all tranasactions where total sales is greater then 1000 ? 

select * from [SQL - Retail Sales Analysis]
where total_sale>1000;

--6)Write a sql query where to find total number of transactions made by each gender in each category?

select category,gender, 
       count(*) as total_transactions
         from [SQL - Retail Sales Analysis]
          group by category,
                        gender
						order by 1;

-- 7)Wrte a sql query to calculate the average sale for each month. Find out best selling month in each year ?

SELECT *
FROM (
    SELECT 
        DATEPART(YEAR, sale_date) AS Sale_Year,
        DATEPART(MONTH, sale_date) AS Sale_Month,
        AVG(total_sale) AS Total_Sales,
        RANK() OVER (
            PARTITION BY DATEPART(YEAR, sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS Sale_Rank
    FROM 
        [SQL - Retail Sales Analysis]
    GROUP BY 
        DATEPART(YEAR, sale_date),
        DATEPART(MONTH, sale_date)
) AS RankedSales
WHERE Sale_Rank = 1
ORDER BY Sale_Year, Sale_Month DESC;
 ;

--8) Write a sql query to find top 5 customers based on highest total sales ?

select TOP 5 customer_id , SUM(total_sale) as Total_sales
from [SQL - Retail Sales Analysis]
group by customer_id
order by 2 DESC;


-- 9)Write a sql query to find number of unique customers who purchased items for each category ?

select count(distinct customer_id) as Unique_customers,
category
from [SQL - Retail Sales Analysis]
group by category


-- 10) Write a query to create a each shift and number of orders ( eg. morning <=12,afternoon between 12 & 17 , evening >17 ?

WITH hourly_sales AS (
    SELECT *,  
        CASE
            WHEN DATEPART(hour, sale_time) < 12 THEN 'MORNING'
            WHEN DATEPART(hour, sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
            ELSE 'EVENING'
        END AS shift  
    FROM [SQL - Retail Sales Analysis]
)
SELECT 
    shift,  -- You missed the comma here originally
    COUNT(*) AS total_sale
FROM hourly_sales
GROUP BY shift;


-- END OF PROJECT ---



