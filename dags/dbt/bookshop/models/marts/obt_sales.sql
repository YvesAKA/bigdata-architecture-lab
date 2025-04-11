{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    v.id AS vente_id,
    v.annee,
    v.mois,
    v.jour,
    v.pu,
    v.qte,

    f.id AS facture_id,
    f.code AS facture_code,
    f.qte_totale,
    f.total_amount,
    f.total_paid,

    cat.intitule AS category_intitule,

    b.code AS book_code,
    b.intitule AS book_intitule,
    b.isbn_10,
    b.isbn_13,

    c.code AS customer_code,
    c.nom AS customer_nom

FROM {{ ref('fact_ventes') }} v
JOIN {{ ref('fact_factures') }} f
  ON v.factures_id = f.id
JOIN {{ ref('dim_books') }} b
  ON v.books_id = b.id
JOIN {{ ref('dim_category') }} cat
  ON b.category_id = cat.id
JOIN {{ ref('dim_customers') }} c
  ON f.customers_id = c.id
