with tru_ende as (
    select 
        cd_ende,
        nm_logr,
        SAFE_CAST(nr_cep_logr AS STRING) as nr_cep_logr,      
        cd_cidd,
        cd_estd,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz         
    from{{source('dbt_hyper_xpto','raw_ende')}}
)

select * from tru_ende