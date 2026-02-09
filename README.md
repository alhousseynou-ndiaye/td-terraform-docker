<<<<<<< HEAD
# TD Avancé – Terraform (Docker Provider) : Provisionner un container Docker

## Contexte
Objectif : industrialiser un environnement local (ou CI runner) avec Terraform pour provisionner des ressources Docker.
Terraform gère le **provisionnement** (image, container, réseau, volume).  
La **validation** (curl / check HTTP) se fait après, sans transformer Terraform en outil de configuration.

## Architecture cible
- 1 réseau Docker dédié (bridge)
- 1 volume Docker (persistance, optionnel mais recommandé)
- 1 container applicatif (nginx)
- 1 port hôte configurable (ex: 8080) publié vers le port du service (80)

## Pré-requis
- Docker installé et fonctionnel (`docker ps` OK)
- Terraform installé
- Accès Internet (pull de l'image)


## Déploiement
```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve

1) Container RUNNING
docker ps

2) Test HTTP (Windows PowerShell)

⚠️ Sur Windows, curl est un alias PowerShell. Utiliser curl.exe :

curl.exe -i http://localhost:8080


✅ Attendu : HTTP/1.1 200 OK + page nginx par défaut.

3) Outputs Terraform
terraform output
terraform output -raw local_url

Nettoyage
terraform destroy -auto-approve

Preuves / Logs
terraform output
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
Date: Mon, 09 Feb 2026 12:56:14 GMT
Content-Type: text/html
=======
# TD Avancé – Terraform (Docker Provider) : Provisionner un container Docker

## Contexte

Objectif : industrialiser un environnement local (ou CI runner) avec Terraform pour provisionner des ressources Docker.
Terraform gère le **provisionnement** (image, container, réseau, volume).  
La **validation** (curl / check HTTP) se fait après, sans transformer Terraform en outil de configuration.

## Architecture cible

- 1 réseau Docker dédié (bridge)
- 1 volume Docker (persistance, optionnel mais recommandé)
- 1 container applicatif (nginx)
- 1 port hôte configurable (ex: 8080) publié vers le port du service (80)

## Pré-requis

- Docker installé et fonctionnel (`docker ps` OK)
- Terraform installé
- Accès Internet (pull de l'image)

## Déploiement

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve

1) Container RUNNING
docker ps

2) Test HTTP (Windows PowerShell)

⚠️ Sur Windows, curl est un alias PowerShell. Utiliser curl.exe :

curl.exe -i http://localhost:8080


✅ Attendu : HTTP/1.1 200 OK + page nginx par défaut.

3) Outputs Terraform
terraform output
terraform output -raw local_url

Nettoyage
terraform destroy -auto-approve

Preuves / Logs
terraform output
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
Date: Mon, 09 Feb 2026 12:56:14 GMT
Content-Type: text/html
```

### (Option) Validation Ansible
```text
PLAY [Validate nginx locally (HTTP 200)] ...

TASK [Check HTTP endpoint] ...
ok: [localhost]

PLAY RECAP ...
localhost : ok=1 changed=0 unreachable=0 failed=0

