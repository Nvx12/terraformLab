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
  source = "git::https://github.com/Nvx12/terraformLab.git//modules/docker-services?ref=master"

  environment       = var.environment
  services          = var.services
  postgres_password = var.postgres_password
}