with tru_cent_dstr as (
    select
        cd_cent_dstr,
        nm_cent_dstr,
        cd_ende,
        nr_estb,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz            
    from {{source('dbt_hyper_xpto', 'raw_cent_dstr')}}
)

select * from tru_cent_dstr