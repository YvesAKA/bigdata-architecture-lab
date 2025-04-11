import psycopg2
import csv
import os

DB_CONFIG = {
    "dbname": "bookshop",
    "user": "bookuser",
    "password": "bookpass",
    "host": "localhost",
    "port": "5432"
}

TABLES = ["category", "books", "customers", "factures", "ventes"]

OUTPUT_DIR = "/home/meta/projets-m1-ia/bigdata-architecture-lab/dags/dbt/bookshop/seed"

def export_table_to_csv(table_name, connection):
    """Exporte une table PostgreSQL vers un fichier CSV."""
    output_file = os.path.join(OUTPUT_DIR, f"{table_name}.csv")
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        rows = cursor.fetchall()
        column_names = [desc[0] for desc in cursor.description]

        with open(output_file, mode="w", newline="", encoding="utf-8") as csv_file:
            writer = csv.writer(csv_file)
            writer.writerow(column_names)  # Écrire les noms des colonnes
            writer.writerows(rows)        # Écrire les données
        print(f"Table '{table_name}' exportée vers {output_file}")

def main():
    try:
        connection = psycopg2.connect(**DB_CONFIG)
        print("Connexion à la base de données réussie.")
        
        for table in TABLES:
            export_table_to_csv(table, connection)
    except Exception as e:
        print(f"Erreur lors de la connexion ou de l'exportation : {e}")
    finally:
        if connection:
            connection.close()
            print("Connexion à la base de données fermée.")

if __name__ == "__main__":
    main()