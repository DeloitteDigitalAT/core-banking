#!/bin/bash

print_usage() {
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
curl -s --unix-socket /var/run/docker.sock http://ping >/dev/null
status=$?
if [ "$status" == "7" ]; then
  echo '[ERROR] Docker is not running, please start docker.'
  print_usage
  exit 1
fi

echo "[INFO] Checking the current path..."
if [[ $0 != "./core-banking-bootstrap.sh" ]]; then
  echo "[ERROR] Current path is $(pwd), please run from the project root dir."
  print_usage
  exit 1
fi

echo "[INFO] Stopping containers if already running..."
docker-compose -f devops/docker/docker-compose.yml down

set -e # terminate on error ON

if [ -z "$1" ]; then
  echo "[INFO] Building images..."
  echo "[INFO] Building data-access-services images."
  cd data-access-services || (echo "[ERROR] Could not navigate to the data-access-services dir." && exit 1)
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

set +e # terminate on error OFF

check_docker_run() {
  CONTAINER_ID=$(docker ps -aqf "$2")
  if [ -z "$CONTAINER_ID" ]; then
    echo "[ERROR] Could not find $1 docker container, please run the script again."
    exit 1
  fi
}

check_docker_run "DATA_SERVICE" "name=data-service*"
check_docker_run "ACCOUNTS_SERVICE" "name=accounts-service*"
check_docker_run "TRANSACTIONS_SERVICE" "name=transactions-service*"
check_docker_run "CREDIT_APPLICATION_SERVICE" "name=credit-application-service*"

echo "[INFO] Waiting 20s for docker containers to warm up..."
sleep 20s

echo "[INFO] Docker compose started successfully."
docker ps

check_http_status() {
  curl --silent --output --connect-timeout 5 "$2"
  status=$?
  if [ "$status" -eq 28 ]; then
    echo "[ERROR] Connection to $1 timed out, please check the logs and retry."
    exit $status
  fi
  HTTP_CODE=$(curl --write-out "%{http_code}\n" "$2" --output output.txt --silent)
  if [[ ${HTTP_CODE} == "5"* ]]; then
    echo "[ERROR] Received a 5XX ($HTTP_CODE )response from the $1, check the logs and retry the script."
  fi
}

echo "[INFO] Checking if all the services are reachable."
check_http_status "DATA_SERVICE" "http://localhost:4000/graphql"
check_http_status "ACCOUNTS_SERVICE" "http://localhost:8080/clients"
check_http_status "TRANSACTIONS_SERVICE" "http://localhost:8090/transactions?accountId=00286356"
check_http_status "CREDIT_APPLICATION_SERVICE" "http://localhost:8070/api/test?clientId=B12456"

echo "[INFO] Bootstrap of services and db's complete."
