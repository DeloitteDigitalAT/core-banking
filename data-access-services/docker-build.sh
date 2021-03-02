#!/bin/bash
set -e

# $1 - Optional parameter to define which container to build
#       DEFAULT: all
#       'transactions-service'
#       'accounts-service'

# Build and verify all modules
mvn clean install

# Build containers for individual services

if [ "$1" = "transactions-service" ] || [ -z "$1" ]; then
    echo "Build core-banking/transactions-service"
    mvn -f ./transactions-service/pom.xml \
    spring-boot:build-image \
    -Dspring-boot.build-image.imageName=core-banking/transactions-service \
    -DskipTests
 fi

if [ "$1" = "accounts-service" ] || [ -z "$1" ]; then
    echo "Build core-banking/accounts-service"
    mvn -f ./accounts-service/pom.xml \
    spring-boot:build-image \
    -Dspring-boot.build-image.imageName=core-banking/accounts-service \
    -DskipTests
fi
