#!/bin/bash
set -e

# Build and verify all modules
mvn clean package

# Build containers for individual services
mvn -f ./transactions-service/pom.xml \
 spring-boot:build-image \
 -Dspring-boot.build-image.imageName=core-banking/transactions-service \
 -DskipTests
mvn -f ./accounts-service/pom.xml \
 spring-boot:build-image \
 -Dspring-boot.build-image.imageName=core-banking/accounts-service \
 -DskipTests
