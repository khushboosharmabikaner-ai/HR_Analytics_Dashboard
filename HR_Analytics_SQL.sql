-- HR Analytics Project-- 

-- Tools- MYSQL, PowerBI, GitHub

--Project Goals-- There are main five goals of this project

--Goal 1:---- WorkForce and Analysis
--Goal 2:---- Salary Analysis
--Goal 3:---- Employee Performance & Job Satisfaction
--Goal 4:---- Attrition Analysis
--Goal 5:---- Tenure and Rentention Analysis


--How we'll build this project--

STEP 1-- SQL: Dataset  Understanding
STEP 2-- SQL: Data Quality & Cleaning
STEP 3-- SQL: WorkForce Analysis
STEP 4-- SQL: Salary & Compensation Analysis
STEP 5-- SQL: Performance & Satisfaction
STEP 6-- SQL: Attrition Analysis 
STEP 7-- SQL: Tenure & Rentention
STEP 8-- SQL: Prepare SQL results/Data for PowerBI
STEP 9-- SQL: PowerBI Data Model 
STEP 10-- SQL: PowerBI Dashboard
STEP 11-- Business Insights 


-- ============================================================ --
                     --STEP 1--
-- ============================================================ --
   
   DATASET UNDERSTANDING
   PURPOSE: Understand dataset structure and size

-- ============================================================

-- Review the columns and their data types in the employee table.
   DESCRIBE hr_employees;

-- Count all records in the employee table.
   SELECT COUNT(*) AS TotalEmployees
   FROM hr_employees;

-- Review the departments represented in the dataset.
   SELECT DISTINCT Department
   FROM hr_employees
   ORDER BY Department;

-- Shows the WorkMode are exist in the dataset.
   SELECT DISTINCT WorkMode
   FROM hr_employees
   ORDER BY WorkMode;

-- Review the EmploymentStatus represented in the dataset
   SELECT DISTINCT EmploymentStatus
   FROM hr_employees
   ORDER BY EmploymentStatus;
   
-- Review the employees of each department
   SELECT Department, COUNT(*) FROM hr_employees
   GROUP BY Department;

-- Review the employees who are active and who are resigned
   SELECT EmploymentStatus, COUNT(*) AS EmployeeCount
   FROM hr_employees
   GROUP BY EmploymentStatus;

-- View Sample Data
   SELECT *
   FROM hr_employees
   LIMIT 10;

-- ============================================================ --
                       --STEP 2--
-- ============================================================ --
 
   DATA QUALITY CHECKS & CLEANING
   PURPOSE: To make sure data is aacurate, complete, consistent,
            and ready for analysis.
-- ============================================================

-- #Count the rows and check EmployeeID and ExitDate for missing values.
   SELECT COUNT(*) AS TotalRows,
   SUM(EmployeeID IS NULL) AS MissingEmployeeID,
   SUM(ExitDate IS NULL) AS MissingExitDate     #ExitDate being NULL is not a data problem. for active employee, exitdate may naturally be NULL bcz they haven't left the company.                           
   FROM hr_employees;
 
-- #Check the Duplicate EmployeeID
-- Show EmployeeIDs that occur more than once.

   SELECT EmployeeID, COUNT(*) AS DuplicateCount
   FROM hr_employees
   GROUP BY EmployeeID  
   HAVING COUNT(*)>1;

-- #Check Age eligibility as per company policy i.e. 18 to 60
                                                                        
    SELECT COUNT(*) AS EligibleEmp
    FROM hr_employees
    WHERE Age BETWEEN 18 AND 60; 


-- ============================================================ --
                    --STEP-3--
-- ============================================================ --
       
   GOAL 1: WORKFORCE ANALYSIS
   
   Business Objective:
   Understand workforce distribution across departments,
   job roles, gender, education, and locations.

-- ============================================================
-- 3.1 Total Employees
       SELECT COUNT(*) AS TotalEmployees
       FROM hr_employees;

-- 3.2 Count employees by department, from largest to smallest.
       SELECT Department, COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY Department
       ORDER BY EmployeeCount DESC;

-- 3.3 Count employees by employment status.   (#Active/Resigned)
       SELECT EmploymentStatus, COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY EmploymentStatus
       ORDER BY EmployeeCount DESC;

--3.4 Review which JobRoles have the highest workforce.
      SELECT JobRole, COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY JobRole
      ORDER BY EmployeeCount;

--3.5 Count Gender Distribution
      SELECT Gender, COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY Gender;
--3.6 Education Level Distribution
      What educational background do employees have?
      SELECT EducationLevel, COUNT(*) AS EmployeeCount
      FEOM hr_employees
      GROUP BY EducationLevel
      ORDER BY EmployeeCount;

--3.7 Employees By Location
      SELECT Location, COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY Location
      ORDER BY EmployeeCount;
      

-- =============================================================== --
                        --STEP 4--
-- =============================================================== --
   
   GOAL 2: SALARY & COMPENSATION ANALYSIS
   Business Objective:
   Analyze salary distribution across departments,
   roles and employee categories. 
 
-- ==============================================================  

-- 4.1 Overall Salary Summary(MAX, MIN, AVG)
       SELECT MIN(AnnualSalaryINR) AS MINSal
              MAX(AnnualSalaryINR) AS MAXSal
              AVG(AnnualSalaryINR) AS AVGSal
       FROM hr_employees;

-- 4.2 Department-Wise Avg Salary
       SELECT Department, AVG(AnnualSalaryINR) AS AVGSal
       FROM hr_employees
       GROUP BY Department
       ORDER BY AVGSal DESC;

--4.3  Salary By Department
       SELECT Department, MIN(AnnualSalaryINR) AS MINSal
                          MAX(AnnualSalaryINR) AS MAXSal
       COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY DEPARTMENT
       ORDER BY Department;

--4.4  Salary By EmploymentStatus
       SELECT EmploymentStatus, AVG(AnnualSalaryINR) AS AVGSal,
       COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY EmploymentStatus
       ORDER BY AVGSal DESC;

--4.5  Salary By JobRole
       SELECT JobRole,
       AVG(AnnualSalaryINR) AS AverageSalary,
       COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY JobRole
       ORDER BY AverageSalary DESC;

--4.6  Salary By EducationLevel
       SELECT EducationLevel,
       AVG(AnnualSalaryINR) AS AverageSalary,
       COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY EducationLevel
       ORDER BY AverageSalary DESC;

--4.7  Salary By Experience\Tenure
       SELECT TenureYears,
       AVG(AnnualSalaryINR) AS AverageSalary
       FROM hr_employees
       GROUP BY TenureYears
       ORDER BY TenureYears;

--4.8  Highest-Paid Role
       SELECT JobRole,
       AVG(AnnualSalaryINR) AS AverageSalary
       FROM hr_employees
       GROUP BY JobRole
       ORDER BY AverageSalary DESC
       LIMIT 5;

-- ============================================================== --
                      --STEP 5--   
-- ============================================================== --

   GOAL 3:  PERFORMANCE & SATISFACTION ANALYSIS
   Business Objective:
   Evaluate employee performance and satisfaction levels.

-- ==============================================================

--5.1 Employee count by performance rating
      SELECT PerformanceRating,
      COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY PerformanceRating
      ORDER BY PerformanceRating;

--5.2 Employee count by job satisfaction rating
      SELECT JobSatisfaction,
      COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY JobSatisfaction
      ORDER BY JobSatisfaction;

--5.3 Average performance and job satisfaction by work mode
      SELECT WorkMode,
       AVG(PerformanceRating) AS AveragePerformanceRating,
       AVG(JobSatisfaction) AS AverageJobSatisfaction
      FROM hr_employees
      GROUP BY WorkMode
      ORDER BY WorkMode;

--5.4 Average job satisfaction by performance rating
      SELECT PerformanceRating,
       AVG(JobSatisfaction) AS AverageJobSatisfaction,
       COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY PerformanceRating
      ORDER BY PerformanceRating;

-- ============================================================== --
                      --STEP 6--
-- ============================================================== --

   GOAL 4: ATTRITION ANALYSIS
   Business Objective:
   Identify workforce exit patterns and attrition trends.

-- =============================================================

--6.1 Count employees who left
      SELECT COUNT(*) AS EmployeesWhoLeft
      FROM hr_employees
      WHERE ExitDate IS NOT NULL;

--6.2 Attrition Count Rate
      SELECT
      SUM(ExitDate IS NOT NULL) AS EmployeesWhoLeft,
      COUNT(*) AS TotalEmployees,
      ROUND(100.0 * SUM(ExitDate IS NOT NULL) / COUNT(*), 2) AS AttritionRatePercent
      FROM hr_employees;

--6.3 Employees who left by department
      SELECT Department,
      SUM(ExitDate IS NOT NULL) AS EmployeesWhoLeft
      FROM hr_employees
      GROUP BY Department
      ORDER BY EmployeesWhoLeft DESC;

--6.4 Attrition rate by work mode
      SELECT WorkMode,
      COUNT(*) AS TotalEmployees,
      SUM(ExitDate IS NOT NULL) AS EmployeesWhoLeft,
      ROUND(100.0 * SUM(ExitDate IS NOT NULL) / COUNT(*), 2) AS AttritionRatePercent
      FROM hr_employees
      GROUP BY WorkMode
      ORDER BY AttritionRatePercent DESC;

--6.5 Attrition rate by tenure
      SELECT TenureYears,
      COUNT(*) AS TotalEmployees,
      SUM(ExitDate IS NOT NULL) AS EmployeesWhoLeft,
      ROUND(100.0 * SUM(ExitDate IS NOT NULL) / COUNT(*), 2) AS AttritionRatePercent
      FROM hr_employees
      GROUP BY TenureYears
      ORDER BY TenureYears;

--6.6 Attrition rate by job role
      SELECT JobRole,
      COUNT(*) AS TotalEmployees,
      SUM(ExitDate IS NOT NULL) AS EmployeesWhoLeft,
      ROUND(100.0 * SUM(ExitDate IS NOT NULL) / COUNT(*), 2) AS AttritionRatePercent
      FROM hr_employees
      GROUP BY JobRole
      ORDER BY AttritionRatePercent DESC;

-- ============================================================== --
                          --STEP 7--        
-- ============================================================== --

    GOAL 5: TENURE & RETENTION ANALYSIS
    Business Objective:
    Analyze employee retention and tenure patterns.

-- ==============================================================

--7.1 Average tenure of all employees
      SELECT AVG(TenureYears) AS AverageTenureYears
      FROM hr_employees;

--7.2 Average tenure by department
      SELECT Department,
      AVG(TenureYears) AS AverageTenureYears,
      COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY Department
      ORDER BY AverageTenureYears DESC;

--7.3 Average tenure of active vs resigned employees
      SELECT
      CASE
         WHEN ExitDate IS NULL THEN 'Active'
        ELSE 'Resigned'
      END AS EmployeeStatus,
      AVG(TenureYears) AS AverageTenureYears,
      COUNT(*) AS EmployeeCount
      FROM hr_employees
      GROUP BY EmployeeStatus
      ORDER BY AverageTenureYears DESC;

--7.4 Employee count: new vs experienced
      SELECT
      CASE
        WHEN TenureYears <= 2 THEN 'New'
        WHEN TenureYears > 2 THEN 'Experienced'
        ELSE 'Unknown'
       END AS TenureGroup,
       COUNT(*) AS EmployeeCount
       FROM hr_employees
       GROUP BY TenureGroup;

-- ===================================================== --
   EXECUTIVE SUMMARY
-- ===================================================== --

-- The HR Analytics project analyzed 500 employee records
-- to understand workforce distribution, compensation,
-- performance, job satisfaction, attrition, and retention.

-- The organization has 500 employees, including 455 active
-- employees and 45 resigned employees, resulting in an
-- overall attrition rate of 9.00%.

-- The overall average annual salary is ₹79,535.63 and
-- the average employee tenure is 5.38 years.

-- Engineering has the largest workforce with 113 employees
-- and the highest average salary at ₹100,363.39.

-- Sales has the highest average performance rating at 3.56.

-- Human Resources and IT have the highest average job
-- satisfaction score at 3.41.

-- Operations has the highest department-level attrition
-- rate at 17.54%, while Sales has the lowest at 5.19%.

-- Active employees have an average tenure of 5.42 years,
-- compared with 4.97 years for resigned employees.

-- Employees working overtime have an average job satisfaction
-- score of 3.25, compared with 3.33 for employees who do
-- not work overtime.


-- ===================================================== --
   PROJECT INSIGHTS
-- ===================================================== --
   
   -- 1. Workforce Distribution:
   -- Engineering has the largest workforce with 113 employees,
   -- while Human Resources and Finance have the smallest
   -- workforce with 41 employees each.

   -- 2. Compensation Insight:
   -- Engineering has the highest average salary at ₹100,363.39,
   -- while Customer Support has the lowest average salary at ₹50,616.84.
   
   -- 3. Performance Insight:
   -- Sales has the highest average performance rating at 3.56,
   -- while Engineering and IT have the lowest average rating at 3.28.

   -- 4. Job Satisfaction Insight:
   -- Human Resources and IT have the highest average job
   -- satisfaction score at 3.41, while Customer Support
   -- has the lowest average satisfaction score at 3.20.  

   -- 5. Attrition Insight:
   -- Operations has the highest number of resigned employees
   -- with 10 exits, followed by Engineering with 9 exits.
   -- Customer Support has the lowest number of resignations
   -- with 3 exits.

   -- 6. Attrition Rate Insight:
   -- Operations has the highest department-level attrition rate
   -- at 17.54%, while Sales has the lowest at 5.19%.
   -- This calculation considers the total workforce size of
   -- each department.

   -- 7. Tenure & Retention Insight:
   -- Active employees have an average tenure of 5.42 years,
   -- compared with 4.97 years for resigned employees.
   -- This dataset shows a lower average tenure among employees
   -- who have resigned.

   -- 8. Overtime & Satisfaction Insight:
   -- Employees who work overtime have an average job satisfaction
   -- score of 3.25, compared with 3.33 for employees who do not
   -- work overtime.
   -- This dataset shows a lower average satisfaction score among
   -- employees who work overtime.



-- ===================================================== --
   PROJECT CONCLUSION
-- ===================================================== --

-- This project analyzed workforce, compensation,
-- performance, satisfaction, attrition, and retention
-- using SQL.

-- The analysis helped identify workforce distribution,
-- salary trends, employee performance patterns,
-- attrition trends, and retention insights.

-- The results were further visualized using Power BI
-- dashboards for business decision-making.