-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.EmpNo, e.LastName, e.FirstName, e.Gender, s.Salary
from Employees as e 
join Salaries as s
on e.EmpNo = s.EmpNo;
 
-- List employees who were hired in 1986.
select EmpNo, LastName, FirstName, HireDate
from Employees
where HireDate between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
select d.DeptNo, d.DeptName, e.EmpNo, e.LastName, e.FirstName, m.FromDate, m.ToDate 
from Departments as d
join DeptManager as m
on d.DeptNo = m.DeptNo
--and m.ToDate = '9999-01-01' -- uncomment this if you only want employees who are currently managing a department
join Employees as e
on m.EmpNo = e.EmpNo;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.EmpNo, e.LastName, e.FirstName, d.DeptName
from Employees as e
join DeptEmp as de
on e.EmpNo = de.EmpNo
--and de.ToDate = '9999-01-01' -- uncomment this if you only want the departments an employee is currently working in
join Departments d
on de.DeptNo = d.DeptNo;

--List all employees whose first name is Hercules and last names begin with B.
select EmpNo, LastName, FirstName
from Employees as e
where FirstName = 'Hercules'
and LastName like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.EmpNo, e.LastName, e.FirstName, d.DeptName
from Employees as e
join DeptEmp as de
on e.EmpNo = de.EmpNo
--and de.ToDate = '9999-01-01' -- uncomment this if you only want employees currently working in Sales
join Departments d
on de.DeptNo = d.DeptNo
and d.DeptName = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.EmpNo, e.LastName, e.FirstName, d.DeptName
from Employees as e
join DeptEmp as de
on e.EmpNo = de.EmpNo
--and de.ToDate = '9999-01-01' -- uncomment this if you only want employees currently working in Sales or Development
join Departments d
on de.DeptNo = d.DeptNo
and d.DeptName in ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select LastName, count(*) as LastNameCount
from Employees
group by LastName
order by count(*) desc; 