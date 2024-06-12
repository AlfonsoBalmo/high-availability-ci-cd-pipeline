#!/bin/bash
# Actualizar el sistema
sudo yum update -y

# Instalar Docker
sudo amazon-linux-extras install docker -y

# Iniciar Docker
sudo service docker start

# Agregar el usuario ec2-user al grupo docker
sudo usermod -a -G docker ec2-user

# Descargar e iniciar la imagen de Docker de la aplicación
AWS_ACCOUNT_ID=471112872744
AWS_REGION=us-east-1
ECR_REPOSITORY=hiberus-repository
DB_ENDPOINT=challenge-hiberus.ctaag8q2kzwr.us-east-1.rds.amazonaws.com:5432

sudo docker run -d -p 80:80 -e DATABASE_URL=postgres://user:3216540@$DB_ENDPOINT/mydb $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:latest
