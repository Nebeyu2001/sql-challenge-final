-- Checking columns of employyes table and Salary table before joining them
Select * from employees 
-- checking Salary table before joining them
select * from salaries
-- Detailed info of each employee: 
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        employees.sex,
        salaries.salary
FROM employees 
    INNER JOIN salaries
    ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

-- Employees hired in 1986
Select first_name, last_name, hire_date
from employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- To find all informations requested about manager of each department
-- we have to join dept_mangaer,departments and employees tables
SELECT  dept_manager.dept_no,
        departments.dept_name,
        dept_manager.emp_no,
        employees.last_name,
        employees.first_name
FROM dept_manager 
    INNER JOIN departments
        ON (dept_manager.dept_no = departments.dept_no)
    INNER JOIN employees 
        ON (dept_manager.emp_no = employees.emp_no);


-- To find all information requested regarding department of each employee
-- we have to join employees,ept_emp and departments table
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees 
    INNER JOIN dept_emp 
        ON (employees.emp_no = dept_emp.emp_no)
    INNER JOIN departments
        ON (dept_emp.dept_no = departments.dept_no)
ORDER BY employees.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- To find requested info of employees in the Sales department, 
--first we have to see the departments table to find sales...and join it, with dept_emp and employees
Select * from departments
--then parce only the sales dept_name
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees 
    INNER JOIN dept_emp
        ON (employees.emp_no = dept_emp.emp_no)
    INNER JOIN departments
        ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

-- To find requested info of employees in the Sales and development department,
-- we follow the same procedure like the above and add development when we parce
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees 
    INNER JOIN dept_emp 
        ON (employees.emp_no = dept_emp.emp_no)
    INNER JOIN departments
        ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

-- The frequency of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
