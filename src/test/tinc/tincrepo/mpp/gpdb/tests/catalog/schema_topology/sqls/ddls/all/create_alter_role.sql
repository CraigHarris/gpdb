-- 
-- @created 2009-01-27 14:00:00
-- @modified 2013-06-24 17:00:00
-- @tags ddl schema_topology
-- @description This ddl comprises of create, alter roles

\c db_test_bed
--start_ignore
DROP ROLE db_role1;

--end_ignore

CREATE ROLE db_role1 WITH SUPERUSER CREATEDB  INHERIT LOGIN CONNECTION LIMIT  1 ENCRYPTED PASSWORD 'passwd';
CREATE ROLE db_role2 WITH NOSUPERUSER NOCREATEDB  NOINHERIT NOLOGIN  UNENCRYPTED PASSWORD 'passwd';
CREATE ROLE db_role3 WITH NOCREATEROLE NOCREATEUSER;
CREATE ROLE db_role4 WITH CREATEROLE CREATEUSER;
CREATE ROLE db_role5 WITH VALID UNTIL '2009-02-13 01:51:15';
CREATE ROLE db_role6 WITH IN ROLE db_role1; 
CREATE GROUP db_grp1;
CREATE ROLE db_role7 WITH IN GROUP db_grp1; 
CREATE ROLE db_role8 WITH ROLE db_role7;
CREATE ROLE db_role9 WITH ADMIN db_role8;
CREATE ROLE db_role10 WITH USER db_role1;
CREATE ROLE db_role11 SYSID 100 ;
--start_ignore
DROP RESOURCE QUEUE db_resque1;
--end_ignore
CREATE RESOURCE QUEUE db_resque1 ACTIVE THRESHOLD 2 COST THRESHOLD 2000.00;
CREATE ROLE db_role12 RESOURCE QUEUE db_resque1;


ALTER ROLE db_role1 WITH NOSUPERUSER NOCREATEDB  NOINHERIT NOLOGIN  UNENCRYPTED PASSWORD 'passwd';
ALTER ROLE db_role2 WITH SUPERUSER CREATEDB  INHERIT LOGIN CONNECTION LIMIT  1 ENCRYPTED PASSWORD 'passwd';
ALTER ROLE db_role3 WITH CREATEROLE CREATEUSER;
ALTER ROLE db_role4 WITH NOCREATEROLE NOCREATEUSER;
ALTER ROLE db_role5 WITH VALID UNTIL '2009-06-13 01:51:15';
ALTER ROLE db_role6 WITH CONNECTION LIMIT 5;
ALTER ROLE db_role7 WITH RESOURCE QUEUE db_resque1;
ALTER ROLE db_role8 RENAME TO new_role8; 
CREATE SCHEMA db_schema1;
ALTER ROLE db_role9 SET search_path TO db_schema1;
ALTER ROLE db_role9 RESET search_path ;
