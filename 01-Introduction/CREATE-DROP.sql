DROP TABLE Customers; 

CREATE TABLE Customers
(
CustomerId NUMBER (3) NOT NULL,
CustomerName VARCHAR2(20) NOT NULL,
Canton VARCHAR2(20) NOT NULL,
Sex NUMBER(1),
Age NUMBER (3),
Status CHAR(1)
);

DROP TABLE Customers_test; 

CREATE TABLE customers_test
( customer_id number(10) NOT NULL,
  customer_name varchar2(50) NOT NULL,
  address varchar2(50),
  city varchar2(50),
  state varchar2(25),
  zip_code varchar2(10),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);