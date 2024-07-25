#!/bin/bash

# Atualiza pacotes
apt-get update  # Atualiza a lista de pacotes disponíveis

# Instala Docker
apt-get install -y docker.io  # Instala o Docker
systemctl start docker        # Inicia o serviço Docker
systemctl enable docker       # Habilita o Docker para iniciar automaticamente no boot

# Instala Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  # Baixa o Docker Compose
chmod +x /usr/local/bin/docker-compose  # Torna o Docker Compose executável

# Cria o diretório para o Docker Compose
mkdir -p /home/adminuser/docker  # Cria o diretório onde o arquivo docker-compose.yml será armazenado

# Cria o arquivo docker-compose.yml
cat <<EOF > /home/adminuser/docker/docker-compose.yml
version: '3.7'

services:
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
      MYSQL_DATABASE: wordpress
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    image: wordpress:latest
    depends_on:
      - db
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_DB_USER: user
      WORDPRESS_DB_PASSWORD: password
    volumes:
      - wordpress_data:/var/www/html

volumes:
  db_data:
  wordpress_data:
EOF

# Navega para o diretório e inicia o Docker Compose
cd /home/adminuser/docker  # Muda para o diretório onde o docker-compose.yml está localizado
docker-compose up -d  # Inicia os containers definidos no docker-compose.yml em segundo plano
