{{ config(
    materialized='table',
    schema='warehouse'
) }}

SELECT
  *,
  EXTRACT(YEAR FROM "date_edit") AS "annee",
  TO_CHAR("date_edit", 'TMMonth') AS "mois", -- Mois en texte (ex: 'Janvier', 'Février')
  TO_CHAR("date_edit", 'Day') AS "jour",    -- Jour en texte (ex: 'Lundi', 'Mardi')
FROM {{ ref('stg_ventes') }}
