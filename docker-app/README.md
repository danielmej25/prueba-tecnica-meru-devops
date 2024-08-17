# Tarea 2: Proyecto: Aplicación Web Flask Contenizada con Docker
## Descripción:

Este proyecto contiene una aplicación web simple desarrollada en Python utilizando el framework Flask. La aplicación ha sido contenizada utilizando Docker para facilitar su despliegue y portabilidad en diferentes entornos.

## Prerrequisitos
* **Docker:** Necesitarás Docker para construir y ejecutar la imagen de la aplicación. 
  
## Tecnologías Utilizadas:

* **Python:** Lenguaje de programación principal.
* **Flask:** Framework web para Python.
* **Docker:** Plataforma de contenedores para empaquetar y ejecutar aplicaciones.

## Estructura del Proyecto:

- Dockerfile: Define las instrucciones para construir la imagen de Docker.
- docker-compose.yml: Configura la aplicación y sus dependencias para ser ejecutadas en un entorno de desarrollo local.
- app.py: Contiene el código fuente de la aplicación Flask.
- requirements.txt: Lista las dependencias de Python requeridas por la aplicación.

## Instrucciones de Uso

Ejecutar la aplicación con Docker Compose:
```sh
docker-compose up --build
```

Construir la imagen de Docker:
```sh
docker build -t mi-app .
```

> Reemplaza mi-app con el nombre deseado para la imagen.

La aplicación estará accesible en http://localhost:80

### Explicación del Dockerfile:

> FROM python:3.9-slim: Utiliza una imagen base de Python 3.9 optimizada para tamaño.
> WORKDIR /app: Establece el directorio de trabajo dentro del contenedor.
> COPY requirements.txt requirements.txt: Copia el archivo requirements.txt al contenedor.
> COPY app.py app.py: Copia el archivo app.py al contenedor.
> RUN pip install --no-cache-dir -r requirements.txt: Instala las dependencias de Python.
> EXPOSE 80: Expone el puerto 80 del contenedor al host.
> CMD ["python", "app.py"]: Ejecuta el archivo app.py cuando se inicia el contenedor.


### Explicación del docker-compose.yml:

> version: Especifica la versión de la sintaxis de Docker Compose.
> services: Define los servicios de la aplicación.
> web:
> - build: Indica que se debe construir la imagen a partir del Dockerfile en el directorio actual.
> - ports: Mapea el puerto 80 del contenedor al puerto 80 del host.


## Personalización:

- Modificar la imagen base: Puedes cambiar la imagen base de Python si es necesario.
- Añadir más servicios: Si tu aplicación requiere de otros servicios (base de datos, caché, etc.), puedes definirlos en el archivo docker-compose.yml.