# 👨‍🎓 Student Details
Name:Riya Kashyap

UID: 25MCA20033

Branch: MCA
 
Semester: 2nd

Section/Group: 1/A

Subject: Technical Training

Date of Performance: 31/03/2026

# 🎯 Aim of the Project
To implement and analyze different types of SQL joins in PostgreSQL including INNER JOIN, LEFT JOIN, RIGHT JOIN, SELF JOIN, FULL JOIN, and CROSS JOIN.

# 🎯 Objective of the Project
To understand and apply various join operations on a relational database schema consisting of Students, Courses, Enrollments, and Departments tables to extract meaningful information.

# 💻 Tools Used
- PostgreSQL
- pgAdmin (for query execution)

# 🛠️ Theory
In relational databases, data is often stored in multiple tables to maintain normalization. SQL joins are used to combine these tables based on related columns.

Different types of joins include:

- INNER JOIN: Returns only matching records from both tables.
- LEFT JOIN: Returns all records from the left table and matched records from the right table; otherwise NULL.
- RIGHT JOIN: Returns all records from the right table and matched records from the left table; otherwise NULL.
- FULL JOIN: Combines results of both LEFT and RIGHT joins, showing all records with NULLs where no match exists.
- CROSS JOIN: Produces all possible combinations (Cartesian product) of rows.
- SELF JOIN: A table joined with itself to compare rows within the same table.

These joins help in efficient querying, minimizing redundancy, and extracting related data.

# 🛠️ Practical / Experiment Steps
## Step 0: Table Creation
    CREATE TABLE students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        dept_id INT
    );

    CREATE TABLE courses (
        course_id INT PRIMARY KEY,
        course_title VARCHAR(50)
    );

    CREATE TABLE enrollments (
        student_id INT,
        course_id INT,
        PRIMARY KEY (student_id, course_id)
    );

    CREATE TABLE departments (
        dept_id INT PRIMARY KEY,
        dept_name VARCHAR(50)
    );

## Step 1: Insert Sample Data
        -- Students
        INSERT INTO students VALUES
        (101, 'Aman', 1),
        
        (102, 'Riya', 2),
        
        (103, 'Rahul', 3),
        
        (104, 'Sneha', 4),
        
        (105, 'Arjun', 1);

        -- Courses
        INSERT INTO courses VALUES
        (201, 'Database Systems'),
        
        (202, 'Cloud Computing'),
        
        (203, 'Artificial Intelligence'),
        
        (204, 'Computer Networks');

        -- Enrollments
        INSERT INTO enrollments VALUES
        (101, 201),
        
        (101, 202),
        
        (102, 203),
        
        (103, 201),
        
        (104, 204);

        -- Departments
        INSERT INTO departments VALUES
        (1, 'Oracle'),
        
        (2, 'SAP'),
        
        (3, 'IBM'),
        
        (4, 'Microsoft');

## Step 2: INNER JOIN
        SELECT s.student_id, s.student_name, c.course_title
        
        FROM students s
        
        INNER JOIN enrollments e ON s.student_id = e.student_id
        
        INNER JOIN courses c ON e.course_id = c.course_id;
        
<img width="532" height="210" alt="image" src="https://github.com/user-attachments/assets/3fd252bf-585e-4fdd-a2c1-f5680387bd99" />



## Step 3: LEFT JOIN
        SELECT s.student_id, s.student_name
        
        FROM students s
       
        LEFT JOIN enrollments e ON s.student_id = e.student_id
       
        WHERE e.student_id IS NULL;
<img width="384" height="112" alt="image" src="https://github.com/user-attachments/assets/72482eab-d7aa-4b10-b0da-a75aa7ee5560" />
        

## Step 4: RIGHT JOIN
        SELECT s.student_name, c.course_title 
        
        FROM enrollments e
        
        RIGHT JOIN courses c ON e.course_id = c.course_id
        
        LEFT JOIN students s ON e.student_id = s.student_id;
<img width="451" height="221" alt="image" src="https://github.com/user-attachments/assets/b46ba4a0-3c77-4184-bf36-f1374ac9f726" />

## Step 5: Join wth departments
        SELECT s.student_id, s.student_name, d.dept_name
        
        FROM students s
        
        JOIN departments d ON s.dept_id = d.dept_id;
<img width="565" height="226" alt="image" src="https://github.com/user-attachments/assets/6c9d0176-7cd4-4384-a296-0c55ed9a9252" />

## Step 6: CROSS JOIN
        SELECT s.student_name, c.course_title
    
        FROM students s
    
        CROSS JOIN courses c;
<img width="427" height="518" alt="image" src="https://github.com/user-attachments/assets/7de0d051-e18e-47ec-b723-46c50d4d4fe1" />
<img width="428" height="158" alt="image" src="https://github.com/user-attachments/assets/ba56f5e8-3b9f-4cba-a497-f39f8faa7097" />
        
## Step 7: FULL JOIN
        SELECT s.student_name, c.course_title
        
        FROM students s
        
        FULL JOIN enrollments e ON s.student_id = e.student_id
        
        FULL JOIN courses c ON e.course_id = c.course_id;
<img width="413" height="236" alt="image" src="https://github.com/user-attachments/assets/5269753f-8fc6-4b04-88c3-94b6bdf8bdd2" />
              
# 📘 Learning Outcomes
- Gained practical understanding of SQL joins and their real-world applications.
- Learned to retrieve and combine data from multiple related tables.
- Understood differences between INNER, LEFT, RIGHT, FULL, and CROSS joins.
- Developed ability to write efficient queries for data analysis.
- Improved hands-on experience with PostgreSQL.      
        
