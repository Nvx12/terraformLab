output "network_name" {
  value = docker_network.lab.name
}

output "containers" {
  value = {
    for name, container in docker_container.service :
    name => {
      name = container.name
      ip   = container.network_data[0].ip_address
    }
  }
}