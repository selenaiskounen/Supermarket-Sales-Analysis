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

-- SALES SEGMENTATION
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

-- Revenue by branch
SELECT d.Branch,
       d.revenue_branch
FROM(
SELECT 
  db.Branch,
  db.total_branch,
  db.tax_branch,
  (db.total_branch + db.tax_branch) AS revenue_branch
FROM (
  SELECT 
    Branch, 
    SUM(Total) AS total_branch,
    SUM(Tax) AS tax_branch
  FROM sales 
  GROUP BY Branch
) AS db) AS d
ORDER BY revenue_branch DESC;




-- PAIEMENT METHODS AND CLIENT BEHAVIOR

-- Which is the most paiement methods used?

SELECT 
      a.Payment,
      a.count_payment
FROM(
   SELECT 
     Payment,
    COUNT(*) AS count_payment
   FROM sales
   GROUP BY Payment
   ORDER BY count_payment DESC
 )AS a
 ORDER BY a.count_payment
 LIMIT 1;


-- Le montant moyen des ventes varit-il selon les modes de paiments

SELECT 
  Payment,
  AVG(Total) AS avg_total_per_payment
FROM sales
GROUP BY Payment
ORDER BY avg_total_per_payment DESC;

-- Is there a link between the product and the rate 

SELECT 
  c.ProductLine,
  c.rate,
  c.nb_sales
FROM (
  SELECT 
    ProductLine, 
    AVG(Rating) AS rate,
    SUM(Quantity) AS nb_sales
  FROM sales 
  GROUP BY ProductLine
) AS c
ORDER BY c.nb_sales DESC;


-- TEMPORAL ANALYSIS

-- Revenue per month

SELECT 
  MONTH(Date) AS months,
  SUM(Total) AS total_revenue
FROM sales
GROUP BY months
ORDER BY total_revenue DESC;

