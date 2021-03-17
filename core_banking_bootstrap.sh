#!/bin/bash

echo "Checking if docker daemon is running..."
rep=$(curl -s --unix-socket /var/run/docker.sock http://ping > /dev/null)
status=$?
if [ "$status" == "7" ]; then
    echo 'docker not running..'
    exit 1
fi

echo "Stopping containers if already running..."
cd ~/IdeaProjects/core-banking/
docker-compose -f devops/docker/docker-compose.yml down

echo "Building images..."
cd ~/IdeaProjects/core-banking/
echo "Building data-access-services images."
cd data-access-services
./docker-build.sh
echo "Building credit-application-service image."
cd ../domain-service/credit-application/
./docker-build.sh
echo "Building data-service image."
cd ../../data-service
./docker-build.sh

echo "Starting docker containers..."
cd ~/IdeaProjects/core-banking/
docker-compose -f devops/docker/docker-compose.yml up -d
NAMENODE_DOCKER_ID=$(docker ps -aqf "name=docker_namenode")
HIVE_SERVER_DOCKER_ID=$(docker ps -aqf "name=docker_hive-server")
if [ -z "$NAMENODE_DOCKER_ID" ]; then
  echo "Could not find namenode docker container, please check if you have docker running."
fi

if [ -z "$HIVE_SERVER_DOCKER_ID" ]; then
  echo "Could not find hive server docker container, please check if you have docker running."
fi
echo "Docker compose started successfully"

echo "Waiting for docker containers to warm up..."
sleep 5s

echo "Bootstrap of services and db's complete."