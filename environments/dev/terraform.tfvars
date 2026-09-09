environment = "dev"

services = {
  redis = {
    image         = "redis:7.2-alpine"
    internal_port = 6379
    external_port = 6379
  }

  nginx = {
    image         = "nginx:alpine"
    internal_port = 80
    external_port = 8080
  }

  postgres = {
    image         = "postgres:16-alpine"
    internal_port = 5432
    external_port = 5432
    persistent    = true
    mount_path    = "/var/lib/postgresql/data"

    environment = [
      "POSTGRES_USER=terraform",
      "POSTGRES_DB=workshop"
    ]
  }
}