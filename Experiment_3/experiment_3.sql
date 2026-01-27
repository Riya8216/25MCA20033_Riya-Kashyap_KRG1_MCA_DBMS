-- Step 0
-- Create table for schema violations
CREATE TABLE schema_violations (
    schema_id SERIAL PRIMARY KEY,
    schema_name VARCHAR(50),
    violation_count INT
);

-- Insert sample data
INSERT INTO schema_violations (schema_name, violation_count) VALUES
('HR_SCHEMA', 0),
('FIN_SCHEMA', 2),
('SALES_SCHEMA', 5),
('PAYROLL_SCHEMA', 9),
('AUDIT_SCHEMA', 15);

--step 1
SELECT 
    schema_name,
    violation_count,
    CASE
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 3 THEN 'Minor Violation'
        WHEN violation_count BETWEEN 4 AND 7 THEN 'Moderate Violation'
        ELSE 'Critical Violation'
    END AS violation_status
FROM schema_violations;

-- Step 2
-- Add new column
ALTER TABLE schema_violations
ADD COLUMN approval_status VARCHAR(20);

-- Update using CASE
UPDATE schema_violations
SET approval_status = CASE
    WHEN violation_count = 0 THEN 'Approved'
    WHEN violation_count BETWEEN 1 AND 5 THEN 'Needs Review'
    ELSE 'Rejected'
END;


SELECT * FROM schema_violations;

-- Step 3
DO $$
DECLARE
    v_count INT := 6;
BEGIN
    IF v_count = 0 THEN
        RAISE NOTICE 'No violations detected.';
    ELSIF v_count BETWEEN 1 AND 5 THEN
        RAISE NOTICE 'Minor issues found. Review needed.';
    ELSIF v_count BETWEEN 6 AND 10 THEN
        RAISE NOTICE 'Moderate violations detected.';
    ELSE
        RAISE NOTICE 'Critical violations! Immediate action required.';
    END IF;
END $$;


-- Step 4
-- Create student table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);
 
-- Insert data
INSERT INTO students (student_name, marks) VALUES
('Riya', 92),
('Aman', 78),
('Neha', 65),
('Rahul', 48),
('Pooja', 34);


SELECT 
    student_name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 75 THEN 'B'
        WHEN marks >= 60 THEN 'C'
        WHEN marks >= 40 THEN 'D'
        ELSE 'Fail'
    END AS grade
FROM students;

-- Step 5
SELECT 
    schema_name,
    violation_count,
    approval_status
FROM schema_violations
ORDER BY 
    CASE
        WHEN violation_count = 0 THEN 1
        WHEN violation_count BETWEEN 1 AND 3 THEN 2
        WHEN violation_count BETWEEN 4 AND 7 THEN 3
        ELSE 4
    END;





