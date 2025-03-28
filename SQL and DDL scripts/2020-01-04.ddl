-- Generated by Oracle SQL Developer Data Modeler 4.1.5.907
--   at:        2020-01-04 21:06:38 NPT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Activity
  (
    Activity_ID   VARCHAR2 (10) NOT NULL ,
    Activity_Name VARCHAR2 (125)
  ) ;
ALTER TABLE Activity ADD CONSTRAINT Activity_PK PRIMARY KEY ( Activity_ID ) ;


CREATE TABLE Customer
  (
    Customer_ID VARCHAR2 (10) NOT NULL ,
    First_Name  VARCHAR2 (55) NOT NULL ,
    Last_Name   VARCHAR2 (55) NOT NULL ,
    Address     VARCHAR2 (55) ,
    Phone_No    VARCHAR2 (55)
  ) ;
ALTER TABLE Customer ADD CONSTRAINT Customer_PK PRIMARY KEY ( Customer_ID ) ;


CREATE TABLE Customer_Package
  (
    Customer_ID VARCHAR2 (10) NOT NULL ,
    Package_ID  VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE Customer_Package ADD CONSTRAINT Customer_Package_PK PRIMARY KEY ( Package_ID, Customer_ID ) ;


CREATE TABLE Day_Activities
  (
    Package_ID  VARCHAR2 (10) NOT NULL ,
    DAY         VARCHAR2 (10) NOT NULL ,
    Activity_ID VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE Day_Activities ADD CONSTRAINT Day_Activities_PK PRIMARY KEY ( Activity_ID, Package_ID, DAY ) ;


CREATE TABLE Destination
  (
    Package_ID  VARCHAR2 (10) NOT NULL ,
    Destination VARCHAR2 (55) NOT NULL
  ) ;
ALTER TABLE Destination ADD CONSTRAINT Destination_Package_PK PRIMARY KEY ( Destination, Package_ID ) ;


CREATE TABLE Itinerary
  (
    Package_ID       VARCHAR2 (10) NOT NULL ,
    DAY              VARCHAR2 (10) NOT NULL ,
    Travel_Details   VARCHAR2 (125) ,
    Difficulty_Level VARCHAR2 (55) NOT NULL ,
    Status           VARCHAR2 (55)
  ) ;
ALTER TABLE Itinerary ADD CONSTRAINT Itenary_PK PRIMARY KEY ( DAY, Package_ID ) ;


CREATE TABLE Package_Guide
  (
    Package_ID VARCHAR2 (10) NOT NULL ,
    Guide_ID   VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE Package_Guide ADD CONSTRAINT Package_Guide_PK PRIMARY KEY ( Package_ID, Guide_ID ) ;


CREATE TABLE Packages
  (
    Package_ID   VARCHAR2 (10) NOT NULL ,
    Package_Name VARCHAR2 (55) NOT NULL ,
    Total_Days   INTEGER NOT NULL ,
    Difficulty   VARCHAR2 (55) NOT NULL ,
    Start_Date   DATE ,
    End_Date     DATE ,
    Tour_guide   VARCHAR2 (55)
  ) ;
ALTER TABLE Packages ADD CONSTRAINT Packages_PK PRIMARY KEY ( Package_ID ) ;


CREATE TABLE Role
  (
    Role        VARCHAR2 (55) NOT NULL ,
    Description VARCHAR2 (255)
  ) ;
ALTER TABLE Role ADD CONSTRAINT Role_PK PRIMARY KEY ( Role ) ;


CREATE TABLE Staff
  (
    Staff_ID   VARCHAR2 (10) NOT NULL ,
    First_Name VARCHAR2 (55) NOT NULL ,
    Last_Name  VARCHAR2 (55) NOT NULL ,
    Address    VARCHAR2 (55) ,
    Phone_No   VARCHAR2 (55) NOT NULL ,
    Role       VARCHAR2 (55) NOT NULL
  ) ;
ALTER TABLE Staff ADD CONSTRAINT Staff_PK PRIMARY KEY ( Staff_ID ) ;


ALTER TABLE Customer_Package ADD CONSTRAINT Customer_Package_Customer_FK FOREIGN KEY ( Customer_ID ) REFERENCES Customer ( Customer_ID ) ;

ALTER TABLE Customer_Package ADD CONSTRAINT Customer_Package_Packages_FK FOREIGN KEY ( Package_ID ) REFERENCES Packages ( Package_ID ) ;

ALTER TABLE Day_Activities ADD CONSTRAINT Day_Activities_Activity_FK FOREIGN KEY ( Activity_ID ) REFERENCES Activity ( Activity_ID ) ;

ALTER TABLE Day_Activities ADD CONSTRAINT Day_Activities_Itinerary_FK FOREIGN KEY ( DAY, Package_ID ) REFERENCES Itinerary ( DAY, Package_ID ) ;

ALTER TABLE Destination ADD CONSTRAINT Destination_Packages_FK FOREIGN KEY ( Package_ID ) REFERENCES Packages ( Package_ID ) ;

ALTER TABLE Itinerary ADD CONSTRAINT Itenary_Packages_FK FOREIGN KEY ( Package_ID ) REFERENCES Packages ( Package_ID ) ;

ALTER TABLE Package_Guide ADD CONSTRAINT Package_Guide_Packages_FK FOREIGN KEY ( Package_ID ) REFERENCES Packages ( Package_ID ) ;

ALTER TABLE Package_Guide ADD CONSTRAINT Package_Guide_Staff_FK FOREIGN KEY ( Guide_ID ) REFERENCES Staff ( Staff_ID ) ;

ALTER TABLE Staff ADD CONSTRAINT Staff_Role_FK FOREIGN KEY ( Role ) REFERENCES Role ( Role ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
