create view gold.dim_constructors as 
select * from OPENROWSET(
    bulk '__unitystorage/catalogs/b75fb745-4bd0-4dc5-aa28-c487ea4fb35b/tables/8359596b-db9b-44bd-befc-5bb66f099763',
    data_source= 'bronze_source',
    format ='delta'
) as result
