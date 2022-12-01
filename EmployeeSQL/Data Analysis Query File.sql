--List the employee number, last name, first name, sex, and salary of each employee.
Select a.emp_no,a.last_name, a.first_name,a.sex, b.salary 
from Employees a
left outer join Salaries b on a.emp_no = b.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, last_name, hire_date
from Employees 
where hire_date BETWEEN '1986-01-01' AND '1987-01-01'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select b.dept_no,c.dept_name,a.emp_no,a.last_name, a.first_name
from Employees a
left outer join dept_manager b on a.emp_no = b.emp_no
left outer join departments c on b.dept_no = c.dept_no
WHERE b.dept_no IS NOT NULL

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select b.dept_no,a.emp_no,a.last_name, a.first_name,c.dept_name
from Employees a
left outer join dept_emp b on a.emp_no = b.emp_no
left outer join departments c on b.dept_no = c.dept_no
WHERE b.dept_no IS NOT NULL
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select DISTINCT(first_name), last_name, sex
from Employees 
where first_name = 'Hercules'
order by last_name
--List each employee in the Sales department, including their employee number, last name, and first name.
Select a.emp_no,a.last_name, a.first_name
from Employees a
left outer join dept_emp b on a.emp_no = b.emp_no
left outer join departments c on b.dept_no = c.dept_no
where c.dept_name = 'Sales'
order by a.emp_no
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select a.emp_no,a.last_name, a.first_name,c.dept_name
from Employees a
left outer join dept_emp b on a.emp_no = b.emp_no
left outer join departments c on b.dept_no = c.dept_no
where c.dept_name IN ('Sales','Development')
order by a.emp_no
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, count(last_name)
from Employees
group by last_name
order by count(last_name)desc