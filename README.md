# CI_CD_PIPELINE

El propósito principal de este repositorio es proporcinar una Jenkinsfile para crear una pipeline que:
1. Intalará la aplicación en un nodo de Jenkins
1. Ejecutará los tests y linting
1. Creará una imagen de Docker
1. Subirá dicha imagen a Docker Hub

Se proporciona también un archivo de docker compose para poder levantar un servidor de Jenkins junto a dos agentes:
1. agent-builder-python: Para instalar la aplicación y ejecutar los tests
1. agent-builder-docker: Para crear la imagen y subirla al docker registry


## Pre-requisitos
1. Cuenta de GitHub: Para poder hacer un trigger a la pipeline cuando hayan cambios en las ramas deseadas
1. Servidor Jenkins con IP ṕublica: El servidor de Jenkins se deberá instalar en un servidor con IP pública para que GitHub mediante webhooks pueda avisar a Jenkins y así empezar la ejecución de la pipeline


## Servidor de Jenkis
Para poder conectar el servidor de Jenkins a GitHub con Webhooks, el servidor de Jenkins debe tener una direción IP pública. Para extra seguridad podríamos adquirir un dominio, para junto con la IP pública obtener un Certificado con Let's Encrypt

Se puede levantar un servidor de Jenkins usando el siguiente comando

```bash
docker compose up jenkins-server -d
```

Para obtener el password inicial podemos ejecutar

```bash
docker logs ci_cd_pipeline-jenkins-server-1
```

### Configuración
#### Inicial

En la interfaz gráfica del Servidor de Jenkis se llevarán a cabo los siguientes pasos:
1. Introducir la password inicial obtenida anteriormente
1. Haremos click en Install Suggested Plugins para tener los plugins básicos
1. Crearemos un usuario administrador
1. Usaremos la "Jenkins URL" que deseemos, ya sea la IP pública o el DNS

#### Nodos

Los nodos se pueden añadir en **Manage Jenkins > Nodes > + New Node**

El nodo de Python tendrá:
1. nombre: agent-builder-python
1. tipo: Permanent Agent
1. Remote root directory: /home/jenkins/agent
1. Labels: agent-builder-python
1. Usage: Only build jobs with label expressions matching this node
1. Se hará click en **Save para crear** el nodo en Jenkins server

El resto de campos se dejarán con los valores por defecto

A continuación haremos click en el nodo creado **agent-builder-python** para obtener el secret. Dicho secret lo deberemos guardar en el archivo .env dentro de la variable de entorno **AGENT_PYTHON_SECRET**

El nodo de Docker tendrá:
1. nombre: agent-builder-docker
1. tipo: Permanent Agent
1. Remote root directory: /home/jenkins/agent
1. Labels: agent-builder-docker
1. Usage: Only build jobs with label expressions matching this node
1. Se hará click en **Save para crear** el nodo en Jenkins server

El resto de campos se dejarán con los valores por defecto

A continuación haremos click en el nodo creado **agent-builder-docker** para obtener el secret. Dicho secret lo deberemos guardar en el archivo .env dentro de la variable de entorno **AGENT_DOCKER_SECRET**
