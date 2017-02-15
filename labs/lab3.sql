-- Question 2
-- For each employee in departments 20, 50 and 60 display last name, first name, salary, and salary increased by %7 and expressed as a whole number.
-- Label the column Good Salary
-- Also add a column that substracts the old salary from the new salary and multiplies by 12.
-- Label the column Annual Pay Increase
-- SQL:
SELECT LAST_NAME, 
       FIRST_NAME, 
       SALARY, 
       (SALARY * 1.07) AS "Good Salary", 
       (((SALARY * 1.07) - SALARY) * 12) AS "Annual Pay Increase"
FROM   EMPLOYEES
WHERE  DEPARTMENT_ID IN (20, 50, 60);
-- OUTPUT:
-- LAST_NAME                 FIRST_NAME               SALARY                             Good Salary                     Annual Pay Increase
-- ------------------------- -------------------- ---------- --------------------------------------- ---------------------------------------
-- Hartstein                 Michael                   13000                                   13910                                   10920
-- Fay                       Pat                        6000                                    6420                                    5040
-- Mourgos                   Kevin                      5800                                    6206                                    4872
-- Rajs                      Trenna                     3500                                    3745                                    2940
-- Davies                    Curtis                     3100                                    3317                                    2604
-- Matos                     Randall                    2600                                    2782                                    2184
-- Vargas                    Peter                      2500                                    2675                                    2100
-- Hunold                    Alexander                  9000                                    9630                                    7560
-- Ernst                     Bruce                      6000                                    6420                                    5040
-- Lorentz                   Diana                      4200                                    4494                                    3528
--  10 rows selected 



-- Question 3
-- Write a query that displays the employee's Full Name and Job Title in the following format:
-- DAVIES, CURTIES is Store Clerk
-- Only employees whose last names ends with S and first name start with C or K.
-- Give this column an appropriate label like Person and Job
-- Sort the result by the employees' last names
-- SQL:
SELECT  (UPPER(LAST_NAME) || ', ' || UPPER(FIRST_NAME) || ' is') AS "Person",
(CASE    JOB_ID 
         WHEN 'ST_CLERK' THEN 'Store Clerk'
         WHEN 'ST_MAN'   THEN 'Store Manager'
         WHEN 'SA_REP'   THEN 'Sales Representative'
         WHEN 'SA_MAN'   THEN 'Sales Manager'
 END)    AS "Job"
FROM     EMPLOYEES
WHERE    LAST_NAME LIKE '%s'
AND     (FIRST_NAME LIKE 'C%' OR FIRST_NAME LIKE 'K%')
ORDER BY LAST_NAME;
-- OUTPUT:
-- Person                                             Job                
-- -------------------------------------------------- --------------------
-- DAVIES, CURTIS is                                  Store Clerk         
-- MOURGOS, KEVIN is                                  Store Manager  



-- Question 4
-- For each employee hired before 1992, display the employee's last name, hire date and calculate the number of YEARS between TODAY and the date the employee was hired. Label the column Years worked.
-- Order your results by the number of years employed.
-- Round the number of years employed up to the closest whole number.
-- SQL:
SELECT   LAST_NAME,
         HIRE_DATE,
         ROUND((SYSDATE - HIRE_DATE) / 365) AS "Years worked"
FROM     EMPLOYEES
WHERE    HIRE_DATE < '01-FEB-92'
ORDER BY "Years worked";
-- OUTPUT:
-- LAST_NAME                 HIRE_DATE                            Years worked
-- ------------------------- --------- ---------------------------------------
-- Ernst                     21-MAY-91                                      26
-- Kochhar                   21-SEP-89                                      27
-- Hunold                    03-JAN-90                                      27
-- Whalen                    17-SEP-87                                      29
-- King                      17-JUN-87                                      30



-- Question 5
-- Create a query that displays the city names, country codes and state province names, but only for those cities that start on S and have at least 8 characters in their name. If city does not have province name assigned, then put Unknown Province.
-- SQL:
SELECT CITY,
       COUNTRY_ID,
       NVL(STATE_PROVINCE, 'Unknown Province') AS "State Province"
FROM   LOCATIONS
WHERE  CITY LIKE 'S_______%';
-- OUTPUT: 
-- CITY                           CO State Province          
-- ------------------------------ -- -------------------------
-- Sao Paulo                      BR Sao Paulo                
-- Singapore                      SG Unknown Province         
-- South Brunswick                US New Jersey               
-- South San Francisco            US California               
-- Southlake                      US Texas                    
-- Stretford                      UK Manchester               
--  6 rows selected 



-- Question 6
-- Display each employee's last name, hire date, and salary review date, which is the first Tuesday after a year of service, but only for those hired after 1997.
-- Label the column REVIEW DAY.
-- Format the dates to appear in the format similar to
-- TUESDAY, August the Thirty-First of year 1998
-- Question 7
-- Run the following command and show the result
-- select to_timestamp(sysdate) from dual
-- SQL: 
SELECT LAST_NAME, 
       HIRE_DATE, 
       SALARY, 
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIRE_DATE, 12), 'TUESDAY'), 'fmDAY, MONTH "the" Ddspth "of YEAR" YYYY') AS "Review Day"
FROM   EMPLOYEES
WHERE  HIRE_DATE >= '01-FEB-97';
SELECT TO_TIMESTAMP(SYSDATE) FROM DUAL;
-- OUTPUT: 
-- LAST_NAME                 HIRE_DATE     SALARY Review Day                                                                                               
-- ------------------------- --------- ---------- ----------------------------------------------------------------------------------------------------------
-- Lorentz                   07-FEB-99       4200 TUESDAY, FEBRUARY the Eighth of YEAR 2000                                                                 
-- Mourgos                   16-NOV-99       5800 TUESDAY, NOVEMBER the Twenty-First of YEAR 2000                                                           
-- Matos                     15-MAR-98       2600 TUESDAY, MARCH the Sixteenth of YEAR 1999                                                                 
-- Vargas                    09-JUL-98       2500 TUESDAY, JULY the Thirteenth of YEAR 1999                                                                 
-- Zlotkey                   29-JAN-00      10500 TUESDAY, JANUARY the Thirtieth of YEAR 2001                                                               
-- Taylor                    24-MAR-98       8600 TUESDAY, MARCH the Thirtieth of YEAR 1999                                                                 
-- Grant                     24-MAY-99       7000 TUESDAY, MAY the Thirtieth of YEAR 2000                                                                   
-- Fay                       17-AUG-97       6000 TUESDAY, AUGUST the Eighteenth of YEAR 1998                                                               
--  8 rows selected 

-- TO_TIMESTAMP(SYSDATE)         
-- -------------------------------
-- 12-FEB-17 12.00.00.000000000 AM