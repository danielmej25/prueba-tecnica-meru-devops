# Tarea 4: Configuración de Red y Seguridad en Linux

## Configuración de Reglas de Firewall con IPTables

Este documento describe los pasos necesarios para configurar reglas de firewall en un sistema basado en Linux usando `iptables`, con el objetivo de permitir tráfico solo en los puertos 22 (SSH) y 80 (HTTP).

### Pasos de Configuración

1. **Actualizar el sistema:**
   ```sh
   sudo yum update -y
   ```

2. **Instalar iptables-services:**
   ```sh
   sudo yum install -y iptables-services
   ```

3. **Verificar la versión de iptables:**
   ```sh
   sudo iptables --version
   ```

4. **Listar las reglas actuales de iptables:**
   ```sh
   sudo iptables -L
   ```

5. **Limpiar las reglas existentes en la cadena INPUT:**
   ```sh
   sudo iptables -F INPUT
   ```

6. **Permitir tráfico en el puerto 22 (SSH):**
   ```sh
   sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
   ```

7. **Permitir tráfico en el puerto 80 (HTTP):**
   ```sh
   sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
   ```

8. **Permitir tráfico en la interfaz de loopback (localhost):**
   ```sh
   sudo iptables -A INPUT -i lo -j ACCEPT
   ```

9. **Permitir conexiones establecidas y relacionadas**
   ```sh
   sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
   ```

0. **Establecer la política predeterminada de la cadena INPUT para denegar el tráfico:**
   ```sh
   sudo iptables -P INPUT DROP
   ```

1. **Guardar las reglas de iptables:**
   ```sh
   sudo service iptables save
   ```

2. **Reiniciar el servicio de iptables para aplicar los cambios:**
   ```sh
   sudo systemctl restart iptables
   ```

3. **Verificar las reglas configuradas:**
   ```sh
   sudo iptables -L -v -n
   ```


## Configuración de SSH para permitir solo acceso con claves SSH

Este documento describe los pasos para configurar el servidor SSH en una instancia de Linux para permitir solo el acceso con claves SSH y deshabilitar la autenticación por contraseña.

### Pasos de Configuración

1. **Verificar la configuración actual de SSH:**
   ```sh
   sudo sshd -T | grep -E 'passwordauthentication|challengeResponseAuthentication'
   ```

   > Si ambas opciones están configuradas como no, no es necesario realizar más cambios. De lo contrario, sigue los pasos a continuación.

2. **Eliminar configuraciones anteriores de sshd_config:**
   ```sh
   sudo sed -i '/^PasswordAuthentication /d' /etc/ssh/sshd_config
   sudo sed -i '/^ChallengeResponseAuthentication /d' /etc/ssh/sshd_config
   ```

3. **Agregar nuevas configuraciones:**
   ```sh
   echo "PasswordAuthentication no" | sudo tee -a /etc/ssh/sshd_config
   echo "ChallengeResponseAuthentication no" | sudo tee -a /etc/ssh/sshd_config
   ```

4. **Verificar la configuración actualizada:**
   ```sh
   sudo sshd -T | grep -E 'passwordauthentication|challengeresponseauthentication'
   ```

5. **Reiniciar el servicio SSH:**
   ```sh
   sudo systemctl restart sshd
   ```

## Configuración de Nginx como Proxy Inverso en Amazon Linux para una Aplicación en Docker
El siguiente documento describe los pasos necesarios para instalar y configurar Nginx como un proxy inverso en una instancia EC2 de Amazon Linux. El proxy inverso redirige el tráfico HTTP al puerto 80 de una aplicación web que se ejecuta dentro de un contenedor Docker.

## Prerrequisitos
* **Una instancia EC2 con Amazon Linux(Creada en la Tarea 1)**
* **Acceso SSH a la instancia**

### Pasos de Configuración 
1. **Instalación de Docker**
   ```sh
   sudo yum update -y
   sudo yum install docker -y
   sudo service docker start
   sudo usermod -a -G docker ec2-user
   ```

2. **Ejecución de la Aplicación Web en Docker**
   ```sh
   sudo docker pull danielmej25/flask-app:latest
   sudo docker run -d -p 8080:80 danielmej25/flask-app:latest
   ```
   Verifica que el contenedor esté en funcionamiento:
   ```sh
   sudo docker ps
   ```

3. **Instalación de Nginx**
   ```sh
   sudo yum install nginx -y
   ```

4. **Configuración de Nginx como Proxy Inverso**
   ```sh
   sudo nano /etc/nginx/nginx.conf
   ```
   Reemplaza o agrega la siguiente configuración en el bloque server:

   ```sh
   server {
       listen 80;
       server_name your_domain_or_IP;
   
       location / {
           proxy_pass http://localhost:8080;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
       }
   }
   ```
   Guarda y cierra el archivo.

5. **Reinicio de Nginx**
   ```sh
   sudo systemctl restart nginx
   ```

6. **Verificación**
   ```plaintext
   http://${instance_ec2_public_ip}
   ```
