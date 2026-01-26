# 🎯 Aim of the Project

The aim of this project is to design and implement a relational database system using SQL by creating multiple tables with appropriate constraints, performing data manipulation operations, managing access control through roles, and modifying the database schema to ensure data integrity and security.

# 🎯 Objective of the Project

The objectives of this project are:

- To understand the creation of relational database tables using SQL.

- To apply primary key, foreign key, unique, and check constraints.

- To perform data manipulation operations such as INSERT, UPDATE, and DELETE.

- To implement role-based access control in a database system.

- To modify and manage database schema using ALTER and DROP commands.

# 🛠️ Practical / Experiment Steps

1. Design relational database tables with appropriate attributes.

2. Apply constraints such as PRIMARY KEY, FOREIGN KEY, UNIQUE, and CHECK.

3. Insert sample records into tables.

4. Perform UPDATE and DELETE operations on records.

5. Create database roles for access control.

6. Grant and revoke permissions to users.

7. Modify table structure using ALTER command.

# 🧪 Procedure of the Practical


## TABLE CREATION

CREATE TABLE department (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employee (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(20) NOT NULL,
    salary   NUMERIC(10,2) CHECK (salary > 0),
    dept_id  INT NOT NULL,
    CONSTRAINT fk_department
        FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);

CREATE TABLE project (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    dept_id      INT NOT NULL,
    CONSTRAINT fk_project
        FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);

## DATA INSERTION

INSERT INTO department VALUES
    (1, 'HR'),
    (2, 'IT');

INSERT INTO employee VALUES
    (101, 'Rohit Batra', 50000, 2),
    (102, 'Riya Kashyap', 65000, 1);

INSERT INTO project VALUES
    (201, 'Employee Portal', 2),
    (202, 'Payroll System', 1);

## UPDATE OPERATION

UPDATE employee

SET salary = salary + 5000

WHERE emp_id = 102;

## DELETE OPERATION

DELETE FROM project

WHERE project_id = 201;

## ACCESS CONTROL (ROLE MANAGEMENT)

CREATE ROLE team_leader

WITH LOGIN PASSWORD 'leader@123';

GRANT SELECT ON department TO team_leader;

GRANT SELECT ON employee TO team_leader;

GRANT SELECT ON project TO team_leader;

REVOKE CREATE ON SCHEMA public FROM team_leader;

## SCHEMA MODIFICATION

## Add new column

ALTER TABLE employee

ADD COLUMN experience INT;

## Drop table

DROP TABLE project;

## VERIFICATION QUERIES

SELECT * FROM department;

SELECT * FROM employee;

SELECT CURRENT_USER;

# 📊 I/O Analysis (Input / Output Analysis)

  <img width="650" height="230" alt="image" src="https://github.com/user-attachments/assets/76bda471-96c4-44fd-98da-2b58ee9904c0" />

  <img width="700" height="141" alt="image" src="https://github.com/user-attachments/assets/e72a4476-9448-47df-8286-34c8602ea524" />

  <img width="563" height="232" alt="image" src="https://github.com/user-attachments/assets/8645c52c-4203-46ff-82a2-bf3066a67cc6" />

# 📚 Learning Outcome

After completing this practical, I has gained:

- Understanding of relational database design.

- Knowledge of SQL constraints and table relationships.

- Practical experience in data manipulation operations.

- Hands-on exposure to role-based access control.

- Ability to modify and manage database schema.  

  


