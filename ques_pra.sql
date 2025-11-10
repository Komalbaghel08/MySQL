create database companyy;
use companyy;
create table employee (id int,name varchar(100),salary int ,department varchar(50),city varchar(50));
insert into employee (id,name,salary,department,city) values (1,"komal",2200,'cse',"bhopal"),(2,'ayush',40000,'ec',"indore"),
(3,"kana",2200,'civil',"jabalpur"),
(4,"karnika",2000,'bca',"rewa"),(5,"mahak",2210,'mca',"rewa"),(6,"pawani",2200,'AIML',"rewa"),
(7,"sankalp",2300,'IT',"bpl"),(8,"ayushi",2800,'cse',"bhopal"),
(9,"maharshi",2900,'ex',"indore")
,(10,"suhani",23100,'python',"rewa");
select * from employee ;

-- q4- find out the 4th highest salary
select distinct salary 
from employee 
order by salary desc
limit 3,1;

-- Q department wise total salary
-- Q find out how many employee are from bhopal
select name ,salary *1.5 from employee;

--  3rd lowest salary  in department wise 
select salary from employee;

