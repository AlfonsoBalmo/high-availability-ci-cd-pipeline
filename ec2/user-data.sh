#!/bin/bash
# Actualizar el sistema
yum update -y

# Instalar Docker
yum install -y docker

# Iniciar Docker
service docker start

# Agregar el usuario ec2-user al grupo docker
usermod -a -G docker ec2-user

# Descargar e iniciar la imagen de Docker de la aplicación
docker run -d -p 80:80 471112872744.dkr.ecr.us-east-1.amazonaws.com/hiberus-repository:latest

