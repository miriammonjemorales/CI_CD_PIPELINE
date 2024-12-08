# Configurar Credenciales de Docker Hub

Este paso se ejecutará en la interfaz gráfica del Jenkins Server

Añadiremos la cuenta del Registry de Docker a donde querrámos subir las imágenes en **Manage Jenkins > Credentials > (global) > + Add Credentials**. Introducimos el:
1. Kind: Username with password
1. username: <nombre_de_usuario_personal>
1. password: <password_personal>
1. ID: docker-registry-creds (La pipeline usa este ID específico)
1. Hacemos click en **Create**
