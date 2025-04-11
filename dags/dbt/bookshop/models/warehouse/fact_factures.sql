{{ config(
    materialized='table',
    schema='warehouse'
) }}

SELECT
  *,
  EXTRACT(YEAR FROM date_edit) AS annee,
  TO_CHAR(date_edit, 'TMMonth') AS mois,
  TO_CHAR(date_edit, 'TMDay') AS jour
FROM {{ ref('stg_factures') }}
