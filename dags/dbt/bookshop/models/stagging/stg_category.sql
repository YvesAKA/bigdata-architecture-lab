{{ config(
    materialized='view',
    schema='STAGGING'
) }}

SELECT *
FROM {{ source('raw', 'category') }}