# -----SUB QUERY QUESTIONS------------- 

-- q1
SELECT *
FROM customers
WHERE creditLimit > (
    SELECT AVG(creditLimit)
    FROM customers
);

-- q2
SELECT *
FROM customers
WHERE creditLimit = (
        SELECT MAX(creditLimit)
        FROM customers
      );

-- q3
select *
from customers
where customerNumber in(
       select customerNumber
        from orders
      ); 
   
-- q4
select *
from customers
where customernumber not in (
        select customernumber
        from payments
      );  
   
-- q5
select *
from customers
where creditlimit > any (
        select creditlimit
        from customers
        where country = 'new york'
      );


-- q6 