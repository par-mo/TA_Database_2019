--Here is an example (from TP1) of a procedure that uses a Named System Exception:

CREATE OR REPLACE PROCEDURE add_new_director
   (director_id_in IN NUMBER, director_first_name_in IN VARCHAR2, director_last_name_in IN VARCHAR2,
   director_BD_in IN DATE, country_in IN VARCHAR2 )
IS

BEGIN
   INSERT INTO directors (director_id, director_first_name, director_last_name, director_BD, country)
   VALUES ( supplier_id_in, director_first_name_in,director_last_name_in , director_BD_in,country_in );

EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
      raise_application_error (-20001,'You have tried to insert a duplicate director_id.');

   WHEN OTHERS THEN
      raise_application_error (-20002,'An error has occurred inserting a director.');

END;

--------------------------Named Programmer-Defined Exception--------------------------
--Here is an example of a procedure that uses a Named Programmer-Defined Exception:

CREATE OR REPLACE PROCEDURE add_new_job
   (job_id_in VARCHAR2, job_title_in VARCHAR2, min_salary_in NUMBER , max_salary_in NUMBER, job_ok_not BOOLEAN)
IS
   no_jobs EXCEPTION;

BEGIN
   IF job_ok_not = FALSE THEN
      RAISE no_jobs; 

   ELSE
      INSERT INTO jobs (job_id, job_title, min_salary, max_salary  )
      VALUES ( job_id_in, job_title_in, min_salary_in,   max_salary_in ); 
   END IF;

EXCEPTION
   WHEN no_jobs THEN
      raise_application_error (-20001,'You must have jobs in order to submit the order.');

   WHEN OTHERS THEN
      raise_application_error (-20002,'An error has occurred inserting an order.');

END;
-------------------------- When others clause exceptions--------------------------


DECLARE
   v_zip   VARCHAR2(5) := '&sv_zip';
   v_city  VARCHAR2(15);
   v_state CHAR(2);
BEGIN
   SELECT city, state
     INTO v_city, v_state
     FROM zipcode
    WHERE zip = v_zip;
   DBMS_OUTPUT.PUT_LINE (v_city||', '||v_state);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;

--------------Defining TABLE Types----------------------
/*
PL/SQL tables help you move bulk data. They can store columns or rows of Oracle data, 
and they can be passed as parameters. So, PL/SQL tables make it easy to move collections 
of data into and out of database tables or between client-side applications and stored 
subprograms. You can even use PL/SQL tables of records to simulate local database tables.*/
SET SERVEROUTPUT ON; 
CREATE OR REPLACE PROCEDURE loadarray IS
   
       TYPE cust_table_type IS TABLE OF VARCHAR2(100)
            INDEX BY BINARY_INTEGER;
   
       cust_table  cust_table_type;
       indx   NUMBER := 0;
     BEGIN
   
      FOR crec IN (select EMPLOYEE_ID,
                   first_name ||' '|| last_name
                   AS name
                   from employees) LOOP
          cust_table(crec.EMPLOYEE_ID) := crec.name;
      END LOOP;
  
      indx := cust_table.FIRST;
      WHILE indx <= cust_table.LAST LOOP
        dbms_output.put_line( cust_table(indx) );
            indx := cust_table.NEXT(indx);
      END LOOP;
    END;
    /
    
  exec loadarray; 
  
  /*
  DECLARE
   TYPE EnameTabTyp IS TABLE OF employees.first_name%TYPE NOT NULL 
      INDEX BY BINARY_INTEGER;
  
  
  */
  
------------------------------Trigger Example---------------------------------
/*
The following program creates a row-level trigger for the employees table that 
would fire for INSERT or UPDATE or DELETE operations performed on the employees table. 
This trigger will display the salary difference between the old values and new values:
*/
CREATE OR REPLACE TRIGGER display_emp_sal_changes 
BEFORE DELETE OR INSERT OR UPDATE ON employees 
FOR EACH ROW 
WHEN (NEW.employee_ID > 0) 
DECLARE 
   sal_diff number; 
BEGIN 
   sal_diff := :NEW.salary  - :OLD.salary; 
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('New salary: ' || :NEW.salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
/ 


INSERT INTO employees (EMPLOYEE_ID,first_name,last_name,email,phone_number,
hire_date,job_id,salary,commission_pct,manager_id,departement_id)
VALUES (100	, Simon,	Xing,	SXING,	515.123.4567,	21.09.89,	AD_PRES	,24000,0.25,150			90 ); 
------------------------------------------------------------------










