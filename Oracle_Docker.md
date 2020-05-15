# Oracle Database in docker

___
## 1. Login into dockerhub and accept terms for oracle database enterprise


___
## 2. Login to docker store in cli (linux terminal or whindows powershell)

> docker login

NOTE: this requires setting up docker username and password first

___
## 3. Download/Pull docker image

> docker pull store/oracle/database-enterprise:12.2.0.1

___
## 4. run the docker image and map the port to 1521
  
> docker run -d -p 1521:1521 --name oracle store/oracle/database-enterprise:12.2.0.1

___
## 5. Run sqlplus inside the container 
> docker exec -it <Oracle-DB> bash -c "source /home/oracle/.bashrc; sqlplus /nolog"

___
## 6. Access the sys user with password : Oradoc_db1

> connect sys as sysdba;
> Oradoc_db1
> alter session set "_ORACLE_SCRIPT"=true;
___

## 7. Create a new user and grant them access
> create user rajat identified by rajat;
> grant all privileges to rajat ;
> select username from dba_users;
___
## 7. Use sql developer via SQL Developer

> username: sys as sysdba
> password: Oradoc_db1
 
> hostname: localhost
> port: 1521
> Servicename: ORCLCDB.localdomain

> create user rrrr identified rrrr;
> grant connect, resource, dba to rrrr;
 
> create user  ssss identified by ssss;
> grant connect, resource to ssss;
