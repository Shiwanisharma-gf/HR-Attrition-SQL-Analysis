-- ==========================================================
-- PROJECT: HR Employee Attrition & AI Adoption Analysis
-- ==========================================================

-- ==========================================================
-- PHASE 1: DATA EXPLORATION (Understanding the Dataset)
-- ==========================================================

-- 1. Viewing the entire dataset to understand its structure
SELECT * FROM employee_attrition_hr;

-- 2. Fetching the top 10 rows for a quick preview
SELECT * FROM employee_attrition_hr
LIMIT 10;

-- 3. Counting the total number of employees in the dataset
SELECT COUNT(*) FROM employee_attrition_hr;

-- 4. Checking all unique job levels
SELECT DISTINCT job_level FROM employee_attrition_hr;

-- 5. Finding out all unique departments
SELECT DISTINCT department FROM employee_attrition_hr;

-- 6. Checking distinct gender categories
SELECT DISTINCT gender FROM employee_attrition_hr;

-- 7. Identifying all unique marital status categories
SELECT DISTINCT marital_status FROM employee_attrition_hr;

-- 8. Validating database schema, column names, and data types
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'employee_attrition_hr';

-- ==========================================================
-- PHASE 2: DATA CLEANING & DEMOGRAPHICS
-- ==========================================================

-- 9. Total employees in each department
SELECT department, COUNT(*) AS total_employees
FROM employee_attrition_hr 
GROUP BY department
ORDER BY total_employees DESC;

-- 10. Gender distribution across the company
SELECT gender, COUNT(*) AS showing_gender
FROM employee_attrition_hr
GROUP BY gender
ORDER BY showing_gender DESC;

-- 11. Data Cleaning: Checking for missing (NULL) values in age or gender
SELECT * FROM employee_attrition_hr 
WHERE age IS NULL OR gender IS NULL;

-- 12. Employee count based on education levels
SELECT education_level, COUNT(*) AS education
FROM employee_attrition_hr
GROUP BY education_level 
ORDER BY education DESC;

-- 13. Unique job roles present in the dataset
SELECT DISTINCT job_role FROM employee_attrition_hr;

-- 14. Highest and lowest monthly salaries
SELECT MAX(monthly_income) AS month_ly FROM employee_attrition_hr;
SELECT MIN(monthly_income) AS month_ly FROM employee_attrition_hr;

-- ==========================================================
-- PHASE 3: BUSINESS INSIGHTS & HR ANALYTICS
-- ==========================================================

-- 15. Employee Attrition Count (Who left vs stayed)
SELECT attrition, COUNT(*) AS yes_no
FROM employee_attrition_hr
GROUP BY attrition;

-- 16. Average monthly salary by department
SELECT department, ROUND(AVG(monthly_income), 2) AS monthly_salary
FROM employee_attrition_hr
GROUP BY department
ORDER BY monthly_salary DESC;

-- 17. Work mode with the highest average burnout score
SELECT work_mode, ROUND(AVG(burnout_score), 2) AS best_mode
FROM employee_attrition_hr
GROUP BY work_mode
ORDER BY best_mode DESC;

-- ==========================================================
-- PHASE 4: AI ADOPTION & JOB RISK ANALYSIS
-- ==========================================================

-- 18. Count of employees using AI tools vs non-users
SELECT uses_ai_tools_at_work, COUNT(*) AS ai_use
FROM employee_attrition_hr
GROUP BY uses_ai_tools_at_work;

-- 19. Department with the highest perceived AI job risk
SELECT department, ROUND(AVG(perceived_ai_job_risk), 2) AS ai_risk
FROM employee_attrition_hr
GROUP BY department
ORDER BY ai_risk DESC;

-- 20. Departments with the highest number of AI tool users
SELECT department, COUNT(uses_ai_tools_at_work) AS ai_use_by_department
FROM employee_attrition_hr
WHERE uses_ai_tools_at_work = True
GROUP BY department 
ORDER BY ai_use_by_department DESC;

-- 21. Departments with the highest number of AI non-users
SELECT department, COUNT(uses_ai_tools_at_work) AS not_use_ai_at_work
FROM employee_attrition_hr
WHERE uses_ai_tools_at_work = False
GROUP BY department 
ORDER BY not_use_ai_at_work DESC;

-- 22. Average salary distribution by department (Re-verification)
SELECT department, ROUND(AVG(monthly_income), 2) AS average_salary_by_department
FROM employee_attrition_hr
GROUP BY department 
ORDER BY average_salary_by_department DESC;

-- 23. Final Insight: Attrition count based on AI tool usage
SELECT uses_ai_tools_at_work, attrition, COUNT(*) AS ai_use_with_attrition
FROM employee_attrition_hr
GROUP BY uses_ai_tools_at_work, attrition;





							