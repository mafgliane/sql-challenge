--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

--Check that there is only one record per emp in salaries
-- SELECT count(emp_no) FROM salaries
-- GROUP BY emp_no
-- HAVING count(emp_no) > 1;

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.
SELECT first_name, last_name FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT a.dept_no, b.dept_name, a.emp_no, c.last_name, c.first_name, a.from_date, a.to_date
FROM dept_manager AS a
JOIN departments AS b
ON a.dept_no = b.dept_no
JOIN employees AS c
ON a.emp_no = c.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT a.emp_no, a.first_name, a.last_name, c.dept_name
FROM employees AS a
JOIN dept_emp AS b
ON a.emp_no = b.emp_no
JOIN departments AS c
on b.dept_no = c.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT a.last_name, a.first_name, c.dept_name
FROM employees AS a
JOIN dept_emp AS b
ON a.emp_no = b.emp_no
JOIN departments AS c
on b.dept_no = c.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees AS a
JOIN dept_emp AS b
ON a.emp_no = b.emp_no
JOIN departments AS c
on b.dept_no = c.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
