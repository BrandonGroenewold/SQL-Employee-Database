-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
--fix varchar in hire_date
alter table employees
alter column hire_date type varchar
using hire_date::date

select e.first_name, e.last_name, e.hire_date
from employees as e
where hire_date between '1986-01-01' and '1986-31-12'
order by hire_date asc;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments
left join dept_manager
on departments.dept_no = dept_manager.dept_no
left join employees
on employees.emp_no = dept_manager.emp_no;


-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules'
and last_name like '%B%';


-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development';

-- 8.List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select count(last_name) as "Count", last_name as "Last Name"
from employees
group by last_name
order by last_name desc;
