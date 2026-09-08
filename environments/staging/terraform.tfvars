environment = "staging"

services = {
  redis = {
    image         = "redis:7.2-alpine"
    internal_port = 6379
    external_port = 6380
  }

  nginx = {
    image         = "nginx:alpine"
    internal_port = 80
    external_port = 8081
  }

  postgres = {
    image         = "postgres:16-alpine"
    internal_port = 5432
    external_port = 5433

    environment = [
      "POSTGRES_USER=terraform",
      "POSTGRES_DB=staging"
    ]
  }
}