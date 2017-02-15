-- QUESTION 1
-- Display the department name, city, street address and postal code for all departments sorted by city and department name.
-- SQL:
SELECT   D.DEPARTMENT_NAME, 
         L.CITY, 
         L.STREET_ADDRESS, 
         L.POSTAL_CODE
FROM     DEPARTMENTS D, LOCATIONS L
WHERE    D.LOCATION_ID = L.LOCATION_ID
ORDER BY L.CITY, D.DEPARTMENT_ID;
-- OUTPUT:
-- DEPARTMENT_NAME                CITY                           STREET_ADDRESS                           POSTAL_CODE
-- ------------------------------ ------------------------------ ---------------------------------------- ------------
-- Sales                          Oxford                         Magdalen Centre, The Oxford Science Park OX9 9ZB     
-- Administration                 Seattle                        2004 Charade Rd                          98199       
-- Executive                      Seattle                        2004 Charade Rd                          98199       
-- Accounting                     Seattle                        2004 Charade Rd                          98199       
-- Contracting                    Seattle                        2004 Charade Rd                          98199       
-- Shipping                       South San Francisco            2011 Interiors Blvd                      99236       
-- IT                             Southlake                      2014 Jabberwocky Rd                      26192       
-- Marketing                      Toronto                        147 Spadina Ave                          M5V 2L7     
--  8 rows selected 



-- QUESTION 2
-- Display full name of the employees using format of Last, First, their hire date and salary together with their department name and city, but only for departments which names start with an A or S sorted by department name and employee name.
-- SQL:
SELECT   E.LAST_NAME || ', ' || E.FIRST_NAME AS FULLNAME, 
         E.HIRE_DATE, 
         E.SALARY, 
         D.DEPARTMENT_NAME, 
         L.CITY
FROM     EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE    E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND      D.LOCATION_ID = L.LOCATION_ID
AND      SUBSTR(D.DEPARTMENT_NAME,1,1) IN ('A','S')
ORDER BY 4, 1;
-- OUTPUT:
-- FULLNAME                                        HIRE_DATE     SALARY DEPARTMENT_NAME                CITY                         
-- ----------------------------------------------- --------- ---------- ------------------------------ ------------------------------
-- Gietz, William                                  07-JUN-94       8300 Accounting                     Seattle                       
-- Higgins, Shelley                                07-JUN-94      12000 Accounting                     Seattle                       
-- Whalen, Jennifer                                17-SEP-87       4400 Administration                 Seattle                       
-- Abel, Ellen                                     11-MAY-96      11000 Sales                          Oxford                        
-- Taylor, Jonathon                                24-MAR-98       8600 Sales                          Oxford                        
-- Zlotkey, Eleni                                  29-JAN-00      10500 Sales                          Oxford                        
-- Davies, Curtis                                  29-JAN-97       3100 Shipping                       South San Francisco           
-- Matos, Randall                                  15-MAR-98       2600 Shipping                       South San Francisco           
-- Mourgos, Kevin                                  16-NOV-99       5800 Shipping                       South San Francisco           
-- Rajs, Trenna                                    17-OCT-95       3500 Shipping                       South San Francisco           
-- Vargas, Peter                                   09-JUL-98       2500 Shipping                       South San Francisco           
--  11 rows selected  



-- QUESTION 3
-- Display the full name of the manager of each department in states/provinces of Ontario, California 3 and Washington along with the department name, city, postal code and province name.   Sort the output by city and then by department name.
-- SQL:
SELECT   E.FIRST_NAME || ' ' || E.LAST_NAME AS "FULLNAME", 
         D.DEPARTMENT_NAME, 
         L.CITY, 
         L.POSTAL_CODE, 
         L.STATE_PROVINCE
FROM     EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE    E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND      D.LOCATION_ID = L.LOCATION_ID
AND      L.STATE_PROVINCE IN ('Ontario', 'California', 'Washington')
AND      (E.JOB_ID LIKE '%MGR%'
OR       E.JOB_ID LIKE '%MAN%')
ORDER BY L.CITY, D.DEPARTMENT_NAME;
-- OUTPUT:
-- FULLNAME                                       DEPARTMENT_NAME                CITY                           POSTAL_CODE  STATE_PROVINCE          
-- ---------------------------------------------- ------------------------------ ------------------------------ ------------ -------------------------
-- Shelley Higgins                                Accounting                     Seattle                        98199        Washington               
-- Kevin Mourgos                                  Shipping                       South San Francisco            99236        California               
-- Michael Hartstein                              Marketing                      Toronto                        M5V 2L7      Ontario                  



-- QUESTION 4
-- Display employee’s last name and employee number along with their manager’s last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr# respectively.
-- SQL:
SELECT E.LAST_NAME AS "Employee",
       E.EMPLOYEE_ID AS "Emp#",
       M.LAST_NAME AS "Manager",
       M.MANAGER_ID AS "Mgr#"
FROM   EMPLOYEES E, EMPLOYEES M
WHERE  E.MANAGER_ID = M.EMPLOYEE_ID;
-- OUTPUT:
-- Employee                        Emp# Manager                         Mgr#
-- ------------------------- ---------- ------------------------- ----------
-- Kochhar                          101 King                                
-- De Haan                          102 King                                
-- Hunold                           103 De Haan                          100
-- Ernst                            104 Hunold                           102
-- Lorentz                          107 Hunold                           102
-- Mourgos                          124 King                                
-- Rajs                             141 Mourgos                          100
-- Davies                           142 Mourgos                          100
-- Matos                            143 Mourgos                          100
-- Vargas                           144 Mourgos                          100
-- Zlotkey                          149 King                                
-- Abel                             174 Zlotkey                          100
-- Taylor                           176 Zlotkey                          100
-- Grant                            178 Zlotkey                          100
-- Whalen                           200 Kochhar                          100
-- Hartstein                        201 King                                
-- Fay                              202 Hartstein                        100
-- Higgins                          205 Kochhar                          100
-- Gietz                            206 Higgins                          101
--  19 rows selected