 # 1.What is the total sales revenue?
select
round(sum(Revenue),2) as total_revenue
from retail_transactions;

# 2.How many transactions are there?
select
count(distinct InvoiceNo) as total_invoices
from retail_transactions;

# 3.How many unique customers are recorded?
select
count(distinct CustomerID) as total_customers
from retail_transactions
where CustomerID is not null;

# 4.Which countries generate the most revenue?
select
Country,
round(sum(Revenue),2) as total_revenue
from retail_transactions
group by Country
order by total_revenue desc
limit 10;

# 5.Which products generate the most revenue?
select
StockCode,
max(Description) as ProductName,
round(sum(Revenue),2) as total_revenue
from retail_transactions
group by StockCode
order by total_revenue desc
limit 10;

# 6. Which products sell the most units?
select
StockCode,
max(Description) as ProductName,
sum(Quantity) as total_units_sold
from retail_transactions
group by StockCode
order by total_units_sold desc
limit 10;

# 7. What are the monthly revenue trends?
select 
YearMonth,
round(sum(Revenue),2) as monthly_revenue
from retail_transactions
group by YearMonth
order by YearMonth;

# 8. Which customers spend the most?
select
CustomerID,
round(sum(Revenue),2) as customer_revenue,
count(distinct InvoiceNo) as total_orders
from retail_transactions
where CustomerID is not null
group by CustomerID
order by customer_revenue desc
limit 10;

# 9. What is the average invoice value?
select
round(avg(invoice_total),2) as average_invoice_value
from(
select
InvoiceNo,
sum(Revenue) as invoice_total
from retail_transactions
group by InvoiceNo
)as invoice_summary;

# 10. Which days of the week have the highest revenue?
select
DayofWeek,
round(sum(Revenue),2) as total_revenue
from retail_transactions
group by DayofWeek
order by Total_revenue desc;

# 11. Which hours have the highest revenue?
select
Hour,
round(sum(Revenue),2) as total_revenue
from retail_transactions
group by Hour 
order by total_revenue desc;
 
 
# 12. Which customers have purchased more than once?
select
CustomerID,
count(distinct InvoiceNo) as order_count,
round(sum(Revenue),2) as total_revenue
from retail_transactions
where CustomerID is not null
group by CustomerID
having count(distinct InvoiceNo) >1
order by order_count desc,total_revenue desc;



