with tru_engn_prmt as (
    select 
        cd_prmt,
        nm_prmt,
        nm_list_prmt,      
        dc_prmt_list,
        tp_data_type_dscr,
        SAFE_CAST(vl_prmt_list AS NUMERIC) AS vl_prmt_list,
        tp_data_type_vlue,
        dt_incl,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz         
    from{{source('dbt_hyper_xpto','raw_engn_prmt')}}
)

select * from tru_engn_prmt