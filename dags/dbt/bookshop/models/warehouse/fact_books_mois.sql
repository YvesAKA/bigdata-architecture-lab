{{ config(
    materialized='table',
    schema='warehouse'
) }}

SELECT
  books_id,
  TO_CHAR(date_edit, 'YYYY-MM') AS mois,
  SUM(qte) AS total_qte_vendue,
  COUNT(*) AS nb_ventes
FROM {{ ref('stg_ventes') }}
GROUP BY books_id, mois
