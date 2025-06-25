-- GLOBAL QUESTIONS
-- REVENUE HT
SELECT SUM(TOTAL) AS Revenue_HT 
FROM sales  -- 337614.46

-- REVENUE TTC
SELECT SUM(Total + Tax) AS Revenue_TTC
FROM sales -- 352993.83

-- BENEFICE HT
SELECT SUM(Total + (-1 * Cogs)) AS Revenue_TTC
FROM sales  -- 30027.08

-- Number of transactions
SELECT COUNT(DISTINCT(InvoiceID)) AS nb_transactions
FROM sales --1000

-- Average spend
SELECT AVG(Selling_price_per_unit) AS avg_depense
FROM sales  -- 61.11

-- SEGMENTATION OF SALES
-- City which generate the highest revenue

SELECT d.City,
       d.revenue_city 
FROM(
SELECT 
  db.City,
  db.total_city,
  db.tax_city,
  (db.total_city + db.tax_city) AS revenue_city
FROM (
  SELECT 
    City, 
    SUM(Total) AS total_city,
    SUM(Tax) AS tax_city
  FROM sales 
  GROUP BY City
) AS db) AS d
ORDER BY revenue_city DESC;

-- Which gender spend most 

SELECT d.Gender,
       d.revenue_gender
FROM(
SELECT 
  db.Gender,
  db.total_gender,
  db.tax_gender,
  (db.total_gender + db.tax_gender) AS revenue_gender
FROM (
  SELECT 
    Gender, 
    SUM(Total) AS total_gender,
    SUM(Tax) AS tax_gender
  FROM sales 
  GROUP BY Gender
) AS db) AS d
ORDER BY revenue_gender DESC;

-- Number of sales by product

SELECT ProductLine, 
      SUM(Quantity) AS nb_sales
FROM sales 
GROUP BY ProductLine
ORDER BY SUM(QUANTITY) DESC

-- TOP product sold
SELECT 
  c.ProductLine,
  c.nb_sales
FROM (
  SELECT 
    ProductLine, 
    SUM(Quantity) AS nb_sales
  FROM sales 
  GROUP BY ProductLine
) AS c
ORDER BY c.nb_sales DESC
LIMIT 1;

-- Paiement methods 
SELECT 
  Payment,
  COUNT(*) AS count_payment
FROM sales
GROUP BY Payment
ORDER BY count_payment DESC;



