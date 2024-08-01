with tru_loja as (
    select
        cd_loja,
        nm_fant AS nome_fantasia,       
        COALESCE(SAFE_CAST(cd_loja_mae AS INT64), -1) AS cd_loja_mae,
        cd_ende,
        nr_estb,
        split(ds_cmpl_logr, '/')[OFFSET(0)] AS cidade,        
        split(ds_cmpl_logr, '/')[OFFSET(1)] AS estado,
        tp_loja AS tp_loja,
        COALESCE(SAFE_CAST(cd_user_atlz AS INT64), -1) AS cd_user_atlz,
        dt_incl,
        COALESCE(SAFE_CAST(dt_atlz AS TIMESTAMP), '1970-01-01 00:00:00') AS dt_atlz,
        row_number() over (
            partition by cd_loja ORDER BY dt_incl
        ) as rn
    from {{source('dbt_hyper_xpto', 'raw_loja')}}
)

select  
    cd_loja,
    nome_fantasia,
    cd_loja_mae,
    cd_ende,
    nr_estb,
    cidade,
    estado,
    cd_user_atlz,
    dt_incl,
    dt_atlz
from tru_loja
where rn = 1

