# relationship Keys
# primary key (unique and not null)
# and foreign key
use cybrom;
create table doctor(doct_id int primary key,
doct_name varchar(40) not null,
doct_city varchar(40) not null default "Bhopal");
select * from doctor;
create table patient(patient_id int primary key,
patient_name varchar(40) not null,
doct_id int,
foreign key(doct_id) references doctor(doct_id));
select * from patient;

insert into doctor(doct_id,doct_name)
values (1,"AA"),(2,"BB"),(3,"CC"),(4,"DD"),(5,"EE");
insert into patient (patient_id,patient_name,doct_id)
values (101,"FF",1),(102,"GG",1),(103,"HH",2),(104,"II",4);

#select * from doctor d join patient p on 
#d.doct_id = p.doct_id where d.doct_id = 1;

select * from doctor where doct_id = 1;

create table doctor1(doct_id int,
doct_name varchar(30),
doct_city varchar(30),
primary key(doct_id,doct_name));
describe doctor1;

select * from doctor;
select * from patient;
alter table doctor add column country varchar(30) not null;
select * from doctor;
alter table doctor add column specialization 
varchar(30) not null after doct_id;
alter table doctor drop column specialization;
select * from doctor;
describe doctor;
alter table doctor modify column doct_name 
varchar(60) not null;
alter table doctor modify column doct_id bigint;
alter table patient modify column doct_id bigint;
alter table patient drop foreign key patient_ibfk_1; 
alter table patient drop key doct_id;
describe patient;
show engines;
alter table patient drop primary key;

#Rename 
# column level 
# Table level 
rename table patient to patient1;
select * from patient1;
alter table patient1 rename column doct_id to doctor_id;

create table patient as select * from patient1;
select * from patient1;
select * from patient;