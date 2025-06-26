CREATE TABLE sales (
  InvoiceID VARCHAR(50) PRIMARY KEY,
  Branch TEXT,
  City TEXT,
  CustomerType TEXT,
  Gender TEXT,
  ProductLine TEXT,
  UnitPrice REAL,
  Quantity INTEGER,
  Tax REAL,
  Total REAL,
  Date DATE,
  Time TIME,
  Payment TEXT,
  COGS REAL,
  GrossMarginPct REAL,
  GrossIncome REAL,
  Rating REAL
);
