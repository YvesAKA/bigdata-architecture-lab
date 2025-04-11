{{ config(
    materialized='incremental',
    schema='RAW',
    unique_key='id'
) }}

select
    cast(id as integer) as id,
    cast(category_id as integer) as category_id,
    code,
    intitule,
    isbn_10,
    isbn_13,
    cast(created_at as timestamp) as created_at
from {{ ref('seeds','seed_books.csv') }}
{% if is_incremental() %}
where id not in (select id from {{ this }})
{% endif %}
