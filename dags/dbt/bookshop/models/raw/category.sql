{{ config(
    materialized='incremental',
    schema='RAW',
    unique_key='id'
) }}

select
    cast(id as integer) as id,
    cast(intitule as string) as intitule,
    cast(created_at as timestamp) as created_at
from {{ ref('seeds', 'seed_category.csv') }}
{% if is_incremental() %}
where id not in (select id from {{ this }})
{% endif %}
