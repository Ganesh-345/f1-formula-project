create view gold.vw_dim_drivers as 
select * from OPENROWSET(
    bulk '__unitystorage/catalogs/b75fb745-4bd0-4dc5-aa28-c487ea4fb35b/tables/fcc52627-cbad-41ba-a492-416d968f4ac5',
    data_source= 'bronze_source',
    format ='delta'
) as result
