-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP TABLE departments
DROP TABLE employees
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE salaries
DROP TABLE title

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL PRIMARY KEY,
    dept_name VARCHAR   NOT NULL
);

CREATE TABLE employees (
    emp_no INT   NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL REFERENCES title (title_id),
    birth_title DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL
	
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL REFERENCES employees (emp_no),
    dept_no VARCHAR   NOT NULL REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL REFERENCES departments (dept_no),
    emp_no INT   NOT NULL REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL REFERENCES employees (emp_no),
    salary INT NOT NULL PRIMARY KEY
);

CREATE TABLE title (
    title_id VARCHAR   NOT NULL PRIMARY KEY,
    title VARCHAR   NOT NULL
);


ALTER TABLE employees 
	ADD CONSTRAINT fk_emp_title_id FOREIGN KEY(emp_title_id)REFERENCES title (title_id);
	
ALTER TABLE dept_emp 
	ADD CONSTRAINT fk_emp_no FOREIGN KEY(emp_no)REFERENCES employees (emp_no),
	ADD CONSTRAINT fk_dept_no FOREIGN KEY(dept_no)REFERENCES departments (dept_no);
	
ALTER TABLE dept_manager 
	ADD CONSTRAINT fk_emp_no FOREIGN KEY(emp_no)REFERENCES employees (emp_no),
	ADD CONSTRAINT fk_dept_no FOREIGN KEY(dept_no)REFERENCES departments (dept_no);
	
ALTER TABLE salaries 
	ADD CONSTRAINT fk_emp_no FOREIGN KEY(emp_no)REFERENCES employees (emp_no);
		
		
SELECT * FROM title 
LIMIT(10);

--DATA ANALYSIS

--1. List the following details of each employee: employee number, last name, first name, 
--sex, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees as e
JOIN salaries s
ON  s.emp_no= e.emp_no


--List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List the manager of each department with the following information: department number,
--department name, the manager's employee number, last name, first name.

SELECT ma.dept_no, dep.dept_name,ma.emp_no, e.last_name,e.first_name
FROM dept_manager AS ma
LEFT JOIN departments AS dep ON dep.dept_no = ma.dept_no
LEFT JOIN employees AS e ON e.emp_no= ma.emp_no;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, dep.dept_name, e.last_name,e.first_name
FROM employees AS e
JOIN dept_emp AS d_p ON e.emp_no = d_p.emp_no
JOIN departments AS dep ON d_p.dept_no = dep.dept_no;


--List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT e.first_name, e.last_name, dep.dept_name, e.emp_no
FROM employees e
JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
JOIN departments AS dep
ON d_e.dept_no=dep.dept_no
WHERE dep.dept_name = 'Sales';


--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.first_name, e.last_name, dep.dept_name, e.emp_no
FROM employees e
JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
JOIN departments AS dep
ON d_e.dept_no=dep.dept_no
WHERE dep.dept_name = 'Sales' OR dep.dept_name = 'Development';


--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name,COUNT(last_name) AS "Count of employee last names"
FROM employees
GROUP BY last_name
ORDER BY "Count of employee last names" DESC;

--FOR BONUS-> SALARY RANGES PER EMPLOYEE TITLE

SELECT s.salary, t.title
FROM salaries AS s
JOIN employees e
ON e.emp_no = s.emp_no
JOIN title t
ON e.emp_title_id = t.title_id

