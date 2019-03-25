---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
------------------------------TP4 Solution---------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
SET SERVEROUTPUT ON; 
/*Ecrire un bloc PL / SQL qui comprend une procédure "getEmployeeDetails" qui accepte
 un numéro d'employeur et retourne le nom de l'employeur et le salaire.
Le bloc principal doit appeler la procédure avec le numéro d'employeur 
«115» et produire les détails de cet employeur, y compris 
le salaire qui a été augmenté de 10%.
*/
DECLARE

cnum 		employees.employee_id%TYPE;
ccname 		employees.first_name%TYPE;
ccsalary 	employees.salary%TYPE;
status 		BOOLEAN;


PROCEDURE getemployeesdetails (
	employeesid 	IN 	employees.employee_id%TYPE,
	employeesname 	OUT 	employees.first_name%TYPE,
	employeessalary 	OUT	employees.salary%TYPE,
	status 		OUT 	BOOLEAN) IS
BEGIN
	SELECT first_name,salary
	INTO employeesname, employeessalary
	FROM employees C 
	WHERE C.employee_id= employeesid;
	status :=TRUE;
	EXCEPTION
	WHEN no_data_found THEN
	status :=FALSE;
END;
	
BEGIN
--main block
	cnum:= '115';
	getemployeesdetails(cnum,ccname,ccsalary,status);
	IF (status) THEN
		dbms_output.put_line(cnum || '  ' || ccname || '  ' || ccsalary *1.1);
	ELSE 
		dbms_output.put_line (' employees   ' || cnum ||  '  not  found');
	END IF;
END;
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
/*	Créez un script qui donne une liste des noms de département de la table de
 département en utilisant d'un curseur FOR loop.*/
SET SERVEROUTPUT ON;
DECLARE 
CURSOR c_department IS 
            SELECT department_name 
            FROM departments
            ORDER BY department_name;
            c_count depatments%ROWTYPE;

BEGIN 
FOR c_count in c_department
LOOP
 DBMS_OUTPUT.PUT_LINE (c.department_name);
END LOOP;
END;
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
/*Ecrire un script en utilisant "Explicit Cursor" pour le nom de l'employé 
(prénom et nom séparés par un espace), le salaire et la date d'embauche pour tous les
employés sont récupérés de la table des employés 
(trier par nom de famille + avec un incrément numérique pour chaque ligne).*/
CREATE SEQUENCE emp_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

DECLARE
    CURSOR c_employees IS SELECT first_name, last_name, hire_date, salary FROM employees;
    tmp employees%rowtype;
BEGIN
    FOR rec in c_employees
    LOOP
        dbms_output.put_line(emp_seq.NEXTVAL || '-' || 
        rec.first_name || ' ' ||  tmp.last_name || ' was hired at ' || rec.hire_date 
        || ' and will be paid until $' || rec.salary || '.');
    END LOOP;
END;
/
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
/*Ecrire un bloc PL / SQL avec deux « FOR-LOOP curseurs»: Le curseur parent appellera 
le ‘director_id’, ‘director_first_name’ et ‘director_last_name’ à partir de la 
table des directeurs, en considérant la condition (WHERE director_id >2 AND director_id <=5) 
et sortie une ligne avec cette information: pour chaque directeur, le curseur enfant
fera une boucle à travers tous les films que le
directeur dirige, en produisant ‘main_actor’ et la compagnie.*/

DECLARE
    v_dir director.director_id%TYPE;
    v_actor VARCHAR2(20);
    v_company VARCHAR(20);
    v_num NUMBER :=1 ;
    CURSOR c_film IS SELECT actor_id, company_id, title FROM films WHERE director_id = v_dir;
    CURSOR c_dir IS SELECT director_id, director_first_name, director_last_name
     FROM directors WHERE director_id > 2 AND director_id <=5;

BEGIN
    FOR rec_dir in c_dir
--------   first cursor loop    --------
    LOOP
        v_num := 1;
        v_dir := rec_dir.director_id;
        dbms_output.put_line('The director ' || v_dir || ': ' || rec_dir.director_first_name || ' ' ||  rec_dir.director_last_name );
        dbms_output.put_line('directed the following films: ');
        
        FOR rec_film in c_film
--------   second cursor loop    --------

        LOOP
            SELECT companies.company_name, main_actor.last_name INTO v_actor, v_company
                FROM films
                JOIN main_actor ON films.actor_id = main_actors.main_actor_id
                JOIN company ON films.company_id = companies.company_id
                WHERE films.title = rec_film.title;
            dbms_output.put_line(v_num ||'. ' || rec_film.title || 'Main Actor: ' || v_actor || ' -- Company: ' || v_company);
            v_num := v_num + 1;
        END LOOP;

    END LOOP;
END;
/

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


