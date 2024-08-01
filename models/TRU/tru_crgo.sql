with tru_crgo as(
    select
        cd_crgo,
        nm_crgo,
        qt_maxi_func,
        SAFE_CAST(vl_salr AS NUMERIC) as vl_salr,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz
    from {{source('dbt_hyper_xpto','raw_crgo')}}
)

select * from tru_crgo