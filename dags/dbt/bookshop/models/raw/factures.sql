{{ config(
    materialized='incremental',
    schema='RAW',
    unique_key='id'
) }}

select
    cast(id as integer) as id,
    code,
    cast(date_edit as timestamp) as date_edit,
    cast(customers_id as integer) as customers_id,
    cast(qte_totale as integer) as qte_totale,
    cast(total_amount as float) as total_amount,
    cast(total_paid as float) as total_paid,
    cast(created_at as timestamp) as created_at
from {{ ref('seeds', 'seed_factures.csv') }}
{% if is_incremental() %}
where id not in (select id from {{ this }})
{% endif %}
