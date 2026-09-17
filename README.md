Zepto Store Analysis

📌 Project Overview

This project contains a SQL-based analysis of a Zepto product dataset. The SQL script creates and modifies a zepto table, performs basic data exploration and cleaning, and answers a set of business-oriented analytical questions related to pricing, discounts, inventory, product availability, and estimated revenue.

The analysis is implemented in the accompanying Zepto_Store_Analysis.sql file. fileciteturn0file0L1-L13

🗂️ Dataset Structure

The zepto table contains the following fields:

Column

Description

sku_id

Unique SKU identifier

category

Product category

name

Product name

mrp

Maximum Retail Price

discountPercent

Discount percentage

availableQuantity

Available inventory quantity

discountedSellingPrice

Selling price after discount

weightInGms

Product weight in grams

outOfStock

Product stock-status indicator

quantity

Product quantity

These columns are defined in the SQL table schema. fileciteturn0file0L3-L13

🔍 Analysis Workflow

The SQL script follows these main stages:

1. Table Setup

Drops the existing zepto table if it exists.

Creates the zepto table with product, pricing, inventory, and availability fields.

Modifies outOfStock and converts its values from 1/0 to True/False. fileciteturn0file0L1-L22

2. Data Exploration

The script explores the dataset by:

Displaying all records.

Counting the number of rows.

Checking for NULL values.

Listing unique product categories.

Comparing in-stock and out-of-stock products.

Identifying duplicate product names. fileciteturn0file0L26-L68

3. Data Cleaning

The cleaning steps include:

Identifying products where mrp or discountedSellingPrice is 0.

Removing those records.

Converting MRP and discounted selling prices from paisa to rupees by dividing the values by 100. fileciteturn0file0L70-L82

4. Business Analysis

The script answers eight analytical questions:

Top 10 best-value products based on discount percentage.

High-MRP products that are out of stock, using an MRP threshold of ₹300.

Estimated revenue by category, calculated using discounted selling price × available quantity.

Products with MRP ≥ ₹500 and discount < 10%.

Top 5 categories by average discount percentage.

Price per gram for products weighing at least 100g.

Weight-based product classification into:

Low: under 1000g

Medium: 1000g to under 5000g

Bulk: 5000g or more

Total inventory weight per category, calculated from weight × available quantity. fileciteturn0file0L84-L167

📊 Key Metrics & Calculations

Some of the main calculations used in the analysis are:

Estimated Revenue
discountedSellingPrice × availableQuantity

Average Discount
AVG(discountPercent)

Price Per Gram
discountedSellingPrice ÷ weightInGms

Total Inventory Weight
weightInGms × availableQuantity

Weight Categories

< 1000g → Low

1000g–<5000g → Medium

≥ 5000g → Bulk

🛠️ SQL Compatibility Note

The script uses SQL syntax associated with different database systems. For example, the table definition uses SERIAL, while the later ALTER TABLE ... MODIFY COLUMN statement is MySQL-style syntax. The README preserves the SQL script as provided rather than changing its implementation. fileciteturn0file0L3-L17

If running the project in a specific database system, some syntax may need to be adapted to that system.

🚀 How to Use

Open Zepto_Store_Analysis.sql in your SQL client.

Connect to the database where you want to run the analysis.

Load/populate the zepto table with the dataset used by the script.

Execute the table setup and data-cleaning statements.

Run the exploration queries to inspect the data.

Run the analytical queries to generate the requested business insights.

📁 Project Files

.
├── Zepto_Store_Analysis.sql
└── README.md

🎯 Project Purpose

The project demonstrates practical SQL skills including:

Database/table creation

Data exploration

NULL-value checks

Duplicate detection

Data cleaning

Filtering and sorting

Aggregation with SUM, AVG, and COUNT

GROUP BY analysis

Conditional logic with CASE

Business-oriented SQL analysis

👤 Author
Hemanta Kumar Behera 
