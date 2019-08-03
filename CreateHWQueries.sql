/*
=======================================================================================
Date:	7/27/2019
Desc:	Create queries 
1. List the following details of each employee: 
   employee number, last name, first name, gender, and salary.
2. List employees who were hired in 1986
3. List the manager of each department with the following information: 
   department number, department name, the manager's employee number, 
   last name, first name, and start and end employment dates
4. List the department of each employee with the following information:
   employee number, last name, first name, and department name
5. List all employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, 
   last name, first name, and department name
7. List all employees in the Sales and Development departments, 
   including their employee number, last name, first name, and department name	
8. In descending order, list the frequency count of employee last names, 
   i.e., how many employees share each last name
======================================================================================
--CREATE INDEX EmpnoPK on pewlett.employees ("emp_no")
--CREATE INDEX deptnoPK on pewlett.depts ("dept_no")
--CREATE INDEX EmpnosalPK on pewlett.salaries ("emp_no")
--CREATE INDEX empnotitlePK on pewlett.titles ("emp_no")

1. List the following details of each employee: 
employee number, last name, first name, gender, and salary.
*/
SELECT 
	emp.emp_no
	,last_name
	,first_name
	,gender
	,salary
FROM pewlett.employees emp INNER JOIN pewlett.salaries sal
	on emp.emp_no = sal.emp_no
ORDER BY salary DESC

/*
2. List employees who were hired in 1986.
*/
SELECT 
	emp.emp_no
	,last_name
	,first_name
	,gender
	,hire_date
FROM pewlett.employees emp 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date DESC

/*
3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates
*/

--select * from pewlett.depts_employees

--select MGR.employeename as Manager, EMP.employeename as Employee
--from employees MGR right join employees EMP
--on MGR.employeeid = EMP.managerid  

SELECT 
	dept.dept_no
	,dept_name
	,mgr.emp_no
	,last_name 
	,first_name 
	,from_date as "Start Date"
	,to_date as "End Date"
FROM 
	pewlett.dept_manager mgr
		INNER JOIN pewlett.employees emp
	ON mgr.emp_no = emp.emp_no
		INNER JOIN pewlett.depts dept
	ON mgr.dept_no = dept.dept_no
ORDER BY dept_no, last_name, first_name


/*
4. List the department of each employee with the following information:
employee number, last name, first name, and department name.
*/
SELECT 
	emp.emp_no
	,last_name 
	,first_name
	,dept_name	
FROM 
	pewlett.employees emp 
		INNER JOIN pewlett.depts_employees dept
	ON emp.emp_no = dept.emp_no
		INNER JOIN pewlett.depts dp
	ON dept.dept_no = dp.dept_no
ORDER BY last_name, first_name	
--select * from pewlett.depts_employees
--where emp_no = 17400

/*
5. List all employees whose first name is "Hercules" and last names begin with "B."
*/
SELECT *
FROM pewlett.employees
WHERE first_name = 'Hercules' AND
	  last_name like 'B%'
	  
/*
6. List all employees in the Sales department, including their employee number, 
last name, first name, and department name.
*/	  
SELECT 
	dept.emp_no
	,dept_name
	,first_name
	,last_name
FROM 
	pewlett.depts_employees dept
	INNER JOIN pewlett.employees emp
		ON dept.emp_no = emp.emp_no
	INNER JOIN pewlett.depts dp
		ON dept.dept_no = dp.dept_no
WHERE 
	dp.dept_name = 'Sales'
ORDER BY last_name, first_name
	

/*
7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.
*/
SELECT 
	dept.emp_no
	,dept_name
	,first_name
	,last_name
FROM 
	pewlett.depts_employees dept
	INNER JOIN pewlett.employees emp
		ON dept.emp_no = emp.emp_no
	INNER JOIN pewlett.depts dp
		ON dept.dept_no = dp.dept_no
WHERE 
	dp.dept_name in ('Sales','Development')
ORDER BY dept_name, last_name, first_name


/*
8. In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name
*/
SELECT COUNT(last_name), last_name
FROM pewlett.employees
GROUP BY last_name
ORDER BY last_name DESC

--SELECT DISTINCT(last_name) 
--FROM pewlett.employees
--ORDER BY last_name
