use role useradmin;
show users;


create role job_ads_dbt_role;

grant role job_ads_dbt_role to user transformer;

grant role job_ads_dbt_role to user Dimitris;

