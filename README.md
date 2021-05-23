![PostgreSQL_PythonAlchemy.pdf](https://github.com/Yazz-01/sql-challenge/files/6527354/PostgreSQL_PythonAlchemy.pdf)
# sql-challenge
Project using Postgre SQL

This project helped a company by giving Data Engineering support. 

The first major task was to do a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are CSV files.
I designed the tables to hold data in the CSVs, imported the CSVs into a SQL database, and answered questions about the data. I performed:


*Data Engineering

*Data Analysis

  Starting Point

*Data Engineering

Used the information to create a table schema for each of the six CSV files. Specifying data types, primary keys, foreign keys, and other constraints.

For the primary keys check to see if the column is unique. Which takes to primary keys in order to uniquely identify a row. Tables were created in certain order to handle foreign keys.

Imported each CSV file into the corresponding SQL table. 



*Data Analysis

Once you have a completed the database the following was perfomed:


1. List the following details of each employee: employee number, last name, first name, sex, and salary.


2. List first name, last name, and hire date for employees who were hired in 1986.


3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


4. List the department of each employee with the following information: employee number, last name, first name, and department name.


5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


8. In descending order, listed the frequency count of employee last names, i.e., how many employees share each last name.



*Bonus showing extra-interest

Data engineering skills of a new employee. The following steps to generate a visualization of the data.

Import the SQL database into Pandas to read the CSVs directly in Pandas, to proving my technical mettle using SQLAlchemy.


1. Created a histogram to visualize the most common salary ranges for employees.

2. Created a bar chart of average salary by title.


3. Created an image file of your ERD.


4. Created a .sql file of your table schemata.


5. Created a .sql file of your queries.



