
# 🛒 Retail Sales Data Analysis (SQL Project)

## 📊 Project Overview

This project presents a complete **Retail Sales Data Analysis** using **SQL Server (SSMS)**. The dataset simulates 2,000 transactions including information like sale date, time, customer demographics, product categories, and sales amounts.

As a part of this analysis, I performed:
- Data validation and cleaning
- Data exploration
- Business-driven insights (Q&A style)
- Time-based performance breakdowns

This project showcases my ability to clean raw data, extract business-relevant insights, and apply SQL functions such as aggregation, filtering, grouping, and window functions.

---

## 🗂️ Dataset Details

- Table Name: `[SQL - Retail Sales Analysis]`
- Total Records: 2,000
- Fields Include:
  - `transactions_id`
  - `sale_date`, `sale_time`
  - `customer_id`, `gender`, `age`
  - `category`, `quantiy`, `price_per_unit`
  - `cogs`, `total_sale`

---

## 🧹 Data Cleaning

- Checked for null values in critical fields (3 records found)
- Removed rows with missing values to maintain data quality

```sql
DELETE FROM [SQL - Retail Sales Analysis]
WHERE transactions_id IS NULL 
   OR sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL 
   OR gender IS NULL 
   OR quantiy IS NULL 
   OR price_per_unit IS NULL 
   OR cogs IS NULL 
   OR total_sale IS NULL;
```

---

## 🔍 Exploratory Queries

- ✅ Total Transactions Count  
- 💰 Total Sales Value  
- 👥 Unique Customers  
- 🛍️ Unique Product Categories  

---

## 💼 Business Questions & Insights (Q&A)

Here are some key business questions answered using SQL:

1. **Write a sql query to retrieve all column for sales made on " 2022-11-05"**
   ```sql
   SELECT * FROM [SQL - Retail Sales Analysis]
   WHERE sale_date = '2022-11-05';
   ```

2. **Write a sql query to retrieve all transactions where the catagory is 'clothing ' and the quantity sold is more then 4 in the month of Nov - 2022)**
   ```sql
   SELECT category, SUM(quantiy) as Total_transactions
   FROM [SQL - Retail Sales Analysis]
   WHERE category = 'Clothing'
   AND FORMAT(sale_date, 'yyyy-MM') = '2022-11'
   AND quantiy >= 4
   GROUP BY category;
   ```
3. **Write a SQL query to calculate the total sales for each Category **
   ```sql
   select distinct category ,sum(total_sale) as Netsales  
   from [SQL - Retail Sales Analysis]
   group by category
   ```
4. **Write a SQL query to find the average age of customers who purchases the items for 'beauty' category**
   ```sql
   select avg(age) as average_age
   from [SQL - Retail Sales Analysis]
   where category = 'Beauty';
   ```

5. **Write a SQL query to find all tranasactions where total sales is greater then 1000**
   ```sql
   select * from [SQL - Retail Sales Analysis]
   where total_sale>1000;
   ```
6. **Write a sql query where to find total number of transactions made by each gender in each category**
   ```sql
   select category,gender, 
   count(*) as total_transactions
   from [SQL - Retail Sales Analysis]
   group by category,  gender
	 order by 1;
   ```
7. **Write a sql query to calculate the average sale for each month. Find out best selling month in each year**
   ```sql
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
 ```
8. **Write a sql query to find top 5 customers based on highest total sales**
 ```sql
 select TOP 5 customer_id , SUM(total_sale) as Total_sales
 from [SQL - Retail Sales Analysis]
 group by customer_id
 order by 2 DESC;
 ```
9. **Write a sql query to find number of unique customers who purchased items for each category**
 ```sql
 select count(distinct customer_id) as Unique_customers,
 category
 from [SQL - Retail Sales Analysis]
 group by category;
 ```
10. **Write a query to create a each shift and number of orders ( eg. morning <=12,afternoon between 12 & 17 , evening >17 **
 ```sql
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
 ```

## 🛠️ Tools Used

- **SQL Server Management Studio (SSMS)**
- SQL Functions: `COUNT()`, `SUM()`, `AVG()`, `GROUP BY`, `ORDER BY`, `CASE`, `RANK()`, `DATEPART()`, `FORMAT()`

---

## 📌 Key Learnings

- Data cleaning and integrity checking are critical for accurate reporting.
- SQL can efficiently answer business questions without additional tools.
- Window functions (like `RANK()`) are powerful for trend and ranking analysis.
- Time-based categorization (shifts) helps identify peak sale periods.

---

## 📂 File Structure

```
📁 Retail-Sales-SQL-Project/
│
├── sql data 1 project retail sales.sql     # Main SQL script csv
├── README.md                           
```

---

## 🙌 Author

**Rakesh Kumar Gupta**  
📧 rakeshgupta.rkg1984@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/rakesh-kr-gupta)

---

## 📌 GitHub Tags

`#SQLProject` `#RetailAnalytics` `#DataCleaning` `#SSMS` `#BusinessIntelligence` `#SQLQueries`

---

## 💡 Future Enhancements

- Integrate Power BI dashboards using the same dataset
- Predictive analytics on customer behavior
- Export analysis into PDF reports using Python

---
