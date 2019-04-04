SET SERVEROUTPUT ON; 

DECLARE 
    emp_id employees.employee_id%TYPE := -2;
    emp_name employees.last_name%TYPE;
 
 -- user-defined exception 
   error_id  EXCEPTION; 
   
 BEGIN 
    IF emp_id < 1 THEN 
        RAISE error_id; 
    ELSE
       SELECT  last_name INTO  emp_name
       FROM employees 
       WHERE employee_id = emp_id;  
       DBMS_OUTPUT.PUT_LINE ('Name: '||  emp_name); 
     END IF;
     
    EXCEPTION 
        WHEN error_id THEN 
          dbms_output.put_line('ID must be greater (or equal) than 1!'); 
    
       WHEN no_data_found THEN 
          dbms_output.put_line('No such employee!'); 
       WHEN others THEN 
          dbms_output.put_line('Just an Error!'); 
END; 
/




