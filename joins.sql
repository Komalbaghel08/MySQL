create database joins;
use joins;
drop table table2;
create table table1(id int);
create table table2(ids int);
insert into table1(id) values (1),(2),(3),(3),(4),(null),(null);
insert into table2(ids) values (1),(2),(2),(3),(3),(3),(null),(null);
select * from table1;
select * from table2;
select * from table1 inner join table2
on table1.id = table2.id;

select * from table1 left join table2
on table1.id = table2.id;

select * from table1 right join table2
on table1.id = table2.id;
select * from table1 cross join table2;
select * from table1 natural join table2;

use dumy;
select * from customers;
select * from orders;
describe orders;
select * from customers inner join orders
on customers.customernumber = orders.customernumber;

select customername,country,state,status
from customers inner join orders on
customers.customernumber =  orders.customernumber;
select * from customers left join orders
on customers.customernumber = orders.customernumber
where ordernumber is null;