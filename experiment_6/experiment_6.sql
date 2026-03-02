-- Step0- Creation of Tables and Insertion of Data
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC,
    status VARCHAR(20),
    dept_id INT REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_name)
VALUES ('HR'), ('IT'), ('Finance');

INSERT INTO employees (emp_name, salary, status, dept_id)
VALUES
('Riya', 50000, 'Active', 1),
('Aman', 60000, 'Inactive', 2),
('Karan', 70000, 'Active', 2),
('Neha', 55000, 'Active', 3);

--Step 1- Creating a Simple View (Data Filtering)

CREATE VIEW ActiveEmployees AS
SELECT emp_id, emp_name, salary, dept_id
FROM employees
WHERE status = 'Active';

SELECT * FROM ActiveEmployees;

--Step 2- Creating a View for Joining Multiple Tables

CREATE VIEW EmployeeDepartmentView AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM EmployeeDepartmentView;


--Step 3-Creating an Advanced Summarization View

CREATE VIEW DepartmentStats AS
SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT * FROM DepartmentStats;
