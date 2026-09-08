output "environment" {
  value = var.environment
}

output "network_name" {
  value = module.docker_services.network_name
}

output "containers" {
  value = module.docker_services.containers
}