# Online_Retail_Data_Analysis
# Online Retail Data Analysis

I built this project to practice the full loop of a small data job: take a messy real-world sales dataset, clean it in Python, load it into MySQL, and then answer business questions with SQL and some charts.

The data is the well-known **Online Retail** dataset: transactions from a UK-based online gift shop, from **1 Dec 2010 to 9 Dec 2011**.

## What's in this folder

| File | What it is |
|---|---|
| `Online_Retail.xlsx` | The raw data (541,909 rows, 8 columns) |
| `Untitled.ipynb` | Jupyter notebook: cleaning, loading into MySQL, EDA and charts |
| `online_retail_cleaned.csv` | The cleaned dataset the notebook produces (524,878 rows, 16 columns) |
| `01_create_database_and_table.sql` | Creates the database and the `retail_transactions` table |
| `02_business_analysis.sql` | 12 SQL queries answering the business questions |

## Tools used

- Python (pandas, numpy, matplotlib, seaborn)
- SQLAlchemy + PyMySQL to push the data into MySQL
- MySQL for the analysis queries

## How I cleaned the data

All of this happens in the notebook:

1. Loaded the Excel file (541,909 rows).
2. Found and dropped 5,268 exact duplicate rows.
3. Filled missing product descriptions with "unknown product".
4. Kept the missing `CustomerID`s (about 135k rows) as nulls instead of deleting them. Those are still real sales, so they count toward revenue, but they're left out of customer-level questions.
5. Removed cancellation invoices (InvoiceNo starting with "C"), and rows with zero or negative quantity or price.
6. Fixed data types (dates, numbers, nullable integer for CustomerID).
7. Added a `Revenue` column (`Quantity * UnitPrice`) and some date features: year, month, month name, year-month, day, day of week and hour.

After cleaning I was left with **524,878 rows**.

## How to run it

1. Run `01_create_database_and_table.sql` in MySQL to create the database and table.
2. Open the notebook and update the file paths and MySQL credentials in the connection cell (mine point to a local `C:\Online_Retail_Data_Analysis` folder and a local MySQL server, so yours will need changing).
3. Run the notebook top to bottom. It cleans the data, saves the CSV, and loads everything into `retail_transactions`.
4. Run the queries in `02_business_analysis.sql`.

Note: the credentials in the notebook are just my local test setup. If you fork this, use your own and don't commit real passwords.

## Business questions answered in SQL

1. Total sales revenue
2. Number of transactions (invoices)
3. Number of unique customers
4. Top countries by revenue
5. Top products by revenue
6. Top products by units sold
7. Monthly revenue trend
8. Highest-spending customers
9. Average invoice value
10. Revenue by day of the week
11. Revenue by hour of the day
12. Customers who bought more than once

## Key numbers

| Metric | Value |
|---|---|
| Total revenue | 10,642,110.80 |
| Invoices | 19,960 |
| Identified customers | 4,338 |
| Unique products | 3,922 |
| Countries | 38 |
| Average invoice value | 533.17 |
| Repeat customers | 2,845 (65.58%) |

A few things that stood out:

- The **United Kingdom** is by far the biggest market, with about 9.0M in revenue, which is roughly 85% of the total.
- **November 2011** was the best month, with about 1.50M in revenue.
- The best-selling product by units was "PAPER CRAFT , LITTLE BIRDIE" at 80,995 units. That looks like one giant one-off order, so I wouldn't read too much into it.
- Around two thirds of identified customers came back and ordered more than once.

## Checking my work

I ran the same total revenue and invoice count in both Python and MySQL, and they match exactly (10,642,110.80 and 19,960), so the load into the database didn't lose anything.

## Charts

The notebook saves these to an `outputs` folder:

- Monthly revenue line chart
- Top 10 countries by revenue
- Top 10 products by revenue
- Revenue by day of the week
- Revenue by hour of the day

## Things I'd do differently or add next

- Cancelled orders are removed entirely. A follow-up could look at returns on their own to see which products get sent back most.
- Customer segmentation (RFM) would be a natural next step, since the repeat-customer numbers look interesting.
- A dashboard in Power BI or Tableau on top of the MySQL table.

## Data source

Online Retail dataset from the UCI Machine Learning Repository (Chen, D., 2015).
