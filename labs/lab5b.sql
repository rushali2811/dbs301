-- QUESTION 1
-- Display the location id, address, city, state and country for each location id. 
-- SQL:
SELECT L.LOCATION_ID,
       L.STREET_ADDRESS,
       L.CITY,
       L.STATE_PROVINCE,
       C.COUNTRY_NAME
FROM   LOCATIONS L LEFT JOIN COUNTRIES C
ON     L.COUNTRY_ID = C.COUNTRY_ID;
-- OUTPUT:
-- LOCATION_ID STREET_ADDRESS                           CITY                           STATE_PROVINCE            COUNTRY_NAME                           
-- ----------- ---------------------------------------- ------------------------------ ------------------------- ----------------------------------------
--        1000 1297 Via Cola di Rie                     Roma                                                     Italy                                   
--        1100 93091 Calle della Testa                  Venice                                                   Italy                                   
--        1200 2017 Shinjuku-ku                         Tokyo                          Tokyo Prefecture          Japan                                   
--        1300 9450 Kamiya-cho                          Hiroshima                                                Japan                                   
--        1400 2014 Jabberwocky Rd                      Southlake                      Texas                     United States of America                
--        1500 2011 Interiors Blvd                      South San Francisco            California                United States of America                
--        1600 2007 Zagora St                           South Brunswick                New Jersey                United States of America                
--        1700 2004 Charade Rd                          Seattle                        Washington                United States of America                
--        1800 147 Spadina Ave                          Toronto                        Ontario                   Canada                                  
--        1900 6092 Boxwood St                          Whitehorse                     Yukon                     Canada                                  
--        2000 40-5-12 Laogianggen                      Beijing                                                  China                                   
--        2100 1298 Vileparle (E)                       Bombay                         Maharashtra               India                                   
--        2200 12-98 Victoria Street                    Sydney                         New South Wales           Australia                               
--        2300 198 Clementi North                       Singapore                                                Singapore                               
--        2400 8204 Arthur St                           London                                                   United Kingdom                          
--        2500 Magdalen Centre, The Oxford Science Park Oxford                         Oxford                    United Kingdom                          
--        2600 9702 Chester Road                        Stretford                      Manchester                United Kingdom                          
--        2700 Schwanthalerstr. 7031                    Munich                         Bavaria                   Germany                                 
--        2800 Rua Frei Caneca 1360                     Sao Paulo                      Sao Paulo                 Brazil                                  
--        2900 20 Rue des Corps-Saints                  Geneva                         Geneve                    Switzerland                             
--        3000 Murtenstrasse 921                        Bern                           BE                        Switzerland                             
--        3100 Pieter Breughelstraat 837                Utrecht                        Utrecht                   Netherlands                             
--        3200 Mariano Escobedo 9991                    Mexico City                    Distrito Federal,         Mexico                                  
--  23 rows selected 



-- QUESTION 2
-- Display the employee id, last name, job, department name, and job grade for all employees. 	
-- SQL:
SELECT    E.EMPLOYEE_ID, 
          E.LAST_NAME, 
          E.JOB_ID, 
          D.DEPARTMENT_NAME, 
          GRADE
FROM      EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON        E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN JOB_GRADES
ON        E.SALARY BETWEEN LOWEST_SAL AND HIGHEST_SAL;
-- OUTPUT:
-- EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_NAME                G
-- ----------- ------------------------- ---------- ------------------------------ -
--         144 Vargas                    ST_CLERK   Shipping                       A
--         143 Matos                     ST_CLERK   Shipping                       A
--         142 Davies                    ST_CLERK   Shipping                       B
--         141 Rajs                      ST_CLERK   Shipping                       B
--         107 Lorentz                   IT_PROG    IT                             B
--         200 Whalen                    AD_ASST    Administration                 B
--         124 Mourgos                   ST_MAN     Shipping                       B
--         104 Ernst                     IT_PROG    IT                             C
--         202 Fay                       MK_REP     Marketing                      C
--         178 Grant                     SA_REP                                    C
--         206 Gietz                     AC_ACCOUNT Accounting                     C
--         176 Taylor                    SA_REP     Sales                          C
--         103 Hunold                    IT_PROG    IT                             C
--         149 Zlotkey                   SA_MAN     Sales                          D
--         174 Abel                      SA_REP     Sales                          D
--         205 Higgins                   AC_MGR     Accounting                     D
--         201 Hartstein                 MK_MAN     Marketing                      D
--         101 Kochhar                   AD_VP      Executive                      E
--         102 De Haan                   AD_VP      Executive                      E
--         100 King                      AD_PRES    Executive                      E
--  20 rows selected 



-- QUESTION 3
-- Display the employee id and last name of every employee along with the name and id of the employee's manager (if applicable).
-- SQL:
SELECT E.EMPLOYEE_ID, 
       E.LAST_NAME,
       M.LAST_NAME,
       M.EMPLOYEE_ID
FROM   EMPLOYEES E LEFT JOIN EMPLOYEES M
ON     E.MANAGER_ID = M.EMPLOYEE_ID;
-- OUTPUT:
-- EMPLOYEE_ID LAST_NAME                 LAST_NAME                 EMPLOYEE_ID
-- ----------- ------------------------- ------------------------- -----------
--         100 King                                                           
--         101 Kochhar                   King                              100
--         102 De Haan                   King                              100
--         103 Hunold                    De Haan                           102
--         104 Ernst                     Hunold                            103
--         107 Lorentz                   Hunold                            103
--         124 Mourgos                   King                              100
--         141 Rajs                      Mourgos                           124
--         142 Davies                    Mourgos                           124
--         143 Matos                     Mourgos                           124
--         144 Vargas                    Mourgos                           124
--         149 Zlotkey                   King                              100
--         174 Abel                      Zlotkey                           149
--         176 Taylor                    Zlotkey                           149
--         178 Grant                     Zlotkey                           149
--         200 Whalen                    Kochhar                           101
--         201 Hartstein                 King                              100
--         202 Fay                       Hartstein                         201
--         205 Higgins                   Kochhar                           101
--         206 Gietz                     Higgins                           205
--  20 rows selected



-- QUESTION 4
-- Display the employee id, last name of every employee and the name of the department and city that the employee is assigned to (if applicable).
-- SQL:
SELECT E.EMPLOYEE_ID, 
       E.LAST_NAME, 
       D.DEPARTMENT_NAME, 
       L.CITY
FROM   EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE  E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND    D.LOCATION_ID = L.LOCATION_ID;
-- OUTPUT:
-- EMPLOYEE_ID LAST_NAME                 DEPARTMENT_NAME                CITY                         
-- ----------- ------------------------- ------------------------------ ------------------------------
--         100 King                      Executive                      Seattle                       
--         101 Kochhar                   Executive                      Seattle                       
--         102 De Haan                   Executive                      Seattle                       
--         103 Hunold                    IT                             Southlake                     
--         104 Ernst                     IT                             Southlake                     
--         107 Lorentz                   IT                             Southlake                     
--         124 Mourgos                   Shipping                       South San Francisco           
--         141 Rajs                      Shipping                       South San Francisco           
--         142 Davies                    Shipping                       South San Francisco           
--         143 Matos                     Shipping                       South San Francisco           
--         144 Vargas                    Shipping                       South San Francisco           
--         149 Zlotkey                   Sales                          Oxford                        
--         174 Abel                      Sales                          Oxford                        
--         176 Taylor                    Sales                          Oxford                        
--         200 Whalen                    Administration                 Seattle                       
--         201 Hartstein                 Marketing                      Toronto                       
--         202 Fay                       Marketing                      Toronto                       
--         205 Higgins                   Accounting                     Seattle                       
--         206 Gietz                     Accounting                     Seattle                       
--  19 rows selected 



-- QUESTION 5
-- Display the name of each employee and the city they are assigned to (if applicable).
-- SQL:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME, L.CITY
FROM   EMPLOYEES E JOIN DEPARTMENTS D
ON E.  DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN   LOCATIONS L
ON     D.LOCATION_ID = L.LOCATION_ID;
-- OUTPUT:
-- NAME                                           CITY                         
-- ---------------------------------------------- ------------------------------
-- Steven King                                    Seattle                       
-- Neena Kochhar                                  Seattle                       
-- Lex De Haan                                    Seattle                       
-- Alexander Hunold                               Southlake                     
-- Bruce Ernst                                    Southlake                     
-- Diana Lorentz                                  Southlake                     
-- Kevin Mourgos                                  South San Francisco           
-- Trenna Rajs                                    South San Francisco           
-- Curtis Davies                                  South San Francisco           
-- Randall Matos                                  South San Francisco           
-- Peter Vargas                                   South San Francisco           
-- Eleni Zlotkey                                  Oxford                        
-- Ellen Abel                                     Oxford                        
-- Jonathon Taylor                                Oxford                        
-- Jennifer Whalen                                Seattle                       
-- Michael Hartstein                              Toronto                       
-- Pat Fay                                        Toronto                       
-- Shelley Higgins                                Seattle                       
-- William Gietz                                  Seattle                       
--  19 rows selected 



-- QUESTION 6
-- Display the name of each city and the names of employees assigned to that city (if applicable).
-- SQL:
SELECT L.CITY, E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE
FROM   LOCATIONS L JOIN DEPARTMENTS D
ON     L.LOCATION_ID = D.LOCATION_ID
JOIN   EMPLOYEES E
ON     D.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- OUTPUT:
-- CITY                           EMPLOYEE                                     
-- ------------------------------ ----------------------------------------------
-- Seattle                        Steven King                                   
-- Seattle                        Neena Kochhar                                 
-- Seattle                        Lex De Haan                                   
-- Southlake                      Alexander Hunold                              
-- Southlake                      Bruce Ernst                                   
-- Southlake                      Diana Lorentz                                 
-- South San Francisco            Kevin Mourgos                                 
-- South San Francisco            Trenna Rajs                                   
-- South San Francisco            Curtis Davies                                 
-- South San Francisco            Randall Matos                                 
-- South San Francisco            Peter Vargas                                  
-- Oxford                         Eleni Zlotkey                                 
-- Oxford                         Ellen Abel                                    
-- Oxford                         Jonathon Taylor                               
-- Seattle                        Jennifer Whalen                               
-- Toronto                        Michael Hartstein                             
-- Toronto                        Pat Fay                                       
-- Seattle                        Shelley Higgins                               
-- Seattle                        William Gietz                                 
--  19 rows selected 



-- QUESTION 7
-- Display all employees and all cities.
-- SQL:
SELECT          E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE, 
                L.CITY
FROM            EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
ON              E.DEPARTMENT_ID = D.DEPARTMENT_ID
FULL OUTER JOIN LOCATIONS L
ON              D.LOCATION_ID = L.LOCATION_ID;
-- OUTPUT:
-- EMPLOYEE                                       CITY                         
-- ---------------------------------------------- ------------------------------
--                                                Roma                          
--                                                Venice                        
--                                                Tokyo                         
--                                                Hiroshima                     
-- Diana Lorentz                                  Southlake                     
-- Bruce Ernst                                    Southlake                     
-- Alexander Hunold                               Southlake                     
-- Peter Vargas                                   South San Francisco           
-- Randall Matos                                  South San Francisco           
-- Curtis Davies                                  South San Francisco           
-- Trenna Rajs                                    South San Francisco           
-- Kevin Mourgos                                  South San Francisco           
--                                                South Brunswick               
--                                                Seattle                       
-- William Gietz                                  Seattle                       
-- Shelley Higgins                                Seattle                       
-- Jennifer Whalen                                Seattle                       
-- Lex De Haan                                    Seattle                       
-- Neena Kochhar                                  Seattle                       
-- Steven King                                    Seattle                       
-- Pat Fay                                        Toronto                       
-- Michael Hartstein                              Toronto                       
--                                                Whitehorse                    
--                                                Beijing                       
--                                                Bombay                        
--                                                Sydney                        
--                                                Singapore                     
--                                                London                        
-- Jonathon Taylor                                Oxford                        
-- Ellen Abel                                     Oxford                        
-- Eleni Zlotkey                                  Oxford                        
--                                                Stretford                     
--                                                Munich