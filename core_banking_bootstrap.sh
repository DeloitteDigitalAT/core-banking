#!/bin/bash

function print_usage() {
  echo "[INFO]        Usage:"
  echo "[INFO]              ./core_banking_bootstrap.sh [skipBuild]"
  echo "[INFO]              skipBuild: optional flag to skip images build"
  echo "[INFO]        Note: 1) must be run from the project root dir"
  echo "[INFO]              2) docker must be running"
}

if [[ -n "$1" && "$1" != "skipBuild" ]]; then
  echo "[ERROR] Unknown flag $1."
  print_usage
  exit 1
fi

echo "[INFO] Checking if docker daemon is running..."
rep=$(curl -s --unix-socket /var/run/docker.sock http://ping >/dev/null)
status=$?
if [ "$status" == "7" ]; then
  echo '[ERROR] docker is not running, please start docker.'
  print_usage
  exit 1
fi

echo "[INFO] Checking the current path..."
path=$(pwd)
if [[ ${path} != *"core-banking" ]]; then
  echo "[ERROR] Current path ${path}, please run from the project root dir .../../core-banking."
  print_usage
  exit 1
fi

echo "[INFO] Stopping containers if already running..."
docker-compose -f devops/docker/docker-compose.yml down

if [ -z "$1" ]; then
  echo "[INFO] Building images..."
  echo "[INFO] Building data-access-services images."
  cd data-access-services || (echo "[ERROR] Could not navigate to the data-access-services dir." && exit 1 )
  ./docker-build.sh
  echo "[INFO] Building credit-application-service image."
  cd ../domain-service/credit-application/ || (echo "[ERROR] Could not navigate to the credit-application dir." && exit 1)
  ./docker-build.sh
  echo "[INFO] Building data-service image."
  cd ../../data-service || (echo "[ERROR] Could not navigate to the data-service dir." && exit 1)
  ./docker-build.sh
  cd .. || (echo "[ERROR] Could not navigate to the project root dir." && exit 1)
fi

echo "[INFO] Starting docker containers..."
docker-compose -f devops/docker/docker-compose.yml up -d
DATA_SERVICE_ID=$(docker ps -aqf "name=data-service*")
ACCOUNTS_SERVICE_ID=$(docker ps -aqf "name=accounts-service*")
TRANSACTIONS_SERVICE_ID=$(docker ps -aqf "name=transactions-service*")
CREDIT_APPLICATION_SERVICE_ID=$(docker ps -aqf "name=credit-application-service*")
if [ -z "$DATA_SERVICE_ID" ]; then
  echo "[ERROR] Could not find data service docker container, please run the script again."
  exit 1
fi

if [ -z "$ACCOUNTS_SERVICE_ID" ]; then
  echo "[ERROR] Could not find accounts service docker container,  please run the script again."
  exit 1
fi

if [ -z "$TRANSACTIONS_SERVICE_ID" ]; then
  echo "[ERROR] Could not find transactions service docker container,  please run the script again."
  exit 1
fi

if [ -z "$CREDIT_APPLICATION_SERVICE_ID" ]; then
  echo "[ERROR] Could not find credit application service docker container,  please run the script again."
  exit 1
fi

echo "[INFO] Waiting for docker containers to warm up..."
sleep 5s

echo "[INFO] Docker compose started successfully."
echo "[INFO] Bootstrap of services and db's complete."
docker ps
