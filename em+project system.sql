CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    hours_worked INT
);
SELECT name
FROM Employees
WHERE emp_id NOT IN (
    SELECT emp_id FROM Projects
);
SELECT e.name, SUM(p.hours_worked) AS total_hours
FROM Employees e
JOIN Projects p ON e.emp_id = p.emp_id
GROUP BY e.name
HAVING SUM(p.hours_worked) > 100;
SELECT name, department, salary
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) rnk
    FROM Employees
) t
WHERE rnk = 1;
SELECT project_name
FROM Projects
WHERE emp_id IS NULL;
SELECT e.name, SUM(p.hours_worked) AS total_hours
FROM Employees e
JOIN Projects p ON e.emp_id = p.emp_id
GROUP BY e.name
ORDER BY total_hours DESC
LIMIT 1;
SELECT name, department, salary
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE department = e.department
);