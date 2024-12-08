# Jenkins Server

Para poder conectar el servidor de Jenkins a GitHub con Webhooks, el servidor de Jenkins debe tener una direción IP pública. Para extra seguridad podríamos adquirir un dominio, para junto con la IP pública obtener un Certificado con Let's Encrypt

En caso de necesitarlo se puede levantar un servidor de Jenkins usando el siguiente comando

```bash
docker compose up jenkins-server -d
```

Para obtener el password inicial podemos ejecutar

```bash
docker logs ci_cd_pipeline-jenkins-server-1
```

## Configuración Inicial

En la interfaz gráfica del Servidor de Jenkis se llevarán a cabo los siguientes pasos:
1. Introducir la password inicial obtenida anteriormente
1. Haremos click en **Install Suggested Plugins** para tener los plugins básicos
1. Crearemos un usuario administrador
1. Usaremos la "Jenkins URL" que deseemos, ya sea la IP pública o el DNS


## Plugins
Instalaremos los siguientes plugins desde **Manage Jenkins > Plugins > + Available Plugins**:
1. Git Plugin
1. GitHub Plugin
1. Pipeline Plugin

## Nodos
Este paso es esencial antes de levantar los dos nodos:
1. agent-builder-python
1. agent-builder-docker

Los nodos se pueden añadir en **Manage Jenkins > Nodes > + New Node**

### agent-node-python tendrá:
1. nombre: agent-builder-python
1. tipo: Permanent Agent
1. Remote root directory: /home/jenkins/agent
1. Labels: agent-builder-python
1. Usage: Only build jobs with label expressions matching this node
1. Se hará click en **Save** para crear el nodo en Jenkins server

El resto de campos se dejarán con los valores por defecto

A continuación haremos click en el nodo creado **agent-builder-python** para obtener el secret. Dicho secret lo deberemos guardar en el archivo .env dentro de la variable de entorno **AGENT_PYTHON_SECRET**

### agent-node-docker tendrá:
1. nombre: agent-builder-docker
1. tipo: Permanent Agent
1. Remote root directory: /home/jenkins/agent
1. Labels: agent-builder-docker
1. Usage: Only build jobs with label expressions matching this node
1. Se hará click en **Save** para crear el nodo en Jenkins server

El resto de campos se dejarán con los valores por defecto

A continuación haremos click en el nodo creado **agent-builder-docker** para obtener el secret. Dicho secret lo deberemos guardar en el archivo .env dentro de la variable de entorno **AGENT_DOCKER_SECRET**

### Levantar Nodos
Es necesario tener los secrets para cada nodo en el archivo ".env". Para levantar los dos nodos usaremos:

```bash
docker compose up jenkins-agent-builder-python jenkins-agent-builder-docker -d
```

#### System
Añadiremos nuestra cuenta de GitHub en **Manage Jenkins > System > GitHub > GitHub Servers > Name**. Pondremos solo el nombre de la cuenta en este caso
