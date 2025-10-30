# constraints
create database cybrom;
use cybrom;
use sakila;
show databases;
use cybrom;
# creation header / datatype
create table info(id int ,name varchar(255),
city char(255),salary decimal(5,2),
curr_date date );
select * from info;
select id , city from info;
insert into info (id,name,city,salary,curr_date)
values(1,"komal","bhopal",200,"2025-10-07"),
(2,"kanak","jabalpur",300,"2026-11-05");
select * from info;
# header datatype constraints
# unique
# not null
# check
# deafult
use cybrom;
# unique
create table info1(id int unique,name varchar(40));
# insert into info1(id,name) values (1,"AA"),(1,"BB");
insert into info1(id,name) values (1,"AA"),(2,"BB");
insert into info1(id,name) values(null,"CC");
insert into info1(id,name) values(null,"AA");
select * from info1;

# not null
create table info2(id int unique not null,name varchar(40) not null);
insert into info2(id,name) values (1,"AA"),(2,"BB");
select * from info2;

# check
create table info3(id int unique not null,name varchar(40),age int not null
check (age>18));
# insert into info3(id,name,age) values (1,"AA",14);
insert into info3(id,name,age) values (1,"AA",20);
select * from info3;

create table info4(id int not null unique, name varchar(40) not null,
age int check(age>18), city varchar(40) not null default "Bhopal");

# insert into info4(id,name,age,city) values (1,"AA",20,"");
# insert into info4(id,name,age,city) values (1,"AA",20,)
# insert into info4(id,name,age,city) values (1,"AA",20,null);
insert into info4(id,name,age,city) values (2,"AA",20,"Indore");
select * from info4;

insert into info4(id,name,age) values (1,"AA",24);
select * from info4;