create database cte;
use cte;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales');



CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    manager_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

INSERT INTO Employees
(emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
(101, 'Amit', 1, NULL, 70000, '2015-01-10'),
(102, 'Riya', 1, 101, 50000, '2018-03-15'),
(103, 'John', 2, NULL, 90000, '2013-05-22'),
(104, 'Sara', 2, 103, 60000, '2019-09-10'),
(105, 'Vijay', 3, NULL, 120000, '2012-12-01'),
(106, 'Neha', 3, 105, 85000, '2017-04-18'),
(107, 'Arjun', 4, NULL, 65000, '2016-02-20'),
(108, 'Meera', 4, 107, 45000, '2020-07-12');

CREATE TABLE Salary_History (
    history_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    salary DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);


INSERT INTO Salary_History
(history_id, emp_id, salary, effective_date)
VALUES
(1, 101, 60000, '2016-01-01'),
(2, 101, 65000, '2017-01-01'),
(3, 101, 70000, '2018-01-01'),
(4, 103, 85000, '2016-01-01'),
(5, 103, 90000, '2018-01-01'),
(6, 106, 75000, '2018-01-01'),
(7, 106, 85000, '2019-01-01');



#Q1. Using a CTE, find employees who earn more than the average salary of their
-- department.

WITH DeptAvg AS (
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
)
SELECT 
    e.emp_id,
    e.emp_name,
    e.dept_id,
    e.salary,
    d.avg_salary
FROM Employees e
JOIN DeptAvg d
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;


#Q2. Create a CTE to list all employees along with their manager’s name.
WITH EmpManager AS (
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id,
        m.emp_name AS manager_name
    FROM Employees e
    LEFT JOIN Employees m
    ON e.manager_id = m.emp_id
)
SELECT * FROM EmpManager;
