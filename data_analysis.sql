--DATA ANALYSIS USING QUERIES TO FIND OUT INSIGHTFUL INFORMATION 
--FROM THE DATA FROM THE COMPANY


--List the following details of each employee: employee number, last name, first name, 
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

