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

