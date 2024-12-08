# CI_CD_PIPELINE

El propósito principal de este repositorio es proporcionar una Jenkinsfile para crear una pipeline que:

1. Instalará la aplicación en un nodo de Jenkins
1. Ejecutará los tests y linting
1. Creará una imagen de Docker
1. Subirá dicha imagen a Docker Hub

Se proporciona también un archivo de docker compose para poder levantar un servidor de Jenkins junto a dos agentes:
1. agent-builder-python: Para instalar la aplicación y ejecutar los tests
1. agent-builder-docker: Para crear la imagen y subirla al docker registry


## Pre-requisitos
1. Cuenta de GitHub: Para poder hacer un trigger a la pipeline cuando hayan cambios en las ramas deseadas
1. Servidor Jenkins con IP ṕublica: El servidor de Jenkins se deberá instalar en un servidor con IP pública para que GitHub mediante webhooks pueda avisar a Jenkins y así empezar la ejecución de la pipeline

## Proceso de Instalación
1. [Configurar Servidor de Jenkins]
1. [Configurar Credenciales de Docker Hub]
1. [Configurar GitHub Webhooks]
1. [Configurar Pipeline]


[Configurar Servidor de Jenkins]: docs/jenkins_server.md
[Configurar Credenciales de Docker Hub]: docs/docker_creds.md
[Configurar GitHub Webhooks]: docs/github_webhooks.md
[Configurar Pipeline]: docs/pipeline.md
