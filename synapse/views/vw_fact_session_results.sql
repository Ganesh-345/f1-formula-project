create view gold.vw_fact_session_results as 
select * from OPENROWSET(
    bulk '__unitystorage/catalogs/b75fb745-4bd0-4dc5-aa28-c487ea4fb35b/tables/02276558-8d82-4a1b-a41c-c72ec5b0f034',
    data_source= 'bronze_source',
    format ='delta'
) as result
