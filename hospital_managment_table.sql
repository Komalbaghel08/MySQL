create database hospital_management;
use hospital_management;

create table departments(department_id int primary key auto_increment, department_name varchar(30) not null);

create table doctors (doctor_id int primary key auto_increment, name varchar(30) not null, specialization varchar(100), phone varchar(15) , department_id int,
foreign key(department_id) references departments(department_id));

create table patients(patient_id int primary key auto_increment, name varchar(30) not null, age int, gender varchar(10), phone varchar(15), address varchar(30));

create table appointments (appointment_id int primary key auto_increment, doctor_id int,patient_id int,appointment_date date, status varchar(20),
foreign key (doctor_id) references doctors(doctor_id),
foreign key (patient_id) references patients(patient_id));

create table billing(bill_id int primary key auto_increment, patient_id int, total_amount decimal(10,2), payment_status varchar(20),
foreign key (patient_id) references patients(patient_id));