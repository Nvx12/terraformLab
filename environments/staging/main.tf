terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

module "docker_services" {
  source = "../../modules/docker-services"

  environment       = var.environment
  services          = var.services
  postgres_password = var.postgres_password
}