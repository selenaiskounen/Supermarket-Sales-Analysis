LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supermarket_sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
