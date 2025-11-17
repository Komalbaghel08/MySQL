# ------------cte-----------

use dumy;
with cust_info as(
select * from customers where country = "USA")
select contactfirstname,contactlastname from cust_info;
