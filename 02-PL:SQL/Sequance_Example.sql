SET SERVEROUTPUT ON; 

--Creat a new Table
DROP TABLE customers_test2; 

CREATE TABLE customers_test2
( customers_id number(2) NOT NULL,
  customers_name varchar2(50) NOT NULL,
  address varchar2(50),
  city varchar2(10),
  state varchar2(25),
  zip_code varchar2(10),
  CONSTRAINT customers_pk PRIMARY KEY (customers_id)
);

-- Creat a new sequance 
DROP SEQUENCE customers_seq; 

CREATE SEQUENCE customers_seq
  MINVALUE 1
  MAXVALUE 99
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
 
   
INSERT INTO customers_test2
(customers_id, customers_name, address,city,state,zip_code)
VALUES
(customers_seq.NEXTVAL, 'Kraft', 'Av de France, 521', 'Geneva', 'GE', '1201');


INSERT INTO customers_test2
(customers_id, customers_name, address,city,state,zip_code)
VALUES
(customers_seq.NEXTVAL, 'Benjamin', 'Av de Morges, 156', 'Lausanne', 'VD', '1000');

 SELECT * from customers_test2; 