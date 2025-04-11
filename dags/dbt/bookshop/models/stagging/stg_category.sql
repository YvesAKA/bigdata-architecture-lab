{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT *
FROM {{ source('raw', 'category') }}