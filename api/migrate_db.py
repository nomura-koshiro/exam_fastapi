import yaml
from sqlalchemy import create_engine

from api.models.task import Base

db_driver: str = ""
user: str = ""
password: str = ""
hostname: str = ""
port: str = ""
db_name: str = ""

with open("./settings.yaml") as settings_yaml_file:
    settings = yaml.safe_load(settings_yaml_file)
    db_driver = settings["db_driver_psycopg2"]
    user = settings["user"]
    password = settings["password"]
    hostname = settings["hostname"]
    port = settings["port"]
    db_name = settings["db_name"]

DB_URL = f"{db_driver}://{user}:{password}@{hostname}:{port}/{db_name}"
engine = create_engine(DB_URL, echo=True)


def reset_database():
    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)


if __name__ == "__main__":
    reset_database()
