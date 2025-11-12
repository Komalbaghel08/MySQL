use windowfunction;
CREATE TABLE sales_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep VARCHAR(50),
    region VARCHAR(50),
    product VARCHAR(50),
    month VARCHAR(20),
    sales_amount DECIMAL(10,2)
);



INSERT INTO sales_data (sales_rep, region, product, month, sales_amount) VALUES
('Alice', 'North', 'Laptop', 'Jan', 1200.00),
('Bob', 'South', 'Tablet', 'Jan', 800.00),
('Charlie', 'East', 'Laptop', 'Jan', 950.00),
('David', 'West', 'Phone', 'Jan', 600.00),
('Eva', 'North', 'Tablet', 'Feb', 1100.00),
('Alice', 'North', 'Laptop', 'Feb', 1300.00),
('Bob', 'South', 'Tablet', 'Feb', 850.00),
('Charlie', 'East', 'Laptop', 'Feb', 1000.00),
('David', 'West', 'Phone', 'Feb', 700.00),
('Eva', 'North', 'Tablet', 'Mar', 1200.00),
('Alice', 'North', 'Laptop', 'Mar', 1250.00),
('Bob', 'South', 'Tablet', 'Mar', 900.00),
('Charlie', 'East', 'Laptop', 'Mar', 1050.00),
('David', 'West', 'Phone', 'Mar', 650.00),
('Eva', 'North', 'Tablet', 'Apr', 1150.00),
('Alice', 'North', 'Laptop', 'Apr', 1400.00),
('Bob', 'South', 'Tablet', 'Apr', 950.00),
('Charlie', 'East', 'Laptop', 'Apr', 1100.00),
('David', 'West', 'Phone', 'Apr', 800.00),
('Eva', 'North', 'Tablet', 'May', 1180.00),
('Alice', 'North', 'Laptop', 'May', 1350.00);

#Q1  1. Rank sales reps by their total sales within each month.
-- (Use RANK() function with PARTITION BY month)

SELECT 
    month,
    sales_rep,
    SUM(sales_amount) AS total_sales,
    RANK() OVER (PARTITION BY month ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM 
    sales_data
GROUP BY 
    month, sales_rep
ORDER BY 
    month, sales_rank;

#Q2 Show the cumulative (running) total of sales for each sales rep across months.
-- (Use SUM() as a window function ordered by month)

SELECT sales_rep,month,
    SUM(sales_amount) AS monthly_sales,
    SUM(SUM(sales_amount)) OVER (PARTITION BY sales_rep ORDER BY 
    FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
    ) AS cumulative_sales
FROM sales_data
GROUP BY sales_rep, month
ORDER BY sales_rep,
FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');


#Q3 Find the average monthly sales amount for each region.
-- (Use AVG() with PARTITION BY region)

SELECT *,
    AVG(sales_amount) AS monthly_avg_sales,
    AVG(AVG(sales_amount)) OVER (PARTITION BY region) AS region_avg_sales
FROM 
    sales_data
GROUP BY 
    region, month
ORDER BY 
    region,
    FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr', 'May');


#Q4 Compare each month’s sales amount with the previous month's sales for each sales rep.
-- (Use LAG() window function)
select *,
lag(Sales_amount) over(partition by sales_rep)
as lag_devision
from sales_data;

#Q5 Find the sales amount of the next month for each sales rep
SELECT 
    *,
    LEAD(sales_amount) OVER (PARTITION BY sales_rep ORDER BY FIELD(month,'Jan','Feb','Mar','Apr','May')) AS next_month_sales
FROM 
    sales_data;
    
    

#Q6 Find percentage of total regional sales contributed by each record
SELECT *,(sales_amount * 100.0 / SUM(sales_amount) OVER (PARTITION BY region)) AS percent_contribution
FROM sales_data;


#Q7 Find highest monthly sales amount per sales rep
SELECT *,MAX(sales_amount) OVER (PARTITION BY sales_rep) AS highest_monthly_sales
FROM sales_data;


#Q8 Check if sales increased compared to previous month

SELECT 
    *,
    LAG(sales_amount) OVER (PARTITION BY sales_rep ORDER BY FIELD(month,'Jan','Feb','Mar','Apr','May')) AS prev_sales,
    CASE 
        WHEN sales_amount > LAG(sales_amount) OVER (PARTITION BY sales_rep ORDER BY FIELD(month,'Jan','Feb','Mar','Apr','May')) 
        THEN 'Increased'
        WHEN sales_amount < LAG(sales_amount) OVER (PARTITION BY sales_rep ORDER BY FIELD(month,'Jan','Feb','Mar','Apr','May')) 
        THEN 'Decreased'
        ELSE 'Same'
    END AS sales_trend
FROM sales_data; 


#Q9 Assign row number to each sales rep within region and month
SELECT *,ROW_NUMBER() OVER (PARTITION BY region, month ORDER BY sales_amount DESC) AS row_num
FROM sales_data;

#Q10 Compare each record’s sales with avg sales of same region & month
SELECT *,AVG(sales_amount) OVER (PARTITION BY region, month) AS avg_sales,
    sales_amount - AVG(sales_amount) OVER (PARTITION BY region, month) AS diff_from_avg
FROM sales_data;