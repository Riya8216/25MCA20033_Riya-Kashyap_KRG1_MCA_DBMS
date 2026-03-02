--STEP 0->Create employee table

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC,
    experience INT,
    performance_score INT
);

INSERT INTO employee (emp_name, salary, experience, performance_score)
VALUES
('Aman', 30000, 2, 3),
('Riya', 40000, 5, 4),
('Karan', 50000, 8, 5);

-- Step 1: Simple Forward-Only Cursor

DO $$
DECLARE
    emp_record RECORD;
    emp_cursor CURSOR FOR
        SELECT emp_id, emp_name, salary FROM employee;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'ID: %, Name: %, Salary: %',
            emp_record.emp_id,
            emp_record.emp_name,
            emp_record.salary;
    END LOOP;

    CLOSE emp_cursor;
END $$;

-- Step 2: Complex Row-by-Row Manipulation

DO $$
DECLARE
    emp_record RECORD;
    emp_cursor CURSOR FOR
        SELECT emp_id, emp_name, salary, experience, performance_score
        FROM employee
        FOR UPDATE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Before Update -> ID: %, Salary: %',
            emp_record.emp_id,
            emp_record.salary;

        IF (emp_record.experience * emp_record.performance_score) > 30 THEN
            UPDATE employee
            SET salary = salary * 1.20
            WHERE CURRENT OF emp_cursor;

        ELSIF (emp_record.experience * emp_record.performance_score) > 15 THEN
            UPDATE employee
            SET salary = salary * 1.10
            WHERE CURRENT OF emp_cursor;

        ELSE
            UPDATE employee
            SET salary = salary * 1.05
            WHERE CURRENT OF emp_cursor;
        END IF;

    END LOOP;

    CLOSE emp_cursor;

    RAISE NOTICE 'Salary Update Completed!';

END $$;

--Step 3: Exception & Status Handling

DO $$
DECLARE
    emp_record RECORD;
    emp_cursor CURSOR FOR
        SELECT * FROM employee WHERE salary > 10000;  -- condition for testing empty result
BEGIN
    OPEN emp_cursor;

    FETCH emp_cursor INTO emp_record;

    IF NOT FOUND THEN
        RAISE NOTICE 'No records found!';
    ELSE
        LOOP
            RAISE NOTICE 'Processing Employee ID: %', emp_record.emp_id;
            FETCH emp_cursor INTO emp_record;
            EXIT WHEN NOT FOUND;
        END LOOP;
    END IF;

    CLOSE emp_cursor;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %', SQLERRM;
        CLOSE emp_cursor;
END $$;
