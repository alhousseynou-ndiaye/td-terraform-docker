container_name = "td-nginx"
image_name     = "nginx:stable-alpine"
host_port      = 8080
container_port = 80
network_name   = "td-net"
volume_enabled = true
volume_name    = "td-nginx-data"

environment = [
  "NginxDemo=terraform"
]
