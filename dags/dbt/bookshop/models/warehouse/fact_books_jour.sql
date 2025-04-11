{{ config(
    materialized='table',
    schema='warehouse'
) }}

SELECT
  "books_id",
  "date_edit",
  SUM("qte") AS "total_qte"
FROM {{ ref('stg_ventes') }}
GROUP BY "books_id", "date_edit"