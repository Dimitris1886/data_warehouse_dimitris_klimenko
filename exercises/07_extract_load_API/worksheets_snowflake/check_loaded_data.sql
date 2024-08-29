USE ROLE JOB_ADS_DLT_ROLE;

USE DATABASE JOB_ADS;

SHOW SCHEMAS;

SHOW TABLES IN SCHEMA STAGING;

DESC TABLE STAGING.DATA_FIELD_JOB_ADS;

USE WAREHOUSE DEV_WH;

SELECT
    headline,
    employer__workplace
FROM staging.data_field_job_ads;   

SELECT * FROM staging.data_field_job_ads;
