create database tasks;
use tasks;

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
department VARCHAR(50),
job_name VARCHAR(50),
manager_id INT NULL,
hire_date DATE,
salary DECIMAL(10,2),
commission DECIMAL(10,2) NULL
);

CREATE TABLE sales (
sale_id INT PRIMARY KEY,
date DATE NOT NULL,
amount DECIMAL(12,2) NOT NULL
);

CREATE TABLE transactions (
transaction_id SERIAL PRIMARY KEY,
col1 VARCHAR(50) NOT NULL,
col2 VARCHAR(50) NOT NULL,
transaction_date DATE,
amount DECIMAL(12,2)
);

INSERT INTO employees (emp_id, emp_name, department, job_name, manager_id, hire_date, salary, commission) VALUES
(1, 'Amit Sharma', 'Sales', 'Sales Executive', NULL, '2021-04-15', 45000.00, 2000.00),
(2, 'Priya Desai', 'Marketing', 'Marketing Lead', 1, '2020-06-10', 60000.00, NULL),
(3, 'Ravi Kumar', 'IT', 'Software Engineer', 2, '2022-01-05', 55000.00, NULL),
(4, 'Anjali Mehta', 'HR', 'HR Executive', 2, '2021-09-18', 40000.00, 1000.00),
(5, 'Suresh Reddy', 'Sales', 'Sales Manager', 1, '2019-03-22', 70000.00, 3000.00),
(6, 'Neha Joshi', 'IT', 'UI Developer', 3, '2023-02-12', 52000.00, NULL),
(7, 'Vikram Singh', 'Finance', 'Accountant', 5, '2020-11-25', 48000.00, NULL),
(8, 'Divya Nair', 'Marketing', 'Content Writer', 2, '2022-07-30', 42000.00, NULL),
(9, 'Rahul Yadav', 'IT', 'System Admin', 3, '2021-12-01', 50000.00, 1500.00),
(10, 'Meena Iyer', 'HR', 'Recruiter', 4, '2023-01-15', 39000.00, NULL);


INSERT INTO sales (sale_id, date, amount) VALUES
(1, '2023-06-01', 15000.00),
(2, '2023-06-05', 18000.00),
(3, '2023-06-10', 22000.00),
(4, '2023-06-15', 19500.00),
(5, '2023-06-20', 25000.00),
(6, '2023-06-25', 17000.00),
(7, '2023-06-28', 23000.00),
(8, '2023-07-01', 26000.00),
(9, '2023-07-05', 20000.00),
(10, '2023-07-10', 30000.00);

INSERT INTO transactions (col1, col2, transaction_date, amount) VALUES
('Amazon', 'Electronics', '2023-06-01', 1500.00),
('Flipkart', 'Fashion', '2023-06-03', 1200.00),
('Amazon', 'Books', '2023-06-05', 700.00),
('Myntra', 'Fashion', '2023-06-07', 950.00),
('BigBasket', 'Groceries', '2023-06-10', 2000.00),
('Swiggy', 'Food', '2023-06-11', 850.00),
('Zomato', 'Food', '2023-06-12', 950.00),
('Amazon', 'Electronics', '2023-06-13', 3000.00),
('Flipkart', 'Mobiles', '2023-06-14', 1800.00),
('Myntra', 'Fashion', '2023-06-15', 1300.00);


# Q1) Retrieve the second highest salary from the employees table.
select Max(salary) as second_highest_salary from employees where salary 
<(select max(salary) from employees);

# Q2)List employees who earn more than the average salary in their department.
SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

# Q3)For the sales table, compute a running total of the amount, ordered by date.
SELECT date, amount,
SUM(amount) OVER (ORDER BY date) AS running_total
FROM sales;

# Q4)Identify duplicate combinations in transactions(col1, col2) and count them.
SELECT col1, col2, COUNT(*) AS dup_count FROM transactions
GROUP BY col1, col2
HAVING COUNT(*) > 1;

