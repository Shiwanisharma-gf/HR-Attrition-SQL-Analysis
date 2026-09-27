select*from employee_attrition_hr;
 -- how to understand the data-----------
select*from employee_attrition_hr
limit 10;
-- use distinct for check unique values------
select count(*) from employee_attrition_hr;
select distinct job_level from employee_attrition_hr;
select distinct department from employee_attrition_hr;
select distinct  gender from employee_attrition_hr;
select distinct marital_status from employee_attrition_hr;

SELECT department, COUNT(*) as total_employees
FROM employee_attrition_hr 
GROUP BY department
ORDER BY total_employees DESC;


SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'employee_attrition_hr';


select gender, count (*)as showing_gender
from employee_attrition_hr
group by gender
order by showing_gender desc;

SELECT*FROM employee_attrition_hr 
WHERE age IS NULL
 or gender is null;
	   

select education_level, count(*) as education
from employee_attrition_hr
group by education_level 
order by education desc;

select distinct job_role from employee_attrition_hr;


select max(monthly_income) as month_ly from employee_attrition_hr;
select min(monthly_income) as month_ly from employee_attrition_hr;

-- anylize the data-----

select attrition,count(*) as yes_no
from employee_attrition_hr
group by attrition;


select  department,round(avg(monthly_income),2) as monthly_salary
from employee_attrition_hr
group by department
order by monthly_salary desc;



select work_mode , round(avg(burnout_score),2) as best_mode
from employee_attrition_hr
group by work_mode
order by best_mode desc;

select uses_ai_tools_at_work, count(*) as ai_use
from employee_attrition_hr
group by uses_ai_tools_at_work;


select department,round(avg(perceived_ai_job_risk),2) as ai_risk
from employee_attrition_hr
group by department
order by ai_risk desc;

select department, count(uses_ai_tools_at_work) as ai_use_by_department
from employee_attrition_hr
where uses_ai_tools_at_work=True
group by department 
order by ai_use_by_department desc;

select department, count(uses_ai_tools_at_work) as not_use_ai_at_work
from employee_attrition_hr
where uses_ai_tools_at_work=False
group by department 
order by not_use_ai_at_work desc;

select department ,round(avg(monthly_income),2) as average_salary_by_department
from employee_attrition_hr
group by department 
order by average_salary_by_department desc;

select uses_ai_tools_at_work,attrition, count(*) as ai_use_with_attrition
from employee_attrition_hr
group by uses_ai_tools_at_work,attrition;





							