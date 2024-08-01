with tru_dpto as(
    select
        cd_dpto,
        nm_dpto,
        qt_maxi_func,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz
    from {{source('dbt_hyper_xpto','raw_dpto')}}
)

select * from tru_dpto