from datetime import datetime
import os
from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping
from pathlib import Path

DBT_PROJECT_PATH = f"{os.environ['AIRFLOW_HOME']}/dags/dbt/bookshop"

profile_config = ProfileConfig(
    profile_name="bookshop",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_default",  # Connexion Airflow vers Snowflake
        profile_args={
            "database": "BOOKSHOP",  # Nom de la base de données (doit correspondre à Snowflake)
            "schema": "PUBLIC"       # Nom du schéma (doit correspondre à Snowflake)
        },
    )
)

dbt_snowflake_dag = DbtDag(
    project_config=ProjectConfig(DBT_PROJECT_PATH),
    operator_args={"install_deps": True},  # Installe les dépendances DBT si nécessaire
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",  # Chemin vers l'exécutable DBT
    ),
    schedule_interval="@daily",  # Planification quotidienne
    start_date=datetime(2025, 4, 11),  # Date de début du DAG
    catchup=False,  # Désactive le rattrapage des exécutions manquées
    dag_id="dbt_snowflake_dag",  # Identifiant unique du DAG  
)