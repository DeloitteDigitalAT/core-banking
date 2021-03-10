# Core banking

This is a sample project showcasing a core banking application with microservices. It consists of the following services:

- Data access services
- Data service
- Domain service

## Data access services

The following services are part of the data access services (`data-access-services`):

- Accounts service (`accounts-service`)
- Transactions service (`transactions-service`)

The `data-access-services` sub-project is a multi-module Maven project which includes a library module (`lib`) for sharing configuration and code between the data access services.

# Development

This section describes how to get started with development for this repository.

## Required software

- Git
- JDK 11
- TBD
- IntelliJ IDEA is recommended for Java development

## Accessing the source code

The code for this project is hosted in the public github repository:
https://github.com/DeloitteDigitalAT/core-banking.git

The repo can be cloned using
- SSH key: `git clone git@github.com:DeloitteDigitalAT/core-banking.git`
- github user/pwd (deprecated):
`git clone https://github.com/DeloitteDigitalAT/core-banking.git`


## Configure static code analysis tools
- git pre-commit hook
    - Checkstyle: Used to enforce Java coding conventions and formatting specified in `/config/checkstyle/checkstyle.xml`. 
    - Linter: ESlint and Prettier for JS. 

Configuration guide is available at https://github.com/DeloitteDigitalAT/core-banking/blob/master/config/checkstyle/README.md

- Sonar

- TBD

## How to run services and db locally. Requires JDK 11+ and Docker
1) Build docker images
```
cd data-access-services
./docker-build.sh

cd ../domain-service/credit-application/
./docker-build.sh

cd ../data-service
./docker-build.sh
```

2) Run docker compose
From root directory:
```
cd devops/docker/
docker-compose up -d
```
3) Check processes to verify
```
docker ps
```
The following images should be added:
- core-banking/data-service
- core-banking/accounts-service
- core-banking/transactions-service
- core-banking/credit-application-service

4) Check endpoints
- Accounts svc: GET  http://localhost:8080/clients
- Transactions svc: GET http://localhost:8090/transactions?accountId=00286356
- GraphQL data service: http://localhost:4000/graphql
- Domain svc GET http://localhost:8070/test?clientId=B12456