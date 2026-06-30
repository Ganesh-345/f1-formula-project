create view gold.vw_dim_races as 
select * from OPENROWSET(
    bulk '__unitystorage/catalogs/b75fb745-4bd0-4dc5-aa28-c487ea4fb35b/tables/aaad42a6-b35b-4406-b059-632dc828db2f',
    data_source= 'bronze_source',
    format ='delta'
) as result
