-- Question 1 
-- Display the difference between the Average pay and Lowest pay in the company.
-- Name this result Real Amount.
-- SQL: 
SELECT (AVG(SALARY) - MIN(SALARY)) AS "Real Amount"
FROM    EMPLOYEES;
-- OUTPUT: 
--                             Real Amount
-- ---------------------------------------
 --                                   6275



-- Question 2 
-- Display the department number and Highest, Lowest and Average pay per each department. Name these results High, Low and Avg.
-- Sort the output so that the department with highest average salary is shown first.
-- SQL: 
SELECT   DEPARTMENT_ID, 
         MAX(SALARY) "High", 
         MIN(SALARY) "Low", 
         ROUND(AVG(SALARY)) "Avg"
FROM     EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 3 DESC;
-- OUTPUT: 
-- DEPARTMENT_ID       High        Low        Avg
-- ------------- ---------- ---------- ----------
--            90      24000      17000      19333
--            80      11000       8600      10033
--           110      12000       8300      10150
--                     7000       7000       7000
--            20      13000       6000       9500
--            10       4400       4400       4400
--            60       9000       4200       6400
--            50       5800       2500       3500
--  8 rows selected 



-- Question 3 
-- Display how many people work the same job in the same department. 
-- Name these results Dept#, Job and How Many. 
-- Include only jobs that involve more than one person.
-- Sort the output so that jobs with the most people involved are shown first.
-- SQL: 
SELECT   DEPARTMENT_ID AS "Dept#", 
         JOB_ID AS "Job", 
         COUNT(EMPLOYEE_ID) AS "How Many" 
FROM     EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING   COUNT(EMPLOYEE_ID) > 1
ORDER BY 3 DESC;
-- OUTPUT: 
--      Dept# Job          How Many
-- ---------- ---------- ----------
--         50 ST_CLERK            4
--         60 IT_PROG             3
--         80 SA_REP              2
--         90 AD_VP               2



-- Question 4 
-- For each job title display the job title and total amount paid each month for this type of the job. Exclude titles AD_PRES and AD_VP and also include only jobs that require more than $15,000.
-- Sort the output so that top paid jobs are shown first.
-- SQL:
SELECT   JOB_ID, 
         SUM(SALARY)
FROM     EMPLOYEES
GROUP BY JOB_ID
HAVING   JOB_ID !='AD_PRES'
AND      JOB_ID !='AD_VP'
AND      SUM(SALARY) > 15000
ORDER BY SUM(SALARY) DESC;
-- OUTPUT: 
-- JOB_ID                                 SUM(SALARY)
-- ---------- ---------------------------------------
-- SA_REP                                       26600
-- IT_PROG                                      19200



-- Question 5 
-- For each manager number display how many persons he / she supervises. Exclude managers with numbers 100, 101 and 102 and also include only those managers that supervise more than 2 persons.
-- Sort the output so that manager numbers with the most supervised persons are shown first.
-- SQL: 
SELECT   MANAGER_ID, 
         COUNT(EMPLOYEE_ID)
FROM     EMPLOYEES
GROUP BY MANAGER_ID
HAVING   MANAGER_ID != '100' 
AND      MANAGER_ID != '101' 
AND      MANAGER_ID != '102'
AND      COUNT(EMPLOYEE_ID) > 2
ORDER BY COUNT(EMPLOYEE_ID) DESC;
-- OUTPUT: 
-- MANAGER_ID                      COUNT(EMPLOYEE_ID)
-- ---------- ---------------------------------------
--        124                                       4
--        149                                       3



-- Question 6 
-- For each department show the latest and earliest hire date, BUT
-- - exclude departments 10 and 20 
-- - also exclude those departments where the last person was hired in this century. 
-- - Sort the output so that the most recent, meaning latest hire dates, are shown first.
-- SQL: 
SELECT   DEPARTMENT_ID, 
         MAX(HIRE_DATE), 
         MIN(HIRE_DATE)
FROM     EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING   DEPARTMENT_ID != '10'
AND      DEPARTMENT_ID != '20'
AND      MAX(HIRE_DATE) <= '31-DEC-99'
ORDER BY MAX(HIRE_DATE) DESC;
-- OUTPUT:
-- DEPARTMENT_ID MAX(HIRE_DATE) MIN(HIRE_DATE)
-- ------------- -------------- --------------
--            50 16-NOV-99      17-OCT-95     
--            60 07-FEB-99      03-JAN-90     
--           110 07-JUN-94      07-JUN-94     
--            90 13-JAN-93      17-JUN-87