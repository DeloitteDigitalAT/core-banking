#!/bin/bash
mvn clean \
 spring-boot:build-image \
 -Dspring-boot.build-image.imageName=core-banking/credit-application-service
