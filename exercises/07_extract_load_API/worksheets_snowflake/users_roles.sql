USE ROLE USERADMIN;

CREATE OR REPLACE USER larissa
PASSWORD = 'Larissadovgoborets1#'
LOGIN_NAME = 'larissa'
FIRST_NAME = 'larissa'
LAST_NAME ='Dovgoborets'
EMAIL = 'snow.storm@snowflake.com'
MUST_CHANGE_PASSWORD = true
DEFAULT_WAREHOUSE = DEV_WH;

SHOW USERS;

DROP USER LARISSA;          