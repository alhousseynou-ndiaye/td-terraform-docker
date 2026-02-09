variable "container_name" {
  description = "Nom du container Docker."
  type        = string
  default     = "td-nginx"
}

variable "image_name" {
  description = "Image Docker à utiliser."
  type        = string
  default     = "nginx:stable-alpine"
}

variable "host_port" {
  description = "Port exposé sur la machine hôte."
  type        = number
  default     = 8080
}

variable "container_port" {
  description = "Port du service dans le container (nginx = 80)."
  type        = number
  default     = 80
}

variable "network_name" {
  description = "Nom du réseau Docker dédié (bridge)."
  type        = string
  default     = "td-net"
}

variable "volume_enabled" {
  description = "Créer/monter un volume de persistance (recommandé)."
  type        = bool
  default     = true
}

variable "volume_name" {
  description = "Nom du volume Docker."
  type        = string
  default     = "td-nginx-data"
}

variable "environment" {
  description = "Variables d'environnement pour le container (liste KEY=VALUE)."
  type        = list(string)
  default     = []
}
