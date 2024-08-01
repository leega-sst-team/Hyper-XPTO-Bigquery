with tru_cent_dstr_subp as (
    select
        cd_cent_dstr,
        cd_subp,
        qt_item,
        COALESCE(SAFE_CAST(pc_minm_item AS NUMERIC), 0.1) AS preco_minimo_item,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz            
    from {{source('dbt_hyper_xpto', 'raw_cent_dstr_subp')}}
)

select * from tru_cent_dstr_subp