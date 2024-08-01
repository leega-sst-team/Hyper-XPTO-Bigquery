with tru_cidd as (
    select 
        cd_cidd,
        cd_estd,
        nm_cidd,      
        SAFE_CAST(split(dc_faix_cep, ' a')[OFFSET(0)] AS STRING) AS dc_cep_min,
        SAFE_CAST(split(dc_faix_cep, 'a ')[OFFSET(1)]AS STRING) AS dc_cep_max,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz         
    from{{source('dbt_hyper_xpto','raw_cidd')}}
)

select * from tru_cidd