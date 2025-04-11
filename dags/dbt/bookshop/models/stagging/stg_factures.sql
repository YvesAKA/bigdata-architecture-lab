{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    id,
    code,
    TRY_CAST(date_edit AS DATE) AS date_edit,
    customers_id,
    qte_totale,
    total_amount,
    total_paid,
    created_at
FROM {{ source('raw', 'factures') }}
