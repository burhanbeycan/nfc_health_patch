from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    app_name: str = "NFC Health Patch API"
    app_env: str = "development"
    secret_key: str = "change-me"
    database_url: str = "sqlite:///./local.db"


settings = Settings()
