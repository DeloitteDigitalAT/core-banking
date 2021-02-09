# Core banking

This is a sample project showcasing a core banking application with microservices. It consists of the following (1) services:

- Transaction service (`core-banking-transactions`)

The project itself is a multi-module Maven project which includes a library module (core-banking-lib) for sharing configuration and code between the microservices.

TODO: Once the data schema and names have been decided this list needs to be updated. Currently, it only includes the transaction service for showing how the multi-module Maven project is set up. Therefore, when adding new services most of the `pom.xml` of the transaction service can be taken over.
