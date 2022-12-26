import yaml
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import declarative_base, scoped_session, sessionmaker

db_driver: str = ""
user: str = ""
password: str = ""
hostname: str = ""
port: str = ""
db_name: str = ""

with open("./settings.yaml") as settings_yaml_file:
    settings = yaml.safe_load(settings_yaml_file)
    db_driver = settings["db_driver_asyncpg"]
    user = settings["user"]
    password = settings["password"]
    hostname = settings["hostname"]
    port = settings["port"]
    db_name = settings["db_name"]

DB_URL = f"{db_driver}://{user}:{password}@{hostname}:{port}/{db_name}"
async_engine = create_async_engine(DB_URL, echo=True)
async_session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=async_engine, class_=AsyncSession))

Base = declarative_base()


async def get_db():
    async with async_session() as session:
        yield session
