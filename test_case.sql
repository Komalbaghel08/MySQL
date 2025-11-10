CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Dept VARCHAR(50),
    Experience INT
);

INSERT INTO Employees (Emp_ID, Emp_Name, Salary, Dept, Experience) VALUES
(1, 'Alice', 60000, 'HR', 5),
(2, 'Bob', 85000, 'IT', 10),
(3, 'Charlie', 40000, 'Finance', 3),
(4, 'David', 75000, 'IT', 8),
(5, 'Emma', 30000, 'Finance', 2);
select *,
case when salary <= 30000 then "low_salary"
when salary between 31000 and 50000 then "mediun_salary"
else "high_salary"
end as salary_devision from employees;

-- Q2
SELECT *,
    CASE 
        WHEN Experience <= 3 THEN 'Beginner'
        WHEN Experience BETWEEN 4 AND 7 THEN 'Intermediate'
        WHEN Experience >= 8 THEN 'Expert'
        ELSE 'Unknown'
    END AS Performance_Level
FROM Employees;

-- Q3
SELECT *,
    CASE 
        WHEN Dept = 'HR' THEN 'Human Resources'
        WHEN Dept = 'IT' THEN 'Information Technology'
        WHEN Dept = 'Finance' THEN 'Financial Services'
        ELSE 'Other'
    END AS Full_Dept_Name
FROM Employees;

-- Q4
SELECT *,
    CASE
        WHEN Salary > 80000 THEN Salary * 0.15
        WHEN Salary BETWEEN 50000 AND 80000 THEN Salary * 0.10
        WHEN Salary < 50000 THEN Salary * 0.05
        ELSE 0
    END AS Bonus_Amount
FROM Employees; 

-- Q5. Determine Tax Brackets
SELECT*,
    CASE
        WHEN Salary <= 30000 THEN 'No Tax'
        WHEN Salary BETWEEN 30001 AND 50000 THEN '5% Tax Bracket'
        WHEN Salary BETWEEN 50001 AND 80000 THEN '10% Tax Bracket'
        WHEN Salary > 80000 THEN '15% Tax Bracket'
        ELSE 'Unknown'
    END AS Tax_Bracket
FROM Employees;

--  6. Identify Employees with No Department  Question: Show "Department Not Assigned" if the department is NULL.
SELECT *,
    CASE
        WHEN Dept IS NULL THEN 'Department Not Assigned'
        ELSE Dept
    END AS Department_Status
FROM Employees;

-- Q 7

