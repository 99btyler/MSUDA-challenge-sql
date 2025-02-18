/*

pgAdmin4 Steps
- Create the database: MSUDA-challenge-sql
- Create the tables: Open and run schema.sql (this file)
- Import the data: Right click each table, in the order of creation, and import from data
	- Make sure Options>Header is selected

ERROR IMPORTING THE DATA?
Check which table caused the error, you need to fill that one first

*/

DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

CREATE TABLE IF NOT EXISTS departments (
	dept_no VARCHAR(64) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS titles (
	title_id VARCHAR(64) PRIMARY KEY NOT NULL,
	title VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(64) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE IF NOT EXISTS dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(64) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_manager (
	dept_no VARCHAR(64) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries (
	emp_no INT NOT NULL,
	salaries INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);