use role useradmin;

CREATE USER IF NOT EXISTS transformer
    PASSWORD = 'Transformer1#'
    DEFAULT_WAREHOUSE = DEV_WH
    LOGIN_NAME = 'transformer'
    DEFAULT_NAMESPACE = 'job_ads.warehouse'
    COMMENT = 'DBT USER TRANSFORMING DATA'
    DEFAULT_ROLE = 'job_ads_dbt_role';
