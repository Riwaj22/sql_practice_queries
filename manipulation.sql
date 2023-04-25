-- 1. Write a query to display the name, including first_name and last_name and salary for all employees whose salary is out of the range between $10,000 and $15,000.

select first_name, last_name,
concat(first_name,' ',last_name) as name,
salary
from employees
where
salary not between 10000 and 15000

-- 2. Write a query to display the name, including first_name and last_name, and department ID who works in the department 30 or 100 and arrange the result in ascending order according to the department ID.
select first_name, last_name,
concat(first_name,' ',last_name) as name,
department_id
from employees
where department_id in (30,100)
order by department_id

-- 3. Write a query to display the name, including first_name and last_name, and salary who works in the department either 30 or 100 and salary is out of the range between $10,000 and $15,000

select first_name, last_name,
concat(first_name,' ',last_name) as name,
salary
from employees
where department_id in (30,100)
and 
salary not between 10000 and 15000

-- 4. Write a query to display the name, including first_name and last_name and hire date for all employees who were hired in 1987
select first_name, last_name,
concat(first_name,' ',last_name) as name
from employees
where year(hire_date) = '1987'


-- 5. Write a query to get the first name of the employee who holds the letter 'c' and 'e' in the first name.
select first_name
from employees
where first_name like '%ce%'

--  query to display the last name, job, and salary for all those employees who hasn't worked as a Programmer or a Shipping Clerk, and not drawing the salary $4,500, $10,000, or $15,000.

select last_name, job_id, salary 
from employees
where job_id not in ('IT_PROG','ST_CLERK')
and 
salary not in (4500,10000,15000)


-- query to display the last names of employees whose name contain exactly six characters.
select last_name 
from employees 
where 
length(last_name)=6

-- query to display the last name of employees having 'e' as the third character.
select last_name
from employees 
where last_name like'__e%'

-- 9. Write a query to display the jobs/designations available in the employees table.

SELECT DISTINCT job_id  
FROM employees
group by job_id

-- 10. Write a query to display the name, including first_name, last_name, salary and 15% of salary as PF of all employees.
select first_name, last_name,
concat(first_name,' ',last_name) as name,
salary,
salary*.15 as pf
from employees

-- 11. Write a query to select all information of employees whose last name is either 'JONES' or 'BLAKE' or 'SCOTT' or 'KING' or 'FORD'.
select * from employees 
where 
last_name in('JONES','BLAKE','SCOTT','KING','FORD')

