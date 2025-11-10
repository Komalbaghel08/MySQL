use hospital_management;

select * from departments;
insert into departments(department_name) value ('Cardiology'), ('Neurology'), ('Orthopedics');

select * from doctors;
insert into doctors(name, specialization,phone,department_id) 
value ('Dr. Sharma', 'Cardiologist', '9999999999', 1), ('Dr. Mehta', 'Neurologist', '8888888888', 2);

select * from patients;
insert into patients(name,age,gender,phone,address) 
value ('Rohit Singh', 35, 'Male', '7777777777', 'Bhopal'), ('Sneha Patel', 28, 'Female', '6666666666', 'Indore');

select * from appointments;
insert into appointments(doctor_id,patient_id,appointment_date,status)
value (1, 1, '2025-11-05', 'Completed'), (2, 2, '2025-11-06', 'Scheduled');

select * from billing;
insert into billing(patient_id,total_amount,payment_status) 
value (1, 2500.00, 'Paid'), (2, 1200.00, 'Pending');