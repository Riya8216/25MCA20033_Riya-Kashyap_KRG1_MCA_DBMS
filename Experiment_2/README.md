# 👨‍🎓 Student Details
Name:Riya Kashyap

UID: 25MCA20033

 Branch: MCA
 
Semester: 2nd

Section/Group: 1/A

Subject: Technical Training

Date of Performance: 13/01/2026


# 🎯 Aim of the Project

The aim of this project is to create and manage an orders database using SQL and to perform various database operations such as inserting data, retrieving records, sorting results, grouping data, and applying aggregate and conditional functions to analyze sales information effectively.

# 🎯 Objective of the Project

The objective of this project is to gain practical knowledge of SQL by creating a table, inserting records, and executing queries using WHERE, ORDER BY, GROUP BY, HAVING, aggregate functions, and CASE statements to generate meaningful summaries and insights from the stored data.

# 🛠️ Practical / Experiment Steps

1. Design an orders table with appropriate attributes

2. Create the table using SQL commands

3. Insert multiple records into the table

4. Retrieve records based on conditions

5. Sort the retrieved data in descending order

6. Group data and calculate total sales

7. Apply aggregate and conditional functions for analysis

# 🧪 Procedure of the Practical

CREATE TABLE orders (
    order_id      INT,
    customer_name VARCHAR(50),
    product        VARCHAR(50),
    quantity       INT,
    price          NUMERIC(8,2),
    order_date     DATE
);


INSERT INTO orders VALUES

(1, 'Amit',  'Laptop',  1, 55000, '2024-01-10'),

(2, 'Riya',  'Mobile',  2, 22000, '2024-01-12'),

(3, 'Rahul', 'Laptop',  1, 60000, '2024-01-15'),

(4, 'Sneha', 'Tablet',  3, 15000, '2024-01-18'),

(5, 'Ankit', 'Mobile',  1, 25000, '2024-01-20'),

(6, 'Pooja', 'Laptop',  2, 58000, '2024-01-22'),

(7, 'Karan', 'Tablet',  1, 18000, '2024-01-25');


SELECT customer_name, product, price
FROM orders
WHERE price > 20000;
SELECT customer_name, product, price
FROM orders
ORDER BY price DESC;


SELECT product,
       SUM(quantity * price) AS total_sales,       
       COUNT(*) AS total_orders      
FROM orders
GROUP BY product;


SELECT product,
       SUM(quantity * price) AS total_sales
FROM orders
GROUP BY product
HAVING SUM(quantity * price) > 50000
ORDER BY total_sales DESC;

SELECT product,
       SUM(CASE 
              WHEN price > 20000 
              THEN quantity * price 
              ELSE 0 
           END) AS high_value_sales
           
FROM orders

GROUP BY product

ORDER BY high_value_sales DESC;

# 📊 I/O Analysis (Input / Output Analysis)
<img width="736" height="215" alt="image" src="https://github.com/user-attachments/assets/aa4e235f-fa29-4fbe-bb1a-98e05a83c40c" />

<img width="752" height="236" alt="image" src="https://github.com/user-attachments/assets/a8427c1b-8f2e-414e-af88-964a993a654d" />

<img width="750" height="225" alt="image" src="https://github.com/user-attachments/assets/57325472-3ffd-4dbe-b7bc-6ef740d25f9c" />

<img width="762" height="206" alt="image" src="https://github.com/user-attachments/assets/ae268723-6b27-4632-85d3-c0c00a4d60b5" />


# 📚 Learning Outcome

- Understood the concept of relational database tables and data types.

- Learned to create tables and insert records using SQL commands.

- Gained knowledge of data retrieval using SELECT and WHERE clauses.

- Learned how to sort data using the ORDER BY clause.

- Understood the use of aggregate functions such as SUM() and COUNT().

- Learned to group data using the GROUP BY clause.

- Understood the difference between WHERE and HAVING clauses.

- Gained practical experience in using CASE statements for conditional data analysis.

  


