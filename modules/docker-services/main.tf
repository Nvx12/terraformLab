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

resource "docker_volume" "data" {
  for_each = { for k, v in var.services : k => v if v.persistent }
  name     = "terraform-${var.environment}-${each.key}-data"
}

resource "docker_container" "service" {
  for_each = var.services

  name  = "terraform-${var.environment}-${each.key}"
  image = docker_image.service[each.key].image_id

  networks_advanced {
    name = docker_network.lab.name
  }

  dynamic "volumes" {
      for_each = each.value.persistent ? [1] : []
      content {
        volume_name    = docker_volume.data[each.key].name
        container_path = each.value.mount_path
      }
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

  