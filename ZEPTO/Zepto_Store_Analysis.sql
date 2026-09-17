drop table if exists zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8 , 2 ),
    discountPercent NUMERIC(5 , 2 ),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8 , 2 ),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

ALTER TABLE zepto
MODIFY COLUMN outOfStock VARCHAR(5);
UPDATE zepto
SET outOfStock =
    CASE
        WHEN outOfStock = '1' THEN 'True'
        WHEN outOfStock = '0' THEN 'False'
    END;


-- Data Exploration
-- Show all data
SELECT * FROM zepto;

-- Count Of rows
SELECT COUNT(*) FROM zepto;

-- Null Values
SELECT * FROM ZEPTO
WHERE name IS NULL
OR 
category IS NULL
OR 
mrp IS NULL
OR 
discounTPercent IS NULL
OR 
discountedsellingprice IS NULL
OR 
outofstock IS NULL
OR 
weightingms IS NULL
OR 
availablequantity IS NULL
OR 
quantity IS NULL;

-- UNIQUE PRODUCT CATEGORIES
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- PRODUCTS IN STOCK VS OUT_OF_STOCK
SELECT outOfStock, count(sku_id)
FROM zepto
GROUP BY outOfStock;

-- DUPLICATE PRODUCT NAME
SELECT name, COUNT(sku_id) as Number_of_sku
FROM zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

-- DATA CLEANING
-- product with mrp =0
SELECT * FROM zepto
WHERE mrp = 0 or discountedSellingPrice = 0;
 
DELETE FROM zepto
WHERE mrp = 0 or discountedSellingPrice = 0;

-- convert paisa to rupees
UPDATE zepto
SET mrp = mrp/100.0, discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedsellingprice from zepto;

-- DATA ANALYSIS

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT 
	name, 
    mrp, 
    discountPercent
FROM 
	zepto
ORDER BY 
	discountPercent DESC
LIMIT 
	10;

-- Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT
    name, mrp
FROM
    zepto
WHERE
    outOfStock = "True" AND mrp > 300
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT 
	category,
    SUM(discountedsellingprice * AvailableQuantity) AS Total_Revenue
FROM
	zepto
GROUP BY 
	category
ORDER BY Total_Revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountpercent
FROM 
	zepto
WHERE 
	mrp >= 500 AND discountPercent <10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT 
	category, 
    ROUND(AVG(discountPercent),2) AS AVG_Discount
FROM
	zepto
GROUP BY 
	category
ORDER BY 
	AVG_Discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT 
	DISTINCT name, 
    weightInGms, 
    discountedSellingPrice,
	ROUND(discountedSellingPrice/weightInGms,2) AS Price_Per_Gm
FROM
	zepto
WHERE weightInGms >= 100
ORDER BY Price_Per_Gm DESC;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT
	DISTINCT name,
    weightInGms,
    (CASE 
		WHEN
		weightInGms < 1000 THEN "Low"
		WHEN weightInGms < 5000 THEN "Medium"
		ELSE "Bulk"
		END)AS weight_category
FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT 
    category,
    SUM(weightInGms * availableQuantity) AS total_weight
FROM
    zepto
GROUP BY category
ORDER BY total_weight;


