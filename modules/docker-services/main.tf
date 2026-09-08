terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_network" "lab" {
  name = "terraform-${var.environment}"
}

resource "docker_image" "service" {
  for_each = var.services

  name = each.value.image
}

resource "docker_container" "service" {
  for_each = var.services

  name  = "terraform-${var.environment}-${each.key}"
  image = docker_image.service[each.key].image_id

  networks_advanced {
    name = docker_network.lab.name
  }

  env = each.key == "postgres" ? concat(
    each.value.environment,
    ["POSTGRES_PASSWORD=${var.postgres_password}"]
  ) : each.value.environment

  ports {
    internal = each.value.internal_port
    external = each.value.external_port
  }
}