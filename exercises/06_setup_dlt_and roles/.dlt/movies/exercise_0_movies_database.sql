--I granted privileges to role movie_analyst. The following privileges to do its work:
--read data from tables and views in public schema
--use dev_wh
--create views
--create tables
--create temporary tables

USE DATABASE MOVIES;
USE ROLE SECURITYADMIN;

CREATE ROLE MOVIE_ANALYST;

GRANT USAGE ON WAREHOUSE DEV_WH TO ROLE MOVIE_ANALYST; -- Grant Usage on the Warehouse

--Grant Usage and Read Access on the PUBLIC Schema
GRANT USAGE ON DATABASE MOVIES TO ROLE MOVIE_ANALYST;

GRANT SELECT ON ALL TABLES IN SCHEMA movies.staging TO ROLE MOVIE_ANALYST;
GRANT SELECT ON ALL VIEWS IN SCHEMA movies.staging TO ROLE MOVIE_ANALYST;

-- FUTURE TABLES/ VIEWS

GRANT SELECT ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE MOVIE_ANALYST;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA movies.staging TO ROLE MOVIE_ANALYST;

--  Grant Privileges to Create Views, Tables, and Temporary Tables

GRANT CREATE TABLE ON SCHEMA MOVIES.STAGING TO ROLE MOVIE_ANALYST;
GRANT CREATE VIEW ON SCHEMA MOVIES.STAGING TO ROLE MOVIE_ANALYST;

GRANT CREATE TEMPORARY TABLE ON SCHEMA MOVIES.STAGING TO ROLE MOVIE_ANALYST;


-- To cover future privileges on creating objects in the schema
GRANT CREATE TABLE ON FUTURE SCHEMAS IN DATABASE MOVIES TO ROLE MOVIE_ANALYST;
GRANT CREATE VIEW ON FUTURE SCHEMAS IN DATABASE MOVIES TO ROLE movie_analyst;
GRANT CREATE TEMPORARY TABLE ON FUTURE SCHEMAS IN DATABASE MOVIES TO ROLE movie_analyst;


-- check grants

SHOW GRANTS ON DATABASE MOVIES;
SHOW GRANTS ON SCHEMA MOVIES.STAGING;

SHOW GRANTS ON SCHEMA MOVIES.PUBLIC;

-- Check grants on the DEV_WH warehouse
SHOW GRANTS ON WAREHOUSE DEV_WH;


-- Check future grants on tables and views in the STAGING schema
SHOW GRANTS ON FUTURE TABLES IN SCHEMA MOVIES.STAGING;
SHOW GRANTS ON FUTURE VIEWS IN SCHEMA MOVIES.STAGING;













