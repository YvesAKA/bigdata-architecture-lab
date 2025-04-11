{{ config(
    materialized='incremental',
    schema='RAW',
    unique_key='id'
) }}

select
    cast(id as integer) as id,
    code,
    cast(date_edit as timestamp) as date_edit,
    cast(factures_id as integer) as factures_id,
    cast(books_id as integer) as books_id,
    cast(pu as float) as pu,
    cast(qte as integer) as qte,
    cast(created_at as timestamp) as created_at
from {{ ref('seeds', 'seed_ventes.csv') }}
{% if is_incremental() %}
where id not in (select id from {{ this }})
{% endif %}
