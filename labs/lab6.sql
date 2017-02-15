-- QUESTION 1
-- Do this before the next questions
-- 1 SET AUTOCOMMIT ON (do this each time you log on) so any updates, deletes and inserts are automatically committed before you exit from Oracle.
-- 2 Make sure you exist as an employee with a NULL salary and 0.2 commission_pct in department 90.
-- 3 Change the salary of the employees with a last name of Matos and Whalen to be 2500.
-- No answer required



-- QUESTION 2
-- Using sub-queries for all of the next questions
-- Display the last names of all employees who are in the same department as the employee named Abel.
-- SQL:
SELECT LAST_NAME
FROM   EMPLOYEES
WHERE  DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE LAST_NAME = 'Abel');
-- OUTPUT:
-- LAST_NAME               
-- -------------------------
-- Zlotkey                  
-- Abel                     
-- Taylor    


-- QUESTION 3
-- Display the last name of the lowest paid employee(s)
-- Here is a hint to start
-- SELECT LAST_NAME
--   FROM EMPLOYEES
--   WHERE SALARY =
-- SQL:
SELECT LAST_NAME
FROM   EMPLOYEES
WHERE  SALARY = (SELECT MIN(SALARY)
                 FROM EMPLOYEES);
-- OUTPUT:
-- LAST_NAME               
-- -------------------------
-- Matos                    
-- Vargas                   
-- Whalen  


-- QUESTION 4
-- Display the city that the lowest paid employee(s) are located in.
-- Hint: needs join and subquery
-- SQL:
SELECT L.CITY
FROM   LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
WHERE  L.LOCATION_ID = D.LOCATION_ID
AND    D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND    E.SALARY = (SELECT MIN(SALARY)
                   FROM EMPLOYEES);        
-- OUTPUT:
-- CITY                         
-- ------------------------------
-- South San Francisco           
-- South San Francisco           
-- Seattle


-- QUESTION 5
-- Display the last name of the lowest paid employee(s) in each department
-- SQL:
SELECT LAST_NAME
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                  FROM EMPLOYEES
                                  GROUP BY DEPARTMENT_ID);
-- OUTPUT:
-- LAST_NAME               
-- -------------------------
-- Matos                    
-- Taylor                   
-- De Haan                  
-- Fay                      
-- Lorentz                  
-- Whalen                   
-- Vargas                   
-- Gietz                    
-- Kochhar                  
--  9 rows selected



-- QUESTION 6
-- Display the last name of the lowest paid employee(s) in each city
-- SQL:
SELECT LAST_NAME
FROM   EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID)
                 JOIN LOCATIONS   USING (LOCATION_ID)
WHERE (CITY, SALARY) IN (SELECT CITY, MIN(SALARY)
                         FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID)
                                        JOIN LOCATIONS   USING (LOCATION_ID)
                         GROUP BY CITY);
-- OUTPUT:
-- LAST_NAME               
-- -------------------------
-- Whalen                   
-- Vargas                   
-- Fay                      
-- Lorentz                  
-- Taylor


-- QUESTION 7
-- Display last name and salary for all employees who earn less than the lowest salary in ANY department.
-- Sort the output by top salaries first and then by last name.
-- SQL:
SELECT   LAST_NAME, SALARY
FROM     EMPLOYEES
WHERE   (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                    FROM EMPLOYEES
                                    GROUP BY (DEPARTMENT_ID))
ORDER BY SALARY DESC, LAST_NAME;
-- OUTPUT:
-- LAST_NAME                     SALARY
-- ------------------------- ----------
-- De Haan                        17000
-- Kochhar                        17000
-- Taylor                          8600
-- Gietz                           8300
-- Fay                             6000
-- Whalen                          4400
-- Lorentz                         4200
-- Vargas                          2500
--  8 rows selected 


-- QUESTION 8
-- Display last name, job title and salary for all employees whose salary matches any of the salaries from the IT Department.
-- Do NOT use Join method.
-- Sort the output by salary ascending first and then by last_name
-- SQL:
SELECT   LAST_NAME, JOB_ID, SALARY
FROM     EMPLOYEES
WHERE    SALARY = ANY (SELECT SALARY
                       FROM EMPLOYEES
                       WHERE DEPARTMENT_ID = 60)
ORDER BY SALARY, LAST_NAME;
-- OUTPUT:
-- LAST_NAME                 JOB_ID         SALARY
-- ------------------------- ---------- ----------
-- Lorentz                   IT_PROG          4200
-- Ernst                     IT_PROG          6000
-- Fay                       MK_REP           6000
-- Hunold                    IT_PROG          9000