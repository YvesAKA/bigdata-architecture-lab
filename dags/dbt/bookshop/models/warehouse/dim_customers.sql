{{ config(
    materialized='view',
    schema='warehouse'
) }}

SELECT 
  *,
  CONCAT(first_name, ' ', last_name) AS nom
FROM {{ ref('stg_customers') }}
