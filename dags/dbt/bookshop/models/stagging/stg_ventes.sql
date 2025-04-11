{{ config(
    materialized='view',
    schema='STAGGING'
) }}

SELECT
    "id",
    "code",
    TRY_CAST("date_edit" AS DATE) AS "date_edit",
    "factures_id",
    "books_id",
    "pu",
    "qte",
    "created_at"
FROM {{ source('raw', 'ventes') }}