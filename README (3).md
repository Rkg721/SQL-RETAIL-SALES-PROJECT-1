
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

1. **Sales on a Specific Date**
   ```sql
   SELECT * FROM [SQL - Retail Sales Analysis]
   WHERE sale_date = '2022-11-05';
   ```

2. **Clothing Category with Quantity > 4 (Nov 2022)**
3. **Total Sales by Category**
4. **Average Age of Customers in ‘Beauty’ Category**
5. **Transactions with Total Sales > 1000**
6. **Sales by Gender & Category**
7. **Best-Selling Month per Year (using Window Functions)**
8. **Top 5 Customers by Total Sales**
9. **Unique Customers by Category**
10. **Sales by Time of Day (Morning/Afternoon/Evening)**

---

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
├── sql data 1 project retail sales.sql     # Main SQL script with all queries
├── README.md                               # Project documentation
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
