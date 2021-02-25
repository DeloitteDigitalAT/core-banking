export const config = {
  accounts: {
    url: process.env.ACCOUNTS_HOST || "http://localhost:8080",
  },
  transactions: {
    url: process.env.TRANSACTIONS_HOST || "http://localhost:8090",
  },
};
