# Cofiguración de la Pipeline

Este paso se ejecutará en la interfaz gráfica del Jenkins Server

Añadiremos la cuenta del Registry de Docker a donde querrámos subir las imágenes en **+ New Item**.

Ponemos un:
1. Nombre
1. Escogemos Pipeline
1. Hacemos click en **OK**

En la sección de **Build Triggers** marcaremos la casilla **GitHub hook trigger for GITScm polling**

En la sección de **Pipeline** seleccionaremos en Definition la opción **Pipeline script from SCM**

En el selector de **SCM** seleccionamos Git

Añadimos nuestro repositorio **https://github.com/miriammonjemorales/reto_final_python.git** al campo **Repository URL**

En **Branches to build**:
1. Modificamos `*/master` por `*/main`
1. Añadimos una Branch `*/dev`

Este último detectará los push a las ramas "main" y "dev" y ejecutará la Pipeline con su Jenkinsfile específico
