-- 1. Write a query to find the first_name, last_name and salaries of the employees who have a higher salary than the employee whose last_name is Bull.

select first_name, last_name, salary
from employees
where 
salary > (select salary from
		  employees
		  where 
		  last_name='Bull'
		 )
		 
-- 2. Write a SQL subquery to find the first_name and last_name of all employees who works in the IT department.		 
select first_name,
last_name
from employees
where 
job_id = (select 
		  job_id from employees 
		  where job_id = 'IT_PROG'
		 )
		 
-- 3. Write a SQL subquery to find the first_name and last_name of the employees under a manager who works for a department based in the United States.
select first_name, last_name
from employees
where department_id in (
	select department_id 
	from departments 
	where location_id in(
	select location_id 
		from locations
		where country_id = 'US'	
	)

)

-- 4. Write a SQL subquery to find the first_name and last_name of the employees who are working as a manager.
	
select first_name, last_name
from employees 
where employee_id in
(
	select manager_id
	from employees
)

-- 5. Write a SQL subquery to find the first_name, last_name and salary, which is greater than the average salary of the employees.

select first_name, last_name, salary
from employees 
where salary > (
	select avg(salary)
	from employees
)

-- 6. Write a SQL subquery to find the first_name, last_name and salary, which is equal to the minimum salary for this post, he/she is working on

SELECT first_name, last_name, salary 
FROM employees 
WHERE employees.salary = 
(SELECT min_salary 
FROM jobs 
WHERE employees.job_id = jobs.job_id);

-- 7. Write a SQL Subquery to find the first_name, last_name and salary of the employees who earn more than the average salary and works in any of the IT departments.

select first_name, last_name, salary
from employees
where department_id in (
	select department_id
	from departments 
	having department_name = 'IT'
)
and salary > (
select avg(salary)
	from employees
)

-- 8. Write a SQL subquery to find the first_name, last_name and salary of the employees who draw a more salary than the employee, which the last name is Bell.

select first_name, last_name,
salary 
from employees
where salary > (
	select salary 
	from employees
	where
	last_name = 'Bell'
)

-- 9. Write a SQL subquery to find all the information of the employees who draws the same salary as the minimum salary for all departments.

select * 
from 
employees 
where 
salary = (
select min(salary)
	from employees
	
)

-- 10. Write a SQL subquery to find all the information of the employees whose salary greater than the average salary of all departments.
select * 
from 
employees 
where 
salary > (
select avg(salary)
	from employees
)

-- 11. Write a subquery to find the first_name, last_name, job_id and salary of the employees who draws a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest.

select first_name, last_name,
job_id, salary
from employees
where salary > (
	select salary 
	from employees
	where job_id = 'SH_CLERK'
)

-- 12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT b.first_name,b.last_name 
FROM employees b 
WHERE NOT EXISTS (
SELECT 'X' 
FROM employees a 
WHERE a.manager_id = b.employee_id
	
-- 13. Write a SQL subquery to find the employee ID, first name, last name and department names of all employees
SELECT employee_id, first_name, last_name, 
(SELECT department_name 
FROM departments d 
WHERE e.department_id = d.department_id) 
department FROM employees e 
ORDER BY department;
	
-- 14. Write a SQL subquery to find the employee ID, first name, last name and salary of all employees whose salary is above the average salary for their departments.

	
select employee_id, first)name,last_name,
salary
from employees 
group by department_id
where salary > (
	select avg(salary)
	from employees
)


-- 15. Write a subquery to find the 5th maximum salary of all salaries.
SELECT DISTINCT salary 
FROM employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT salary) 
FROM employees  e2 
WHERE e1.salary <= e2.salary); 

	
-- 17. Write a subquery to select last 10 records from a table.
SELECT * FROM (
SELECT * FROM employees 
ORDER BY employee_id DESC LIMIT 10) sub 
ORDER BY employee_id ASC; 

-- 18. Write a query to list department number, the name for all the departments in which there are no employees in the department.
SELECT * FROM departments 
WHERE department_id 
NOT IN (select department_id 
FROM employees);



	

