create database Student;
use Student;
show databases;
use Student;
create table info(id int, name varchar(244), city char(22),roll_no float(5,2));
select * from info;
select id,roll_no from info;
insert into info (id,name,city,roll_no) values(1,"KOMAL","BHOPAL",321);
select * from info;

#unique
create table info2(id int unique not null, name varchar(244), city char(22),roll_no float(5,2));
insert into info2 (id,name,city,roll_no) values(1,"KOMAL","BHOPAL",321);
select * from info1;
 