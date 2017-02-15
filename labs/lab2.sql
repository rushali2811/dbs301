-- 1 Display the employee_id, last name and salary of employees earning in the range of $8000 to $15,000. Sort the output by top salaries first and then by last name.
-- SQL:
SELECT   EMPLOYEE_ID, 
         LAST_NAME, 
         SALARY 
FROM     EMPLOYEES
WHERE    SALARY BETWEEN 8000 AND 15000
ORDER BY SALARY DESC, LAST_NAME;
-- OUTPUT:
-- EMPLOYEE_ID LAST_NAME                     SALARY
-- ----------- ------------------------- ----------
--         201 Hartstein                      13000
--         205 Higgins                        12000
--         174 Abel                           11000
--         149 Zlotkey                        10500
--         103 Hunold                          9000
--         176 Taylor                          8600
--         206 Gietz                           8300
--  7 rows selected 



-- 2 Modify previous query (#1) so that additional condition is to display only if they work as Programmers or Sales Representatives. Use same sorting as before.
-- SQL:
SELECT   EMPLOYEE_ID, 
         LAST_NAME, 
         SALARY 
FROM     EMPLOYEES
WHERE    DEPARTMENT_ID IN (60, 80)
AND      SALARY BETWEEN 8000 AND 15000
ORDER BY SALARY DESC, LAST_NAME;
-- OUTPUT:
-- EMPLOYEE_ID LAST_NAME                     SALARY
-- ----------- ------------------------- ----------
--         174 Abel                           11000
--         149 Zlotkey                        10500
--         103 Hunold                          9000
--         176 Taylor                          8600



-- 3 The Human Resources department wants to find high salary and low salary employees. Modify previous query (#2) so that it displays the same job titles but for people who earn outside the given salary range from question 1. Use same sorting as before.
-- SQL:
SELECT   EMPLOYEE_ID, 
         LAST_NAME, 
         SALARY
FROM     EMPLOYEES
WHERE    DEPARTMENT_ID IN (60, 80)
AND     (SALARY < 8000 OR SALARY > 15000)
ORDER BY SALARY DESC, LAST_NAME;
-- OUTPUT:
-- EMPLOYEE_ID LAST_NAME                     SALARY
-- ----------- ------------------------- ----------
--         104 Ernst                           6000
--         107 Lorentz                         4200



-- 4 The company needs a list of long term employees, in order to give them a thank you dinner. Display the last name, job_id and salary of employees hired before 1998. List the most recently hired employees first.
-- SQL:
SELECT   LAST_NAME, 
         JOB_ID, 
         SALARY
FROM     EMPLOYEES
WHERE    HIRE_DATE < '01-JAN-98'
ORDER BY HIRE_DATE DESC;
-- OUTPUT:
-- LAST_NAME                 JOB_ID         SALARY
-- ------------------------- ---------- ----------
-- Fay                       MK_REP           6000
-- Davies                    ST_CLERK         3100
-- Abel                      SA_REP          11000
-- Hartstein                 MK_MAN          13000
-- Rajs                      ST_CLERK         3500
-- Gietz                     AC_ACCOUNT       8300
-- Higgins                   AC_MGR          12000
-- De Haan                   AD_VP           17000
-- Ernst                     IT_PROG          6000
-- Hunold                    IT_PROG          9000
-- Kochhar                   AD_VP           17000
-- Whalen                    AD_ASST          4400
-- King                      AD_PRES         24000
--  13 rows selected 



-- 5 Modify previous query (#4) so that it displays only employees earning more than $10,000. List the output by job title alphabetically and then by highest paid employees.
-- SQL:
SELECT   LAST_NAME, 
         JOB_ID, 
         SALARY
FROM     EMPLOYEES
WHERE    HIRE_DATE < '01-JAN-98'
AND      SALARY > 10000
ORDER BY JOB_ID, SALARY DESC;
-- OUTPUT:
-- LAST_NAME                 JOB_ID         SALARY
-- ------------------------- ---------- ----------
-- Higgins                   AC_MGR          12000
-- King                      AD_PRES         24000
-- Kochhar                   AD_VP           17000
-- De Haan                   AD_VP           17000
-- Hartstein                 MK_MAN          13000
-- Abel                      SA_REP          11000
--  6 rows selected 



-- 6 Display the job titles and full names of employees whose first name contains an ‘e’ or ‘E’ anywhere. The output should look like:
-- SQL:
SELECT   JOB_ID, FIRST_NAME || ' ' || LAST_NAME "Full name"
FROM     EMPLOYEES
WHERE    FIRST_NAME LIKE '%E%' 
OR       FIRST_NAME LIKE '%e%'
ORDER BY JOB_ID;
-- OUTPUT:
-- JOB_ID     Full name                                    
-- ---------- ----------------------------------------------
-- AC_MGR     Shelley Higgins                               
-- AD_ASST    Jennifer Whalen                               
-- AD_PRES    Steven King                                   
-- AD_VP      Neena Kochhar                                 
-- AD_VP      Lex De Haan                                   
-- IT_PROG    Alexander Hunold                              
-- IT_PROG    Bruce Ernst                                   
-- MK_MAN     Michael Hartstein                             
-- SA_MAN     Eleni Zlotkey                                 
-- SA_REP     Ellen Abel                                    
-- SA_REP     Kimberely Grant                               
-- ST_CLERK   Trenna Rajs                                   
-- ST_CLERK   Peter Vargas                                  
-- ST_MAN     Kevin Mourgos                                 
--  14 rows selected 



-- 7 Create a report to display last name, salary, and commission percent for all employees that earn a commission.
-- SQL:
SELECT LAST_NAME, 
       SALARY, 
       COMMISSION_PCT
FROM   EMPLOYEES
WHERE  COMMISSION_PCT IS NOT NULL;
-- OUTPUT:
-- LAST_NAME                     SALARY COMMISSION_PCT
-- ------------------------- ---------- --------------
-- Zlotkey                        10500             .2
-- Abel                           11000             .3
-- Taylor                          8600             .2
-- Grant                           7000            .15



-- 8 Do the same as question 7, but put the report in order of descending salaries.
-- SQL:
SELECT   LAST_NAME, 
         SALARY, 
         COMMISSION_PCT
FROM     EMPLOYEES
WHERE    COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC;
-- OUTPUT:
-- LAST_NAME                     SALARY COMMISSION_PCT
-- ------------------------- ---------- --------------
-- Abel                           11000             .3
-- Zlotkey                        10500             .2
-- Taylor                          8600             .2
-- Grant                           7000            .15



-- 9 Do the same as 8, but use a numeric value instead of a column name to do the sorting.
-- SQL:
SELECT   LAST_NAME, 
         SALARY, 
         COMMISSION_PCT
FROM     EMPLOYEES
WHERE    COMMISSION_PCT IS NOT NULL
ORDER BY 2 DESC;
-- OUTPUT:
-- LAST_NAME                     SALARY COMMISSION_PCT
-- ------------------------- ---------- --------------
-- Abel                           11000             .3
-- Zlotkey                        10500             .2
-- Taylor                          8600             .2
-- Grant                           7000            .15