# Tarea 3: Flask App en Kubernetes

## Descripción
Esta aplicación Flask es un simple "Hello, World!" que ha sido desplegada en un clúster Kubernetes utilizando Minikube. La aplicación expone un endpoint básico y demuestra cómo desplegar una aplicación de Python en un entorno contenedorizado.

## Prerrequisitos
* **Minikube:** Asegúrate de tener Minikube instalado y configurado en tu máquina.
* **kubectl:** La herramienta de línea de comandos de Kubernetes debe estar instalada.
* **Docker:** Necesitarás Docker para construir y ejecutar la imagen de la aplicación.

## Instalación y Ejecución

```sh
minikube start
```
### Aplica los manifiestos: 

```sh
kubectl apply -f deployment.yml
```

```sh
kubectl apply -f service.yml
```
### Identificación de los recursos
```sh
kubectl get deployments
```

```sh
kubectl get services
```

```sh
minikube service list
```
### Inicia el túnel:

```sh
minikube tunnel
```

### Obtén la URL del servicio:

```sh
minikube service flask-service --url
```

### Accede a la aplicación: 
> Abre un navegador y pega la URL obtenida en el paso anterior.

## Elimina los recursos
```sh
kubectl delete -f service.yml 
kubectl delete -f deployment.yml 
minikube delete    
```


## Estructura del Proyecto
> deployment.yml: Define el despliegue de la aplicación en Kubernetes.
> service.yml: Define el servicio que expone la aplicación.


## Personalización
- Imagen Docker: Puedes cambiar la imagen de Docker en el archivo deployment.yml para utilizar una imagen diferente.
- Número de réplicas: Modifica el campo replicas en deployment.yml para ajustar el número de instancias de la aplicación.
- Puerto: Cambia el puerto expuesto en los archivos de manifiesto si es necesario.