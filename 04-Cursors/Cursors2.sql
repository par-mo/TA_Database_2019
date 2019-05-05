/*
Database Course 
Session 4
18/03/2019
Author: M. Parhizkar 
*/



 SET SERVEROUTPUT ON; 
 DECLARE
      CURSOR emps
      IS SELECT *
           FROM employees
          WHERE ROWNUM < 6
           ORDER BY 1;
  
         emp employees%ROWTYPE;
         ROW NUMBER := 1;
      BEGIN
        OPEN emps;
        FETCH emps INTO emp;
              DBMS_OUTPUT.PUT_LINE('Outside the loop ' ||ROW|| ' of ' ||
                                 emps%ROWCOUNT);
        LOOP
          IF emps%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Looping over record ' ||ROW|| ' of ' ||
                                 emps%ROWCOUNT);
            -- emps%ROWCOUNT: Only valide inside the loop 
            FETCH emps INTO emp;
            ROW := ROW + 1;
          ELSIF emps%NOTFOUND THEN
            EXIT;
          END IF;
       END LOOP;
 
        IF emps%ISOPEN THEN
         CLOSE emps;
       END IF;
      END;
    /
    