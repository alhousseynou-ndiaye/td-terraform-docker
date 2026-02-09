# TD Avancé – Terraform (Docker provider) : Provisionner un container Docker

## Objectif

Terraform provisionne des ressources Docker de manière reproductible :

- 1 réseau dédié (bridge)
- 1 volume (optionnel, recommandé)
- 1 container nginx exposé sur un port hôte configurable

⚠️ Pas de `local-exec/remote-exec` pour configurer l’application.

## Pré-requis

- Docker installé et fonctionnel (`docker ps` OK)
- Terraform installé
- Internet pour pull l’image

## Structure

terraform/
main.tf
variables.tf
outputs.tf
versions.tf
terraform.tfvars

## Déploiement

Depuis la racine du repo :

````bash
cd terraform
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve


## Déploiement
Depuis la racine du repo :

```bash
cd terraform
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve
````
## Preuves / Validation

### terraform output
```text
container_id = "6e5f5a803d360fb17c677753a01c2e7ae0008f27e8241cc60803b97d26a3cdbb"
container_name = "td-nginx"
local_url = "http://localhost:8080"
network = "td-net"
published_ports = [
  {
    "external" = 8080
    "internal" = 80
  },
]
volume = "td-nginx-data"

docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
6e5f5a803d36   4a2f2d155e13   "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes   0.0.0.0:8080->80/tcp   td-nginx

curl

HTTP/1.1 200 OK
Server: nginx/1.28.2
...
