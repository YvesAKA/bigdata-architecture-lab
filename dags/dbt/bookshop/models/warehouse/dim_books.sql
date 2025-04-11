{{ config(
    materialized='view',
    schema='warehouse'
) }}

SELECT *
FROM {{ ref('stg_books') }}
