with tru_catg_prod as (
    select
        cd_catg_prod,
        nm_catg_prod,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz       
    from {{source('dbt_hyper_xpto', 'raw_catg_prod')}}
)

select * from tru_catg_prod