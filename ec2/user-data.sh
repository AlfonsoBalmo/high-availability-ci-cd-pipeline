#!/bin/bash
# Actualizar el sistema
sudo yum update -y
sudo amazon-linux-extras install docker

# Iniciar Docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# Clonar el repositorio y ejecutar la aplicación
git clone https://github.com/AlfonsoBalmo/high-availability-hiberus-challenge.git /home/ec2-user/app
cd /home/ec2-user/app

# Esperar a que la base de datos esté lista
while ! nc -z ${db_endpoint} 5432; do
  sleep 1
done

# Ejecutar el contenedor Docker
sudo docker run -d -p 80:80 -e DATABASE_URL=postgres://user:3216540@${db_endpoint}:5432/mydb your-aws-account-id.dkr.ecr.us-east-1.amazonaws.com/hiberus-repository:latest
