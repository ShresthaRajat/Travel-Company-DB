-- basic sql commands

connect system;
1357 --system password 

--- if you forget password for any user
--- method to change password 
connect sys as sysdba;
password syspassword
alter user system identified by "new_password";


SELECT * FROM ALL_USERS; -- lists all users
SELECT table_name FROM user_tables;  -- lists all the tables in current user
select table_name FROM all_tables;  -- lists all the tables accessable by current user

-- create dump file before starting project
-- uni id = 1700xxx
EXP username/password file = uni_id.dmp
--- need to commit while writing code

DROP USER DEV CASCADE;

--- to create a user
CONNECT sys as sysdba;
CREATE USER ShresthaRajat IDENTIFIED BY pwrd;
ALTER USER ShresthaRajat ACCOUNT UNLOCK;
GRANT resource To ShresthaRajat;
GRANT create session TO ShresthaRajat;
CONNECT ShresthaRajat

-- to connect to a user
connect Rajat;
pwrd --password

CREATE TABLE Customer(
    cust_no INT not null,
    cust_name varchar(20) not null,
    address varchar(20),
    postal_area varchar(20)
    CONSTRAINT Customer_pk PRIMARY KEY (cust_no)
);

CREATE TABLE orders(
	order_no INT,
	order_date date,
	cust_no INT, 
	order_total INT,
	CONSTRAINT orders_PK PRIMARY KEY (order_no), 
	CONSTRAINT customer_FK
	FOREIGN KEY (cust_no)
	REFERENCES Customer (cust_no)
);

CREATE TABLE product(
	prod_no INT NOT NULL,
	prod_desc VARCHAR(120),
	unit_price INT,
	CONSTRAINT product_pk PRIMARY KEY (prod_no)
);

CREATE TABLE order_line(
	order_no INT NOT NULL, 
	prod_no INT NOT NULL,
	ordd_qty INT, 
	line_total INT, 
	CONSTRAINT order_line_pk PRIMARY KEY (order_no, prod_no), 
	CONSTRAINT product_fk
	FOREIGN KEY (prod_no)
	REFERENCES product(prod_no)
);


DESCRIBE Customer;
DESCRIBE orders;
DESCRIBE order_line;
DESCRIBE product;

SELECT prod_desc, unit_price FROM product;

SELECT * FROM product WHERE unit_price < 200;

SELECT * FROM Customer WHERE postal_area = 'NW';

SELECT * FROM orders WHERE cust_no = '100';

SELECT * FROM order_line WHERE ord_qty > '50';

SELECT * FROM orders WHERE cust_no = 100 
	AND order_date > '01-JAN-07' AND order_date < '31-JAN-07';

SELECT customer.cust_no, customer.cust_name, 
	orders.order_no, orders.order_date, 
	product.prod_no, product.prod_desc 
	FROM customer JOIN orders ON customer.cust_no = orders.cust_no 
	JOIN order_line ON orders.order_no = order_line.order_no 
	JOIN product ON order_line.prod_no = product.prod_no;



--- second example

CREATE TABLE DOCTOR(
	doctor_no INT,
	doctor_name VARCHAR(90),
	doctor_position VARCHAR(90),
	base_hospital VARCHAR(90),
	CONSTRAINT DOCTOR_PK 
	PRIMARY KEY (doctor_no)
);

CREATE TABLE PATIENT(
	patient_no INT,
	patient_name VARCHAR(90),
	patient_type VARCHAR(90),
	gender VARCHAR(90),
	CONSTRAINT PATIENT_PK 
	PRIMARY KEY (patient_no)
);

CREATE TABLE TREATMENT(
	doctor_no INT,
	patient_no INT,
	drug VARCHAR(90),
	CONSTRAINT TREATMENT_PK 
	PRIMARY KEY (doctor_no, patient_no),
	CONSTRAINT PATIENT_FK 
	FOREIGN KEY (patient_no)
	REFERENCES PATIENT (patient_no),
	CONSTRAINT DOCTOR_FK 
	FOREIGN KEY (doctor_no)
	REFERENCES DOCTOR (doctor_no)
);


SELECT customer.cust_no, customer.cust_name, 
	orders.order_no, orders.order_date, 
	product.prod_no, product.prod_desc 
	FROM customer JOIN orders ON customer.cust_no = orders.cust_no 
	JOIN order_line ON orders.order_no = order_line.order_no 
	JOIN product ON order_line.prod_no = product.prod_no;

SELECT doctor_name FROM DOCTOR WHERE doctor_position = 'Consultant';

SELECT TREATMENT.drug FROM TREATMENT 
	JOIN PATIENT ON PATIENT.patient_no = TREATMENT.patient_no
	WHERE patient_name = 'John';

SELECT TREATMENT.drug FROM TREATMENT 
	JOIN PATIENT ON PATIENT.patient_no = TREATMENT.patient_no
	JOIN DOCTOR ON DOCTOR.doctor_no = TREATMENT.doctor_no
	WHERE patient_name = 'John' AND doctor_no = 'D100';

SELECT TREATMENT.drug FROM TREATMENT
	JOIN DOCTOR ON DOCTOR.doctor_no = TREATMENT.doctor_no
	WHERE DOCTOR.doctor_name = 'Smith';




INSERT INTO employee VALUES (3, 'hari', '2-dec-2001', 3003, 'bpn');

commit;