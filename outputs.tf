output "container_name" {
  description = "Nom du container."
  value       = docker_container.app.name
}

output "container_id" {
  description = "ID du container."
  value       = docker_container.app.id
}

output "published_ports" {
  description = "Ports publiés."
  value = [
    {
      internal = var.container_port
      external = var.host_port
    }
  ]
}

output "local_url" {
  description = "URL locale prête à l'emploi."
  value       = "http://localhost:${var.host_port}"
}

output "network" {
  description = "Réseau Docker utilisé."
  value       = docker_network.net.name
}

output "volume" {
  description = "Volume utilisé (ou null)."
  value       = var.volume_enabled ? var.volume_name : null
}
