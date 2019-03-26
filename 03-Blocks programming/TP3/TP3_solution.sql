
SET serveroutput on;

 --------------------Q. 1----------------------------
DECLARE
    var_id employees.employee_id%TYPE := 9;
    var_id2 employees.employee_id%TYPE := 10;
    var_sal employees.salary%TYPE;
BEGIN
    SELECT salary INTO var_sal
    FROM employees
    WHERE employee_id = var_id2;
    UPDATE employees SET salary = (SELECT salary FROM employees WHERE employee_id = var_id) WHERE employee_id = var_id2;
    UPDATE employees SET salary = var_sal WHERE employee_id = var_id;
END;
/

 -------------------Q. 2----------------------------
SET SERVEROUTPUT ON;
DECLARE
    n_id employees.employee_id%TYPE := &employee_id;
    n_dept employees.department_id%TYPE;
    n_sal employees.salary%TYPE;
    n_com employees.commission_pct%TYPE;
    n_date employees.hire_date%TYPE;
BEGIN
    IF (n_id >= 1) AND (n_id <= 10) THEN
        SELECT department_id INTO n_dept
        FROM employees
        WHERE employee_id = n_id;
            SELECT salary, commission_pct, hire_date INTO n_sal, n_com, n_date
            FROM employees
            WHERE employee_id = n_id;
            IF (n_sal > 10000) THEN
                    UPDATE employees SET commission_pct = n_com + .40 WHERE employee_id = n_id;
                    DBMS_OUTPUT.PUT_LINE('Employee n°' || n_id || ' got a 40% augmentation');
            ELSIF (n_sal < 10000 AND n_date < DATE '2009-03-19') THEN
                
                    UPDATE employees SET commission_pct = n_com + .35 WHERE employee_id = n_id;
                    DBMS_OUTPUT.PUT_LINE('Employee n°' || n_id || ' got a 35% augmentation');
               
            ELSIF (n_sal < 3000) THEN
                 
                    UPDATE employees SET commission_pct = n_com + .25 WHERE employee_id = n_id;
                    DBMS_OUTPUT.PUT_LINE('Employee n°' || n_id || ' got a 25% augmentation');
               
            ELSE             
                    UPDATE employees SET commission_pct = n_com + .15 WHERE employee_id = n_id;
                    DBMS_OUTPUT.PUT_LINE('Employee n°' || n_id || ' got a 15% augmentation');
        	END IF;
            END IF;
END;
/
/--------------------Q. 3----------------------------
SET SERVEROUTPUT ON; 
DECLARE
    var_lastname employees.last_name%TYPE := '&last_name';
    var_firstname employees.first_name%TYPE := '&first_name';
    

    check_firstname employees.first_name%TYPE;
    check_lastname employees.last_name%TYPE;
    check_employee employees%ROWTYPE;
    n_id employees.employee_id%TYPE;
    n_check NUMBER(1) := 0;
BEGIN
    FOR emp_id_index IN 1..10 LOOP
        SELECT last_name, first_name INTO check_lastname, check_firstname
        FROM employees
        WHERE employee_id = emp_id_index;
        IF (var_lastname = check_lastname) AND (var_firstname = check_firstname) THEN
            n_check := 1;
            SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
            INTO check_employee FROM employees
            WHERE last_name = var_lastname;
        END IF;
    END LOOP;
    IF (n_check = 1) THEN
        DBMS_OUTPUT.PUT_LINE('This employee already exists !');
        DBMS_OUTPUT.PUT_LINE('Last name : ' || check_employee.last_name);
        DBMS_OUTPUT.PUT_LINE('First name : ' || check_employee.first_name);
        DBMS_OUTPUT.PUT_LINE('Hire date : ' || check_employee.hire_date);
        DBMS_OUTPUT.PUT_LINE('Job ID : ' || check_employee.job_id);
        DBMS_OUTPUT.PUT_LINE('Salary : ' || check_employee.salary);
        DBMS_OUTPUT.PUT_LINE('Commission % : ' || check_employee.commission_pct);
        DBMS_OUTPUT.PUT_LINE('Manager ID : ' || check_employee.manager_id);
        DBMS_OUTPUT.PUT_LINE('Department ID : ' || check_employee.department_id);
    ELSE
        INSERT INTO employees (employee_id,last_name,first_name,job_id,manager_id) VALUES (12333, var_lastname, var_firstname, 0001, 0001);
    END IF;
END;

--------------------Q. 4----------------------------
SET SERVEROUTPUT ON; 
DECLARE
    var_year        NUMBER;
    index_month         DATE;
    n_count_month   NUMBER(4); 
    

BEGIN
SELECT hired_year INTO var_year FROM(
    SELECT hired_year, COUNT(*) AS hiring FROM(
        SELECT hire_date, EXTRACT(YEAR FROM hire_date) AS hired_year FROM employees) 
    GROUP BY hired_year)
    WHERE hiring = (SELECT MAX(hiring) FROM (
                                SELECT hired_year, COUNT(*) AS hiring FROM(
                                    SELECT hire_date, EXTRACT(YEAR FROM hire_date) AS hired_year FROM employees) 
                                GROUP BY hired_year));
    
    
    DBMS_OUTPUT.PUT_LINE('Year with max recuitment : ' || var_year);
 
     FOR index_month IN 1..12 
    LOOP
        SELECT COUNT(*) 
        INTO n_count_month 
        FROM employees 
        WHERE EXTRACT(YEAR FROM hire_date) = var_year AND EXTRACT (MONTH FROM hire_date) = index_month;
        
        DBMS_OUTPUT.PUT_LINE('Month ' ||index_month||' of ' ||var_year || ' : ' || n_count_month || ' person got employed.');
    END LOOP;
 
 
 
END;



------------------------------------------
 
