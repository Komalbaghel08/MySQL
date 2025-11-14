create database windowfunction;
use windowfunction;
CREATE TABLE IF NOT EXISTS sales1(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);
 
INSERT INTO sales1(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
      select * from sales1;
	# Analytical function 
      select *,
      sum(sale) over(partition by sales_employee) as emp_part from sales1;
      
      select *,
      sum(sale) over(partition by fiscal_year) as year_part from sales1;
      
      #rank-- it works on row basis 
select *,
rank() over(partition by fiscal_year order by sale desc) as rnk from sales1;

-- dense_rank -- it works on actual ranking based allocation
select *, 
dense_rank() over(partition by fiscal_year order by sale desc)
as drnk from sales1;

#lead -- it compare the current rows to the nexr rows
select *,
lead(sale) over(partition by fiscal_year order by sale desc)
as lead_sale from sales1;

#lag
select *,
lag(sale) over(partition by fiscal_year order by sale desc)
as lag_sale from sales1;

#Row number-- by row aik aik number dega strting from 1
select *,
sum(sale) over(partition by fiscal_year order by sale desc) sum_sale,
max(sale) over(partition by fiscal_year order by sale desc) max_sale,
min(sale) over(partition by fiscal_year order by sale desc) min_sale,
avg(sale) over(partition by fiscal_year order by sale desc) avg_sale,
rank() over(partition by fiscal_year order by sale desc) as rnk,
dense_rank() over(partition by fiscal_year order by sale desc) as drnk,
lead(sale) over(partition by fiscal_year order by sale desc) as lead_sale,
lag(sale) over(partition by fiscal_year order by sale desc) as lag_sale,
row_number() over(partition by fiscal_year order by sale desc) as rownumber
from sales1;