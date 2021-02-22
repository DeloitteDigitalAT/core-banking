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
- Checksyle: used to enforce Java coding convenions and formatting specified in `/config/checkstyle/checkstyle.xml`.
Configuration guide is available at https://github.com/DeloitteDigitalAT/core-banking/blob/master/config/checkstyle/README.md
- Sonar
- TBD

## Install pre-commit hook for checkstyle, ESlint and Prettier

The project uses the following git hook (commands executed on `git commit`):

- pre-commit: Runs mvn checkstyle on java modules (data-access-service and domain-service) and ESlint along with Prettier on all changed JS files (data-service).

Run the following command to set up the git hooks:

```
git config core.hooksPath config/hooks
```

if it does't work with message "hint: The 'config/hooks/pre-commit' hook was ignored because it's not set as executable." then try to run from root of project directory. It makes the hook executable.

```
chmod +x config/hooks/pre-commit
```

The git hooks can be skipped with `--no-verify`.

