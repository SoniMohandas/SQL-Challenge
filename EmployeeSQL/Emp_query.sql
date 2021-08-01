--Listing each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

--List the manager of each department with department number, department name, 
--the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name,e.first_name
FROM employees e
JOIN dept_emp de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE e.emp_title_id LIKE 'm0001'
ORDER BY d.dept_no;

--List the department of each employee with employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name LIKE 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name;
