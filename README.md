# Core banking

This is a sample project showcasing a core banking application with microservices. It consists of the following services:

- Data access services
- Data service
- Domain service

## Data access services

The following services are part of the data access services (`data-access-services`):

- Transaction service (`core-banking-transactions`)

The `data-access-services` sub-project is a multi-module Maven project which includes a library module (core-banking-lib) for sharing configuration and code between the data access services.

TODO: Once the data schema and names have been decided this list needs to be updated. Currently, it only includes the transaction service for showing how the multi-module Maven project is set up. Therefore, when adding new services most of the `pom.xml` of the transaction service can be taken over.
