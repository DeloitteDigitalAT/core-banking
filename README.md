# Core banking

Showcasing legacy system integration for a core banking application based on microservices. 

## Introduction

This repository contains a sample core banking application architecture, demonstrating legacy database system integration using flexible, resilient and scalable components. The services used for data access are providing a standard query interface over several legacy data systems, unifying the method of access regardless of the original database technologies, storage format, physical location and configurational details involved.

The sample use-case built on this architecture is a retail banking web application used by back-office agents for credit rating of prospective clients. The application is using (semi)automated checks based on data supplied by applicants as well as pulling data from the legacy systems (e.g. CRM, transactions database).

## Architectural overview

![core-banking-architecture](https://github.com/DeloitteDigitalAT/core-banking/blob/master/docs/core-banking-architecture.png)

**Domain services**

- `credit-application-frontend` is the frontend of the sample web application (credit rating)

- `credit-application-service` is a service implementing domain logic (credit rating business rules) using domain data and legacy data accessed via `data-service`

**Domain data**

- `credit-application-db` stores personal information of applicants (clients) and their request for credit
- `documents` is a static file storage containing submitted personal documents

**Legacy data access**

These components are responsible for aggregating and serving legacy data coming from multiple source systems by providing a flexible GraphQL query interface for the domain layer.

- `data-service` is the aggregator of the source system's data based on Apollo GraphQL server

- `data-access-services` are responsible for serving a single data source via REST API consumed by the aggregator (`data-service`). The sample project contains implementation modules of the following data access services:
  - `accounts-service` 
  - `transactions-service`
  - `lib` is a library module for sharing configuration and code between the data access services 

**Legacy data**

Sample datasets stored in the legacy database systems.
- `accounts-db`: Client data and bank accounts
- `transactions-db`: Transaction log of the clients' accounts

## Deployment in AWS Cloud

For demonstrational purposes the project is hosted in a VPC (Virtual Private Cloud) on Amazon Web Services. Overview of the deployment is shown on the diagram below.

![core-banking-deployment](https://github.com/DeloitteDigitalAT/core-banking/blob/master/docs/core-banking-deployment.png)

The services are hosted using Elastic Container Service (ECS) in a Fargate cluster, taking advantage of using a serverless container runtime engine and its support for logging, monitoring, service discovery and auto-scaling. Public-facing services (the domain service and the web frontend) are accessible via an Application Load Balancer routing traffic to scalable service targets.

Sample domain and legacy data is hosted in managed databases in RDS, with some exceptions where the legacy database engine is not supported by RDS hence must be self-managed on Elastic Compute Cloud (EC2) instances.

Submitted documents can be easily and safely stored in Amazon S3 (Simple Static Storage) buckets.

# Development

This section describes how to get started with development for this repository.

## Required software

- Git
- Docker
- JDK 11
- Maven
- NodeJs 14.x
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
    - Checkstyle: Used to enforce Java coding conventions and formatting specified in `/devops/config/checkstyle/checkstyle.xml`. 
    - Linter: ESlint and Prettier for JavaScript. 

Configuration guide is available at https://github.com/DeloitteDigitalAT/core-banking/blob/master/devops/config/checkstyle/README.md

- Sonar

## Configure code formatting

Follow the steps of the document linked below to set up checkstyle and auto format in IntelliJ:

https://github.com/DeloitteDigitalAT/core-banking/blob/master/devops/config/checkstyle/README.md

## Run the services locally

Note: make sure that the required softwares are installed on the system (see section above)

Run the bootstrap script from root directory:
```
./core_banking_bootstrap.sh
```

Check endpoints

- accounts-service: GET  http://localhost:8080/clients
- transactions-service: GET http://localhost:8090/transactions?accountId=00286356
- GraphQL data-service: http://localhost:4000/graphql
- Domain service GET http://localhost:8070/api/test?clientId=B12456