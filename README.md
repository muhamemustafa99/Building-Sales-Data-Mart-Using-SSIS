# SSIS ETL Project

## Overview
This repository contains an ETL (Extract, Transform, Load) project implemented using SQL Server Integration Services (SSIS). The project processes data from various sources to populate a data warehouse with dimensional models, including fact and dimension tables.

## Project Structure
- **fact_sales_Full.dtsx**: Full load process for the sales fact table.
- **fact_sales_Incremental.dtsx**: Incremental load process for the sales fact table.
- **dim_date.dtsx**: ETL process for the date dimension table.
- **dim_customer.dtsx**: ETL process for the customer dimension table.
- **dim_product.dtsx**: ETL process for the product dimension table.
- **dim_territory.dtsx**: ETL process for the territory dimension table.

## Features
- Extracts data from source tables (e.g., SalesOrderHeader, SalesOrderDetail).
- Applies transformations such as merging, lookups, and calculations (e.g., extended sales and cost).
- Handles slowly changing dimensions (SCD) for customer and product data.
- Manages full and incremental data loads.
- Updates the last load date for tracking purposes.

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 👤 Author

**Mohamed Mostafa Mogahed**  
*BI / Data Analyst*  
📧 muhamedmustafa9933@icloud.com  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/mohamedmostafa99/)  
💻 [GitHub](https://github.com/muhamemustafa99)


🌐 My Portfolio:  (https://mohamed5034.wordpress.com/about/)

---

Feel free to fork, explore, or reach out if you're interested in collaboration!
