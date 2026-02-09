provider "docker" {}

# 1) Réseau dédié
resource "docker_network" "net" {
  name   = var.network_name
  driver = "bridge"
}

# 2) Volume (optionnel)
resource "docker_volume" "data" {
  count = var.volume_enabled ? 1 : 0
  name  = var.volume_name
}

# 3) Pull image (reproductible)
resource "docker_image" "app" {
  name         = var.image_name
  keep_locally = true
}

# 4) Container
resource "docker_container" "app" {
  name  = var.container_name
  image = docker_image.app.image_id

  # Environment: ["KEY=VALUE", ...]
  env = var.environment

  # Port hôte configurable -> port du container
  ports {
    internal = var.container_port
    external = var.host_port
  }

  # Réseau dédié
  networks_advanced {
    name = docker_network.net.name
  }

  # Volume (si activé) : on monte un volume sur /usr/share/nginx/html
  dynamic "volumes" {
    for_each = var.volume_enabled ? [1] : []
    content {
      volume_name    = docker_volume.data[0].name
      container_path = "/usr/share/nginx/html"
    }
  }

  restart = "unless-stopped"
}
