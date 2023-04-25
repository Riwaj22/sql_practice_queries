-- 1. Write a query to find the number of jobs available in the employees table.

select count(distinct job_id)
from employees

-- 2.Write a query to get the total salaries payable to employees.
select sum(salary)
from employees

-- 3. Write a query to get the minimum salary from employees table.
select min(salary) as minimum_salary
from employees

-- Write a query to get the maximum salary of an employee working as a Programmer.
select max(salary)as maximum_salary
from employees
where job_id in ('IT_PROG')

-- 5. Write a query to get the average salary and number of employees working in the department which ID is 90
select avg(salary) as "average salary",
count(employee_id)as "Number of employees"
from employees
where department_id in (90)

-- 6. Write a query to get the highest, lowest, total, and average salary of all employees.
select max(salary) as highest, 
min(salary) as lowest,
sum(salary) as total, 
avg(salary) as average
from employees

-- 7. Write a query to get the number of employees working in each post.

select job_id, count(employee_id)
from employees
group by job_id

-- 8. Write a query to get the difference between the highest and lowest salaries.

select max(salary)as maximum,
min(salary)as minimum,
max(salary)-min(salary) as difference
from employees


-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee under that manager.

select manager_id , salary
from employees
where salary = (select min(salary) from employees)


-- 10. Write a query to get the department ID and the total salary payable in each department.
select department_id, sum(salary)
from employees
group by department_id


-- 11. Write a query to get the average salary for each post excluding programmer.
select avg(salary) as "Average salary"
from employees
where job_id not in ('IT_PROG')

-- 12. Write a query to get the total salary, maximum, minimum and average salary of all posts for those departments which ID 90.
select sum(salary)as "Total salary",
max(salary)as "Maximum",
min(salary)as "Minimum",
avg(salary)as "Average"
from employees
where department_id =90

-- 13. Write a query to get the job ID and maximum salary of each post for maximum salary is at or above $4000.
select job_id,
max(salary) 
from employees
group by job_id
having max(salary)>=4000

-- 14. Write a query to get the average salary for all departments working more than 10 employees.
select avg(salary) as "Average salary"
from employees
group by department_id
having count(employee_id)>=10

