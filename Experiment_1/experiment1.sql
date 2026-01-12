CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10,2) CHECK (salary > 0),
    dept_id INT NOT NULL,
    CONSTRAINT fk_department
        FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT fk_project
        FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT');

INSERT INTO employee VALUES
(101, 'Rohit Batra', 50000, 2),
(102, 'Riya Kashyap', 65000, 1);

INSERT INTO project VALUES
(201, 'Employee Portal', 2),
(202, 'Payroll System', 1);

-- Update record
UPDATE employee
SET salary = salary + 5000
WHERE emp_id = 102;

-- Delete record
DELETE FROM project
WHERE project_id = 201;

-- Access Control (Read-Only User)

CREATE ROLE team_leader
WITH LOGIN PASSWORD 'leader@123';

GRANT SELECT ON department TO team_leader;
GRANT SELECT ON employee TO team_leader;
GRANT SELECT ON project TO team_leader;

REVOKE CREATE ON SCHEMA public FROM team_leader;

-- Schema Modification

-- ALTER TABLE
ALTER TABLE employee
ADD COLUMN experience INT;

-- DROP TABLE
DROP TABLE project;

-- VERIFICATION QUERY

SELECT * FROM department;
SELECT * FROM employee;
SELECT CURRENT_USER;


