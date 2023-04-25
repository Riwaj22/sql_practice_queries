select * from employees

alter table employees
add salary int
-- SQL statement to change the email column of the employees table with 'not available' for all employees.
update  employees
set email = 'Not Available'

-- SQL statement to change the email and commission_pct column of the employees table with 'not available' and 0.10 for all employees.
update employees 
set email = 'Not Available', commission = 0.10 

-- SQL statement to change the email and commission_pct column of the employees table with 'not available' and 0.10 for those employees whose department_id is 110.
update employees 
set email = 'Not Available', commission = 0.10
where department_id = 110

-- SQL statement to change the email column of employees table with 'not available' for those employees whose department_id is 80 and gets a commission is less than.20%.
update employees
set email = 'Not Available' 
where department_id = 80 and 
commission < 0.20

-- SQL statement to change the email column of the employees table with 'not available' for those employees who belongs to the 'Accounting' department.
update employees
set email = 'Not Available' 
where job_id = 'Accounting'

-- SQL statement to change the salary of an employee to 8000 whose ID is 105, if the existing salary is less than 5000.
update employees
set salary = 8000 
where employee_id = 105 and 
salary < 5000

-- SQL statement to change the job ID of the employee which ID is 118 to SH_CLERK if the employee belongs to a department which ID is 30 and the existing job ID does not start with SH.
update employees
set job_id = 'SH_CLERK'
where job_id = '118' and 
department_id = 30 and
job_id not like 'SH%'

-- SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, the salary will be increased by 25% of the department 40, 15% for department 90 and 10% of the department 110 and the rest of the department will remain same.
UPDATE employees SET salary= CASE department_id 
 WHEN 40 THEN salary+(salary*.25) 
 WHEN 90 THEN salary+(salary*.15)
 WHEN 110 THEN salary+(salary*.10)
  ELSE salary
    END
 WHERE department_id IN (40,50,50,60,70,80,90,110);
 
 
 