import psycopg2
import pandas as pd
from snowflake.snowpark import Session
from snowflake.snowpark.functions import col, max as sf_max
from datetime import datetime

POSTGRES_CONFIG = {
    "dbname": "bookshop",
    "user": "bookuser",
    "password": "bookpass",
    "host": "localhost",
    "port": "15432"
}

SNOWFLAKE_CONFIG = {
    "account": "RXFRTQJ-TZ18826",
    "user": "DBT_CORE",
    "password": "UraPyrR51BRYw2",
    "role": "ACCOUNTADMIN",
    "warehouse": "COMPUTE_WH",
    "database": "BOOKSHOP",
    "schema": "RAW"
}

# Liste des tables à synchroniser
TABLES = ["category", "books", "customers", "factures", "ventes"]

def get_snowflake_session():
    """Crée une session Snowpark."""
    return Session.builder.configs(SNOWFLAKE_CONFIG).create()

def get_last_loaded_timestamp(table_name, session):
    """Récupère le dernier timestamp chargé dans Snowflake pour une table donnée."""
    try:
        # Utiliser des guillemets doubles pour respecter la casse des noms de colonnes
        df = session.sql(f"""
            SELECT MAX("created_at") AS last_loaded
            FROM "{SNOWFLAKE_CONFIG['schema']}"."{table_name}"
        """).collect()
        return df[0]["LAST_LOADED"] if df and df[0]["LAST_LOADED"] else datetime.min
    except Exception as e:
        print(f"Erreur lors de la récupération du dernier timestamp pour {table_name}: {e}")
        return datetime.min

def extract_from_postgres(table_name, last_loaded_timestamp):
    """Extrait les nouvelles données de PostgreSQL."""
    query = f'SELECT * FROM "{table_name}" WHERE created_at > %s'
    try:
        with psycopg2.connect(**POSTGRES_CONFIG) as conn:
            df = pd.read_sql_query(query, conn, params=(last_loaded_timestamp,))
            return df
    except Exception as e:
        print(f"Erreur lors de l'extraction des données de PostgreSQL pour {table_name}: {e}")
        return pd.DataFrame()

def load_to_snowflake_direct(table_name, df, session):
    """Charge directement les données dans Snowflake."""
    if df.empty:
        print(f"Aucune nouvelle donnée à charger pour la table {table_name}.")
        return
    try:
        snowpark_df = session.create_dataframe(df)
        snowpark_df.write.save_as_table(
            f'"{SNOWFLAKE_CONFIG["schema"]}"."{table_name}"',
            mode="append"  
        )
        print(f"Données chargées avec succès dans la table {table_name}.")
    except Exception as e:
        print(f"Erreur lors du chargement des données dans Snowflake pour {table_name}: {e}")

def main():
    try:
        session = get_snowflake_session()
        for table in TABLES:
            print(f"Traitement de la table {table}...")
            last_loaded_timestamp = get_last_loaded_timestamp(table, session)
            new_data = extract_from_postgres(table, last_loaded_timestamp)
            # Charger directement les données dans Snowflake
            load_to_snowflake_direct(table, new_data, session)
    except Exception as e:
        print(f"Erreur générale : {e}")
    finally:
        if 'session' in locals() and session:
            session.close()
            print("Session Snowflake fermée.")
if __name__ == "__main__":
    main()