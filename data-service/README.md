# Data service

It is a Web Service with Node.js using TypeScript and GraphQL

## Install pre-commit hook for ESlint and Prettier

The project uses the following git hook (commands executed on `git commit`):

- pre-commit: Runs Prettier on all changed files from /data-sevrice/ directory. After that checking code with ESlint.

Run the following command to set up the git hooks:

```
git config core.hooksPath devops/config/hooks
```

if it does't work with message "hint: The 'devops/config/hooks/pre-commit' hook was ignored because it's not set as executable." then try to run from root of project directory. It makes the hook executable.

```
chmod +x devops/config/hooks/pre-commit
```

The git hooks can be skipped with `--no-verify`.

## Install dependencies

```
npm install
```

## Scripts

To run ESLint

```
npm run lint
```

To run Prettier

```
npm run pretty-quick
```

## Build Docker container

```
docker build -t core-banking/data-service .
```

## GraphQL queries

```
query Client($id:String!) {
  client(id:$id) {
    clientId
    firstName
    lastName
    socialSecurityNumber
    sex
    dateOfBirth
    accounts {
      accountId
      frequency
      createDate
      transactions {
        accountId
        accountIban
        type
        amount
        balance
        amount
        transId
        }
    }
  }
}

query Accounts($id:String!) {
  accounts(clientId:$id) {
    accountId
    frequency
    createDate
    transactions {
        accountId
        accountIban
        type
        amount
        balance
        amount
        transId
    }
  }
}

query Transactions($accountId:Float!) {
  transactions(accountId:$accountId) {
    accountId
    accountIban
    type
    amount
    balance
    amount
    transId
  }
}
```

### query variables

```
{
  "id":"B12456",
  "accountId": 12286356
}
```
