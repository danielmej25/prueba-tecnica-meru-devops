# Tarea 1: Configuración de Infraestructura en AWS usando Terraform
## Descripción del Proyecto
Este proyecto utiliza Terraform para automatizar la creación de una infraestructura básica en AWS. Se despliega una instancia EC2 con AWS Linux, un grupo de seguridad para permitir el acceso SSH y HTTP, y una dirección IP pública asignada a la instancia.

## Objetivos

Automatización: Reducir el tiempo y el esfuerzo necesarios para configurar manualmente la infraestructura en AWS.

Reutilización: Crear un código de Terraform modular y reutilizable para desplegar múltiples instancias con diferentes configuraciones.

Gestión de entornos: Permitir la gestión de múltiples entornos (desarrollo, stage  y producción) mediante variables y archivos de configuración separados.

## Prerrequisitos

* **Cuenta de AWS:** Con credenciales de acceso (key ID y secret key).
* **Terraform:** Instalado en tu máquina local. Puedes descargarlo desde https://learn.hashicorp.com/tutorials/terraform/install-cli.

## Estructura del Proyecto

-  main.tf: Define los recursos de AWS a crear (instancia EC2, grupo de seguridad, etc.).

- variables.tf: Define las variables que se pueden personalizar para diferentes entornos (tipo de instancia, AMI, etc.).

- ./environment: Contiene los archivos .tfvars que establecen los valores de las variables para cada entorno.

## Instrucciones de Uso

Inicializar Terraform:

```sh
terraform init
```

Validar la configuración:


```sh
terraform validate
```
Crear un plan de ejecución:

```sh
terraform plan -var-file=environment/dev/env.dev.tfvars -out=dev -input=false
```
> Nota: Reemplaza path por el path del entorno deseado.

Aplicar los cambios:

```sh
terraform apply dev
```

> Nota: Reemplaza dev por el nombre del entorno deseado.

Destrucción del Entorno

Para eliminar la infraestructura creada:

  

```sh
terraform destroy -var-file="environment/dev/env.dev.tfvars" -auto-approve
```


## Mejoras Futuras

- Itegración CI/CD: Automatizar los despliegues utilizando herramientas como Jenkins o GitHub Actions.

- Módulos personalizados: Crear módulos de Terraform para encapsular componentes comunes y reutilizarlos.

- Pruebas unitarias: Implementar pruebas para garantizar la calidad del código de Terraform.

- Gestión de estados: Utilizar un backend de estado remoto (S3, DynamoDB) para mejorar la colaboración y la seguridad.