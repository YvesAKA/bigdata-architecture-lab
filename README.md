# Big Data Architecture Lab

Ce projet met en place une architecture Big Data complète en utilisant **DBT**, **Airflow (Astronomer)**, **Snowflake**, et **PostgreSQL**. Il permet de transformer et d'orchestrer des données dans un environnement moderne et automatisé.

---

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- **Python 3.8+**
- **PostgreSQL** (local ou distant)
- **Snowflake** (compte actif)
- **Airflow** (via Astronomer ou installation manuelle)
- **Git**

---

## Installation

### 1. Clonez le projet

```bash
git clone https://github.com/votre-utilisateur/bigdata-architecture-lab.git
cd bigdata-architecture-lab
```

### 2. Créez un environnement virtuel Python

```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Installez les dépendances Python

```bash
pip install -r requirements.txt
```

### 4. Configurez PostgreSQL

- Assurez-vous que PostgreSQL est installé et en cours d'exécution.
- Créez une base de données et un utilisateur :

```sql
CREATE DATABASE bookshop;
CREATE USER bookuser WITH PASSWORD 'bookpass';
GRANT ALL PRIVILEGES ON DATABASE bookshop TO bookuser;
```

- Mettez à jour les informations de connexion dans le fichier `extract_source_data.py` :

```python
POSTGRES_CONFIG = {
    "dbname": "bookshop",
    "user": "bookuser",
    "password": "bookpass",
    "host": "localhost",
    "port": "15432"
}
```

### 5. Configurez Snowflake

- Connectez-vous à votre compte Snowflake et exécutez les commandes suivantes pour créer les bases et schémas nécessaires :

```sql
CREATE DATABASE BOOKSHOP;
CREATE SCHEMA RAW;
CREATE SCHEMA STAGGING;
CREATE SCHEMA WAREHOUSE;
CREATE SCHEMA MARTS;
```

- Créez un utilisateur et un rôle pour DBT :

```sql
CREATE ROLE dbt_role;
GRANT USAGE ON DATABASE BOOKSHOP TO ROLE dbt_role;
GRANT USAGE ON SCHEMA BOOKSHOP.RAW TO ROLE dbt_role;
GRANT USAGE ON SCHEMA BOOKSHOP.STAGGING TO ROLE dbt_role;
GRANT USAGE ON SCHEMA BOOKSHOP.WAREHOUSE TO ROLE dbt_role;
GRANT USAGE ON SCHEMA BOOKSHOP.MARTS TO ROLE dbt_role;

CREATE USER dbt_user PASSWORD='your_password';
GRANT ROLE dbt_role TO USER dbt_user;
```

### 6. Configurez DBT

- Installez DBT pour Snowflake :

```bash
pip install dbt-snowflake
```

- Initialisez le projet DBT :

```bash
cd dags/dbt/bookshop
dbt init bookshop
```

- Configurez le fichier `profiles.yml` :

```yaml
bookshop:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your_account.snowflakecomputing.com
      user: dbt_user
      password: your_password
      role: dbt_role
      database: BOOKSHOP
      warehouse: COMPUTE_WH
      schema: RAW
```

### 7. Configurez Airflow avec Astronomer

- Installez Astronomer CLI :

```bash
curl -sSL https://install.astronomer.io | sudo bash
```

- Initialisez le projet Airflow :

```bash
astro dev init
```

- Ajoutez les dépendances dans `requirements.txt` :

```txt
apache-airflow
dbt-core
dbt-snowflake
cosmos
```

- Démarrez Airflow :

```bash
astro dev start
```

---

## Exécution

### 1. Charger les données brutes dans PostgreSQL

- Ajoutez vos données dans la base PostgreSQL `bookshop`.

### 2. Exécuter le script de chargement vers Snowflake

- Configurez un job cron pour exécuter le script `extract_source_data.py` chaque jour à 3h00 :

```bash
crontab -e
```

Ajoutez la ligne suivante :

```bash
0 3 * * * /usr/bin/python3 extract_source_data.py >> /home/meta/projets-m1-ia/bigdata-architecture-lab/infra/source_db/extract_source_data.log 2>&1
```

### 3. Exécuter les transformations DBT

- Lancez les transformations DBT via Airflow en exécutant le DAG `dbt_snowflake_dag`.

---

## Résultats attendus

1. Les données brutes sont chargées dans Snowflake dans le schéma `RAW`.
2. Les transformations DBT organisent les données dans les schémas `STAGGING`, `WAREHOUSE`, et `MARTS`.
3. Les données transformées sont prêtes pour l'analyse dans Snowflake.

---

## Dépannage

- **Problème de connexion à Snowflake** :
  - Vérifiez les informations de connexion dans `profiles.yml` et dans Airflow (`snowflake_default`).

- **Erreur dans Airflow** :
  - Consultez les journaux d'Airflow pour plus de détails :
    ```bash
    astro dev logs
    ```

- **Problème avec DBT** :
  - Testez la configuration DBT avec :
    ```bash
    dbt debug
    ```

---

## Auteur

Ce projet a été développé dans le cadre du laboratoire Big Data pour démontrer l'intégration de DBT, Snowflake, et Airflow.