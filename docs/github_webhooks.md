# Configurar Webhooks de GitHub

Este paso se ejecutará en la página web de Git Hub

Navegaremos a la página del repositorio para el cual queremos emitir webhooks

Iremos a **Settings > Webhooks > Add webhook**:

Los campos a rellenar son:
1. Payload URL: https://<direccion_jenkins_server>/github-webhook/
1. Content type: application/json
1. Haremos click en **Updated webhook**

A partir de ahora GitHub enviará un request de tipo POST a nuestro servidor de Jenkins (endpoint: /github-webhook/) para iniciar la pipeline.
