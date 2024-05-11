#!/bin/bash

echo "Parando os serviços..."
docker-compose stop

echo "Removendo containers..."
docker-compose rm -f