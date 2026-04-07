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

--Step1
SELECT s.student_id, s.student_name, c.course_title
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

--Step2
SELECT s.student_id, s.student_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

--Step3
SELECT s.student_name, c.course_title
FROM enrollments e
RIGHT JOIN courses c ON e.course_id = c.course_id
LEFT JOIN students s ON e.student_id = s.student_id;

--Step4
SELECT s.student_id, s.student_name, d.dept_name
FROM students s
JOIN departments d ON s.dept_id = d.dept_id;

--Step5
SELECT s.student_name, c.course_title
FROM students s
CROSS JOIN courses c;

--Step6
SELECT s.student_name, c.course_title
FROM students s
FULL JOIN enrollments e ON s.student_id = e.student_id
FULL JOIN courses c ON e.course_id = c.course_id;



