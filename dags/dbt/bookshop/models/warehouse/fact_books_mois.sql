{{ config(
    materialized='table',
    schema='warehouse'
) }}

SELECT
  "books_id",
  EXTRACT(YEAR FROM "date_edit") AS "annee",
  EXTRACT(MONTH FROM "date_edit") AS "mois",
  SUM("qte") AS "total_qte_vendue",
  COUNT(*) AS "nb_ventes"
FROM {{ ref('stg_ventes') }}
GROUP BY "books_id", "annee", "mois"