#!/bin/bash

echo "Construindo os serviços..."
docker-compose build --no-cache

echo "Iniciando todos os serviços..."
docker-compose up -d

echo "Aguardando os serviços estarem prontos..."
sleep 15

echo "Iniciando a aplicação CLI interativamente..."
docker exec -it contact_manager_app bundle exec ruby bin/menu.rb