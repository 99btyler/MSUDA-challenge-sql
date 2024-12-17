-- EMPLOYEES: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salaries
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

-- EMPLOYEES (hired in 1986): first name, last name, and hire date
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

-- MANAGERS: department number, department name, employee number, last name, and first name
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no;

-- DEPARTMENTS/EMPLOYEES: department number, employee number, last name, first name, and department name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no;

-- EMPLOYEES (first name Hercules, last name starts with B): first_name, last_name, sex
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- EMPLOYEES (sales): emp_no, last name, and first name
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007';

-- EMPLOYEES (sales and development): emp_no, last name, first name, dept_name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

-- EMPLOYEES (last name frequency): last_name, count_of_last_name
SELECT last_name, COUNT(last_name) as count_of_last_name
FROM employees
GROUP BY last_name
ORDER BY count_of_last_name DESC;