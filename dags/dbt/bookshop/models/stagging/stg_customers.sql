{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT *
FROM {{ source('raw', 'customers') }}
